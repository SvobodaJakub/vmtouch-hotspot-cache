#!/bin/bash

# records a new boot-early cache for vmtouch_hotspot_preload_boot_early.service

origdir=$( pwd ; )

# read temporary dir
tmpdir="$1"
cd "$tmpdir" || { echo "cannot cd to $tmpdir !" ; exit 1 ; }

# obtain the absolute path
tmpdir=$( pwd ; )

cd "$origdir" # because of the relative "$0"
scriptname=$(basename "$0")
# relative path
scriptdirname=$(dirname "$0")
# obtain the absolute path
cd "$scriptdirname"
scriptdirname=$( pwd ; )

if echo "$tmpdir" | grep -q "'" ; then
    echo "the $tmpdir path contains the ' character; cannot proceed!"
    exit 1
fi



# record at most 600 MB worth of files
ionice -c 3 nice -n 19 bash "$scriptdirname/vmtouch_cache_save_load/vmtouch_save_state.sh" "$tmpdir/_tmp_vmtouch_state_exec_boot_early.sh" 4000 600 




echo "#!/bin/bash" > "$tmpdir/vmtouch_state_exec_boot_early.sh"
# if the path contains ' then it breaks and a bash command injection is possible
echo "date >> '$tmpdir/vmtouch_state_exec_boot_early.log'" >> "$tmpdir/vmtouch_state_exec_boot_early.sh"
echo "id >> '$tmpdir/vmtouch_state_exec_boot_early.log'" >> "$tmpdir/vmtouch_state_exec_boot_early.sh"

cat "$tmpdir/_tmp_vmtouch_state_exec_boot_early.sh" | sed -r "s'^ionice -c 3 nice -n 19 (.*)\$'\1 >> \'$tmpdir/vmtouch_state_exec_boot_early.log\' 2>\&1 '" >> "$tmpdir/vmtouch_state_exec_boot_early.sh"

chmod a+x "$tmpdir/vmtouch_state_exec_boot_early.sh"

rm -f "$tmpdir/_tmp_vmtouch_state_exec_boot_early.sh"  



