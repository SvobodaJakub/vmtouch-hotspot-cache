#!/bin/bash

# exit on empty variables
set -u

# exit on non-zero status
set -e

# this should be run as root probably

# usage:
# param 1 - name of output script
# param 2 - file size limit in kB
# param 3 - cache size limit in MB
# param 4 - name of file that lists paths to exclude

LIMITFILESIZEKB=$2
LIMITMEMORYUSEMB=$3


origdir=$( pwd ; )
# get absolute path to the output file
cd $(dirname "$1" )
outfiledir=$( pwd ; )
outfile=${outfiledir}/$(basename "$1")
cd "$origdir"

# get absolute path to the exclude file
cd $(dirname "$4" )
exclfiledir=$( pwd ; )
exclfile=${exclfiledir}/$(basename "$4")
cd "$origdir"

scriptname=$(basename "$0")
# relative path
scripdirname=$(dirname "$0")
# obtain the absolute path
cd "$scripdirname"
scripdirname=$( pwd ; )

cd "$outfiledir"

rm -f tmp_vmtouch_out.txt || true
# specifying /home first, then the other dirs, and / last so that when something is symlinked from /proc, it breaks and skips inside /proc and not inside the primary paths
ionice -c 3 nice -n 19 vmtouch -f -v -m "$LIMITFILESIZEKB"k /home /usr /etc /var /  > tmp_vmtouch_out.txt 2>/dev/null
ionice -c 3 nice -n 19 tail -n 4 tmp_vmtouch_out.txt 
ionice -c 3 nice -n 19 python3 "$scripdirname"/parse_vmtouch_incremental.py --target-mb "$LIMITMEMORYUSEMB" --limit-file-kb "$LIMITFILESIZEKB" --exclude-file-list "$exclfile" --vmtouch-output-file tmp_vmtouch_out.txt > "$outfile"
rm -f tmp_vmtouch_out.txt || true


