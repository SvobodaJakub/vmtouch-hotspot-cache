#!/bin/bash

# pre-caches files based on past activity from recorded statistics
# pre-caches directory and file structure on the disk

# to be run at computer startup by a systemd service or something similar


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

cd "$tmpdir"

date >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
id >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 


vmtouch_load_primary() {
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_primary.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
}

vmtouch_load_incremental() {
    # executing from oldest to newest so that the newest data are more likely to stay in cache
    echo "vmtouch_load_incremental"   >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 


    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old79.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old78.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old77.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old76.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old75.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old74.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old73.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old72.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old71.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old70.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old69.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old68.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old67.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old66.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old65.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old64.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old63.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old62.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old61.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old60.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old59.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old58.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old57.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old56.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old55.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old54.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old53.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old52.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old51.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old50.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old49.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old48.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old47.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old46.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old45.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old44.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old43.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old42.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old41.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old40.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old39.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old38.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old37.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old36.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old35.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old34.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old33.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old32.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old31.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old30.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old29.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old28.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old27.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old26.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old25.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old24.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old23.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old22.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old21.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old20.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old19.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old18.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old17.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old16.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old15.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old14.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old13.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old12.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old11.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old10.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old09.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old08.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old07.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old06.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old05.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old04.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old03.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old02.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old01.sh" >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
}

# let the rest of the computer start (assuming this is started by systemd)
sleep 10

vmtouch_load_incremental || true

vmtouch_load_primary || true

sleep 10

# pre-cache the whole directory structure
ionice -c 3 nice -n 19 ncdu / -q -o /dev/null >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 

echo "end"   >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 
date >>"$tmpdir/log-cache-processed-stats-and-exit.txt" 2>&1 

exit 0

