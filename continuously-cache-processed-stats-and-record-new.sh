#!/bin/bash

# pre-caches files based on past activity from recorded statistics AND records the current activity so that the cache is continuously adjusted
# it will eventually push out a random old portion of useful files out of the cache and after that, it will record them again if system actually used them

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

date >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 

vmtouch_load_primary() {
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_primary.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
}

vmtouch_load_incremental() {
    # executing from oldest to newest so that the newest data are more likely to stay in cache
    echo "vmtouch_load_incremental"   >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 



    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old79.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old78.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old77.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old76.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old75.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old74.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old73.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old72.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old71.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old70.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old69.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old68.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old67.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old66.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old65.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old64.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old63.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old62.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old61.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old60.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old59.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old58.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old57.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old56.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old55.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old54.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old53.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old52.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old51.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old50.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old49.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old48.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old47.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old46.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old45.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old44.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old43.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old42.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old41.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old40.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old39.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old38.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old37.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old36.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old35.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old34.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old33.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old32.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old31.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old30.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old29.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old28.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old27.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old26.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old25.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old24.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old23.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old22.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old21.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old20.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old19.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old18.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old17.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old16.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old15.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old14.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old13.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old12.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old11.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old10.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old09.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old08.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old07.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old06.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old05.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old04.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old03.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old02.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
    ionice -c 3 nice -n 19 bash "$tmpdir/vmtouch_state_exec_incremental-old01.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 
}

vmtouch_move_cache_fifo() {

    rm -f "$tmpdir/vmtouch_state_exec_incremental-old79.sh" || true  >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 

    mv "$tmpdir/vmtouch_state_exec_incremental-old78.sh" "$tmpdir/vmtouch_state_exec_incremental-old79.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old77.sh" "$tmpdir/vmtouch_state_exec_incremental-old78.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old76.sh" "$tmpdir/vmtouch_state_exec_incremental-old77.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old75.sh" "$tmpdir/vmtouch_state_exec_incremental-old76.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old74.sh" "$tmpdir/vmtouch_state_exec_incremental-old75.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old73.sh" "$tmpdir/vmtouch_state_exec_incremental-old74.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old72.sh" "$tmpdir/vmtouch_state_exec_incremental-old73.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old71.sh" "$tmpdir/vmtouch_state_exec_incremental-old72.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old70.sh" "$tmpdir/vmtouch_state_exec_incremental-old71.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old69.sh" "$tmpdir/vmtouch_state_exec_incremental-old70.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old68.sh" "$tmpdir/vmtouch_state_exec_incremental-old69.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old67.sh" "$tmpdir/vmtouch_state_exec_incremental-old68.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old66.sh" "$tmpdir/vmtouch_state_exec_incremental-old67.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old65.sh" "$tmpdir/vmtouch_state_exec_incremental-old66.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old64.sh" "$tmpdir/vmtouch_state_exec_incremental-old65.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old63.sh" "$tmpdir/vmtouch_state_exec_incremental-old64.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old62.sh" "$tmpdir/vmtouch_state_exec_incremental-old63.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old61.sh" "$tmpdir/vmtouch_state_exec_incremental-old62.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old60.sh" "$tmpdir/vmtouch_state_exec_incremental-old61.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old59.sh" "$tmpdir/vmtouch_state_exec_incremental-old60.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old58.sh" "$tmpdir/vmtouch_state_exec_incremental-old59.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old57.sh" "$tmpdir/vmtouch_state_exec_incremental-old58.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old56.sh" "$tmpdir/vmtouch_state_exec_incremental-old57.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old55.sh" "$tmpdir/vmtouch_state_exec_incremental-old56.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old54.sh" "$tmpdir/vmtouch_state_exec_incremental-old55.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old53.sh" "$tmpdir/vmtouch_state_exec_incremental-old54.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old52.sh" "$tmpdir/vmtouch_state_exec_incremental-old53.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old51.sh" "$tmpdir/vmtouch_state_exec_incremental-old52.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old50.sh" "$tmpdir/vmtouch_state_exec_incremental-old51.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old49.sh" "$tmpdir/vmtouch_state_exec_incremental-old50.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old48.sh" "$tmpdir/vmtouch_state_exec_incremental-old49.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old47.sh" "$tmpdir/vmtouch_state_exec_incremental-old48.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old46.sh" "$tmpdir/vmtouch_state_exec_incremental-old47.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old45.sh" "$tmpdir/vmtouch_state_exec_incremental-old46.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old44.sh" "$tmpdir/vmtouch_state_exec_incremental-old45.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old43.sh" "$tmpdir/vmtouch_state_exec_incremental-old44.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old42.sh" "$tmpdir/vmtouch_state_exec_incremental-old43.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old41.sh" "$tmpdir/vmtouch_state_exec_incremental-old42.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old40.sh" "$tmpdir/vmtouch_state_exec_incremental-old41.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old39.sh" "$tmpdir/vmtouch_state_exec_incremental-old40.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old38.sh" "$tmpdir/vmtouch_state_exec_incremental-old39.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old37.sh" "$tmpdir/vmtouch_state_exec_incremental-old38.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old36.sh" "$tmpdir/vmtouch_state_exec_incremental-old37.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old35.sh" "$tmpdir/vmtouch_state_exec_incremental-old36.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old34.sh" "$tmpdir/vmtouch_state_exec_incremental-old35.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old33.sh" "$tmpdir/vmtouch_state_exec_incremental-old34.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old32.sh" "$tmpdir/vmtouch_state_exec_incremental-old33.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old31.sh" "$tmpdir/vmtouch_state_exec_incremental-old32.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old30.sh" "$tmpdir/vmtouch_state_exec_incremental-old31.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old29.sh" "$tmpdir/vmtouch_state_exec_incremental-old30.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old28.sh" "$tmpdir/vmtouch_state_exec_incremental-old29.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old27.sh" "$tmpdir/vmtouch_state_exec_incremental-old28.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old26.sh" "$tmpdir/vmtouch_state_exec_incremental-old27.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old25.sh" "$tmpdir/vmtouch_state_exec_incremental-old26.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old24.sh" "$tmpdir/vmtouch_state_exec_incremental-old25.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old23.sh" "$tmpdir/vmtouch_state_exec_incremental-old24.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old22.sh" "$tmpdir/vmtouch_state_exec_incremental-old23.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old21.sh" "$tmpdir/vmtouch_state_exec_incremental-old22.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old20.sh" "$tmpdir/vmtouch_state_exec_incremental-old21.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old19.sh" "$tmpdir/vmtouch_state_exec_incremental-old20.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old18.sh" "$tmpdir/vmtouch_state_exec_incremental-old19.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old17.sh" "$tmpdir/vmtouch_state_exec_incremental-old18.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old16.sh" "$tmpdir/vmtouch_state_exec_incremental-old17.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old15.sh" "$tmpdir/vmtouch_state_exec_incremental-old16.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old14.sh" "$tmpdir/vmtouch_state_exec_incremental-old15.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old13.sh" "$tmpdir/vmtouch_state_exec_incremental-old14.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old12.sh" "$tmpdir/vmtouch_state_exec_incremental-old13.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old11.sh" "$tmpdir/vmtouch_state_exec_incremental-old12.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old10.sh" "$tmpdir/vmtouch_state_exec_incremental-old11.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old09.sh" "$tmpdir/vmtouch_state_exec_incremental-old10.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old08.sh" "$tmpdir/vmtouch_state_exec_incremental-old09.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old07.sh" "$tmpdir/vmtouch_state_exec_incremental-old08.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old06.sh" "$tmpdir/vmtouch_state_exec_incremental-old07.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old05.sh" "$tmpdir/vmtouch_state_exec_incremental-old06.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old04.sh" "$tmpdir/vmtouch_state_exec_incremental-old05.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old03.sh" "$tmpdir/vmtouch_state_exec_incremental-old04.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old02.sh" "$tmpdir/vmtouch_state_exec_incremental-old03.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental-old01.sh" "$tmpdir/vmtouch_state_exec_incremental-old02.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 
    mv "$tmpdir/vmtouch_state_exec_incremental.sh"       "$tmpdir/vmtouch_state_exec_incremental-old01.sh" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 || true 

}

vmtouch_save_incremental_new_small_files() {

    # create exclude list
    ionice -c 3 nice -n 19 cat "$tmpdir/vmtouch_state_exec_primary.sh" "$tmpdir/vmtouch_state_exec_incremental-old"*".sh" | nice -n 19 grep -E '^/' > "$tmpdir/vmtouch_state_exec_incremental_exclude_list.txt"

    # record at most 10 MB worth of files that are at most 4 kB in size, excluding any that are already recorded
    ionice -c 3 nice -n 19 bash "$scriptdirname/vmtouch_cache_save_load/vmtouch_save_state_incremental.sh" "$tmpdir/vmtouch_state_exec_incremental.sh" 4 10 "$tmpdir/vmtouch_state_exec_incremental_exclude_list.txt" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 

    # move the file names, delete oldest
    vmtouch_move_cache_fifo
}


vmtouch_save_incremental_new_large_files() {

    # create exclude list
    ionice -c 3 nice -n 19 cat "$tmpdir/vmtouch_state_exec_primary.sh" "$tmpdir/vmtouch_state_exec_incremental-old"*".sh" | nice -n 19 grep -E '^/' > "$tmpdir/vmtouch_state_exec_incremental_exclude_list.txt"

    # record at most 20 MB worth of files that are at most 128 kb in size, excluding any that are already recorded
    ionice -c 3 nice -n 19 bash "$scriptdirname/vmtouch_cache_save_load/vmtouch_save_state_incremental.sh" "$tmpdir/vmtouch_state_exec_incremental.sh" 128 20 "$tmpdir/vmtouch_state_exec_incremental_exclude_list.txt" >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 

    # move the file names, delete oldest
    vmtouch_move_cache_fifo
}


vmtouch_load_hold() {
    # grep all the vmtouch commands from the saved files, rewrite its arguments to be held in memory (and limit the file size to 64k), delete the output redirection to the log file, make them run in the background
    cat "$tmpdir/vmtouch_state_exec_"*".sh" | grep -E '^(ionice -c 3 nice -n 19 )?vmtouch ' | sed -r 's/^(.*)-m [0-9]*k -v -t -f/\n\n\nionice -c 3 nice -n 19 vmtouch -m 64k -t -f -L /' | sed -r 's/>>.*$//' | sed -r 's/(....*)/\1 \&/g' > "$tmpdir/tmp_hold_vmtouch_state_exec.sh"

    ionice -c 3 nice -n 19 bash "$tmpdir/tmp_hold_vmtouch_state_exec.sh" >/dev/null 2>&1 & 

    # it doesn't block but returns, the processes run in the background
}


# function called by trap
trap_quit() {
    echo ""
    echo "SIGINT caught"
    echo "Thank you for flying HDD Magnetic Heads"
    # shotgun programming but it works for sure even in high system load situations :)
    killall vmtouch
    killall vmtouch
    killall vmtouch
    killall vmtouch
    sleep 1
    killall vmtouch
    killall vmtouch
    killall vmtouch
    sleep 1
    killall -9 vmtouch
    killall -9 vmtouch
    exit 0
}

trap 'trap_quit' SIGINT


loopcount=$((0))



date

echo "loading incremental cache files"
vmtouch_load_incremental

# the preceding load makes it very likely that the following operation will be fast
echo "loading cache in memory"
vmtouch_load_hold

sleep 60

# loading all the inodes significantly speeds up some operations
# tweaking the vm settings at the beginning of the execution also makes it stick better in the cache
echo "loading directory structure"
ionice -c 3 nice -n 19 ncdu / -x -q -o /dev/null >/dev/null 2>&1 
ionice -c 3 nice -n 19 ncdu /home -x -q -o /dev/null >/dev/null 2>&1 


while true ; do

    date
    echo "loading incremental cache files"
    vmtouch_load_incremental

    echo "loading primary cache file"
    vmtouch_load_primary

    echo "sleeping for 60 mins"
    sleep 3600

    echo "recording new loaded files"
    # at most 30 MB per an hour * 40 hours (2 files per hour) == 1200 MB of cache
    # + at most 500 MB from the primary cache == 1700 MB of cache at most at any time
    vmtouch_save_incremental_new_small_files  # cache very small files (because these slow the disk down the most)
    vmtouch_save_incremental_new_large_files  # cache also larger files (random access inside larger files also slows the disk down a lot)

    echo " "
done


