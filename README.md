# vmtouch-hotspot-cache

tool to pre-cache most frequently used files on a moderately slow block device

## introduction

* these scripts are intended to be used on a linux system with an SDD to cache some of the frequent requested small files into memory before they are needed
* cached files are periodically recorded (cached == recently used)
* recordings can later be used to pre-cache the data
* traditionally, if a disk read operation is performed for the second time, it is read from cache and is fast; but if the machine has been rebooted or a large file operation flushed the cache, the same read operation will be read from disk and will be as slow as if performed for the first time
* a large portion of daily work just reads the same set of files repeatedly every day
* the idea is to find out which files are read frequently and cache them proactively so that disk operations are faster 
* it's an unpolished turd - I developed the tool in a hurry
* this is mildly useful for SSDs that are relatively slow on tiny reads (e.g. 5000 IOPS on 4k reads)
* it pre-caches the inodes after startup so that some file operations are faster (traversing through directory structure)


## technical considerations

* the tool caches only full files because I didn't find an easy enough way how to find out which pages of individual files are loaded
* only files up to certain size are cached
* small files are prefered
* if enough data are pre-cached, it will push out useful cached pages in large files, so it might slow down future operation based on the particular workload


## setup

* install `vmtouch`, `ncdu`, and `hdparm` tools (fedora: `dnf install vmtouch ncdu hdparm`)

## first recording run and systemd

* create a persistent folder where you will store the cache files (these are files that record which files were cached and can be executed to cache them again)
* restart the computer
* immediately after boot, run `record-new-boot-early-cache.sh /path/to/the/cache/folder`
* wait until it finishes
* open all your often-used programs and programs you want to start quickly
* run `record-new-primary-cache.sh /path/to/the/cache/folder`
* edit paths in the .service files
* copy the .service files into /etc/systemd/system/
* run `systemctl enable vmtouch_hotspot_preload_boot_early.service vmtouch_hotspot_preload_boot_late.service`

## second recording run and set-and-forget use

* run `continuously-cache-processed-stats-and-record-new.sh /path/to/the/cache/folder`
* if you want to stop it and release the cache forcibly held in memory, just hit ctrl-c

## loading the full cache after reboot

* prerequisite - "first recording run and systemd" has already been performed
* `vmtouch_hotspot_preload_boot_early.service` preloads boot files during the boot process, resulting in the same read data but in a sequential manner, which is much faster on a spinning HDD than the default way of booting, at least on Fedora
* `vmtouch_hotspot_preload_boot_late.service` loads all the recorded caches upon boot
* no more processes are then run and nothing recorded, unless you run the above command manually

## more info

* read the source code of everything

## security considerations

* if someone edits the cache files, they can execute anything as root on your computer!
* everything has to be run as root

## performance considerations

* no support for partially loading files - for only loading the used pages of files
* caches only the very small files because that is the only bottleneck of slow SSDs (with slow, I mean around 5000 IOPS)



