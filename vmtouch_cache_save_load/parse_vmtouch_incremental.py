#! /usr/bin/env python

# source: https://gist.github.com/mikeyk/1424540
# taken from the source and modified
# publicly linked from http://instagram-engineering.tumblr.com/post/13649370142/what-powers-instagram-hundreds-of-instances
# as of 2017-11-07, I didn't find it through search in "mikeyk"'s repos so I didn't find a license

# use:
# sudo vmtouch -f -v -m 20000k /  > vmtouch_out.txt
# python3 parse_vmtouch.py vmtouch_out.txt > vmtouch_load_exec.txt
# sudo bash vmtouch_load_exec.txt


import fileinput
import argparse
from operator import itemgetter
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('--target-mb', action = 'store', dest = 'target_mb', default = 3000, type = int, help = "Limit (in MB) how much data will be recorded for caching (how much memory the cached files take in total).")
parser.add_argument('--limit-file-kb', action = 'store', dest = 'limit_file_kb', default = 20000, type = int, help = "Limit (in kB) the size of an individual cached file (do not try to cache files that are larger than that).")
parser.add_argument('--vmtouch-output-file', action = 'store', dest = 'vmtouch_output_file', required=True, help = "File that contains the output of 'vmtouch -f -v -m 12345k /'. It will be processed and the top most completely cached files up to the '--target-mb' limit will be recorded for future caching.")
parser.add_argument('--exclude-file-list', action = 'store', dest = 'exclude_file_list', required=False, help = "Optional file with paths (one path per line, it has to have the EXACT same format as what is in '--vmtouch-output-file' (e.g. if every path begins with '//' in --vmtouch-output-file, it has to begin with '//' here as well) that will be excluded from the calculation and from the output.")
args = parser.parse_args()

exclude_paths = set()
if args.exclude_file_list:
    for line in open(args.exclude_file_list):
        path = line.strip()
        exclude_paths.add(path)
        # sometimes vmtouch outputs the path with two and sometimes with one leading slash, so also add the second variant
        if path.startswith("//"):
            # already added //, so add /
            exclude_paths.add(path[1:])
        else:
            # already added /, so add //
            exclude_paths.add("/" + path)

entries = []
already_filed_files = set()
last_fl_name = None
for line in open(args.vmtouch_output_file):
    line = line.strip()
    if line.startswith('['):
        # this is a mem info row
        if not last_fl_name:
            continue
        if last_fl_name in exclude_paths:
            continue
        if any([
            last_fl_name.startswith("//media/"),
            last_fl_name.startswith("//mnt/"),
            last_fl_name.startswith("//dev/"),
            last_fl_name.startswith("//proc/"),
            last_fl_name.startswith("//sys/"),
            last_fl_name.startswith("//run/"),
            last_fl_name.startswith("//tmp/"),
            last_fl_name.startswith("//var/tmp/"),
            last_fl_name.startswith("//var/run/"),
            last_fl_name.startswith("/media/"),
            last_fl_name.startswith("/mnt/"),
            last_fl_name.startswith("/dev/"),
            last_fl_name.startswith("/proc/"),
            last_fl_name.startswith("/sys/"),
            last_fl_name.startswith("/run/"),
            last_fl_name.startswith("/tmp/"),
            last_fl_name.startswith("/var/tmp/"),
            last_fl_name.startswith("/var/run/"),
        ]):
            continue
        currently_paged_percent = line.rsplit(' ', 1)[-1]
        num, denom = map(float, currently_paged_percent.split('/'))
        if not num or num < 0.1:
            # do not register non-loaded files
            continue
        if num and denom:
            bytes = denom * 4096
            mb = bytes / (1024 * 1024)
            size_ratio = float(mb) / ( float(args.limit_file_kb) / 1024.0 )  # maximum allowed size == 1.0, minimum allowed size == nearly 0, zero size == 0
            priority_bump_down_ratio = 1.0 - ( size_ratio / 10.0 )  # maximum allowed size == 0.9, minimum allowed size == nearly 1.0, zero size == 1.0
            load_ratio = num / denom  # fully loaded file == 1.0, non-loaded file == 0.0
            priority = load_ratio * priority_bump_down_ratio  # so that the biggest allowed file is 10% less prioritized as compared to the smallest file that is just as loaded
            if not last_fl_name in already_filed_files:
                entries.append((last_fl_name, priority, mb))
                already_filed_files.add(last_fl_name)
    elif line.startswith('.') or line.startswith('/'):
        last_fl_name = line

sorted_entries = sorted(entries, key = itemgetter(1), reverse = True)
loaded_mb = 0

to_page_in_simple = []
for entry in sorted_entries:
    if loaded_mb <= args.target_mb:
        loaded_mb += entry[-1]
        path = entry[0]
        to_page_in_simple.append(path)
        print("# loaded {} MB already, loading {} MB, prio {}, path {}".format(str(loaded_mb), str(entry[-1]), str(100.0 * entry[1]), str(entry[0])))

# if the sorting according to LBA is removed, then it is best to at least reverse the order of the files so that the files with the highest priority are loaded last and will last in the cache the longest
# to_page_in_simple = reversed(to_page_in_simple)

files_lba = []
files_error = []
# go through each file and get the LBA of its beginning, so that they can be sorted for more linear loading
for file_path in to_page_in_simple:
    p = subprocess.Popen(["hdparm", "--fibmap", file_path], stdout=subprocess.PIPE, shell=False)
    (output, err) = p.communicate()
    p_status = p.wait()
    if p_status != 0:
        files_error.append(file_path)
        continue
    byte_offset_line_found=False
    for line in output.decode("utf-8").split("\n"):
        if byte_offset_line_found:
            # the first lba (not interested in potential other blocks of the file)
            lba = line.split()[1]
            try:
                lba_int = int(lba)
                files_lba.append((lba_int, file_path))
            except:
                pass
            break
        if line.strip().startswith("byte_offset"):
            byte_offset_line_found=True

sorted_files_lba = sorted(files_lba, key = itemgetter(0))

to_page_in_simple = []
for path in files_error:
    to_page_in_simple.append(path)
for lba, path in sorted_files_lba:
    print("# lba {} of file {}".format(str(lba), str(path)))
    to_page_in_simple.append(path)

to_page_in = []
for path in to_page_in_simple:
    # bash strings can be composed of multiple strings immediately to each other - var="this i""s a si"'ngle string' and var="this is a single string" are the same thing
    # in bash, the only way to escape out of '' is to have another ' in the string - single quotes are used for "strong quoting" where nothing except ' is interpreted
    path = path.replace("""'""", """'"'"'""")  # a single ' becomes '"'"' - that is an ending string quote, a beginning string double quote, a quote literal (the string), an ending string double quote, a beginning string quote
    path = "'{}'".format(path)  # the string is enclosed in quotes
    to_page_in.append(path)

print("ionice -c 3 nice -n 19 vmtouch -m {}k -v -t -f {}".format(str(args.limit_file_kb), " ".join(to_page_in)))
print("")
print("exit 0")
print("# a list of files follows (the same files but in a simple format on file per line)")
for path in to_page_in_simple:
    print(path)
print("")


