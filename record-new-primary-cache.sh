#!/bin/bash

# records a new primary cache for continuously-cache-processed-stats-and-record-new.sh

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


# record at most 2500 MB worth of files
ionice -c 3 nice -n 19 bash "$scriptdirname/vmtouch_cache_save_load/vmtouch_save_state.sh" "$tmpdir/vmtouch_state_exec_primary.sh" 20000 2500 >>"$tmpdir/log_continually-cache-processed-stats-and-record-new.txt" 2>&1 

