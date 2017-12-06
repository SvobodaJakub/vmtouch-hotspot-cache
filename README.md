# vmtouch-hotspot-cache

tool to pre-cache most frequently used files on a slow block device

## introduction

* these scripts are intended to be used on a linux system with a conventional rotating hard disk (HDD) to cache some of the frequent requested files into memory before they are needed
* cached files are periodically recorded (cached == recently used)
* recordings can later be used to pre-cache the data
* traditionally, if a disk read operation is performed for the second time, it is read from cache and is fast; but if the machine has been rebooted or a large file operation flushed the cache, the same read operation will be read from disk and will be as slow as if performed for the first time
* a large portion of daily work just reads the same set of files repeatedly every day
* the idea is to find out which files are read frequently and cache them proactively so that disk operations are faster 
* it is more convenient to start your computer, let this script run for 10 minutes (pre-caching a sizable chunk of files you are about to use) and do something else in the meantime and then return to a fast computer and do your work than to start your computer aanndd eevveerryy aaccttiioonn iiss ssoo ssllooww uunnttiill eevveerryytthhiinngg ffiinnaallyy ccaaccheess iinnttoo rraamm and that is usually the time you are about done with the work and the cache is mostly useless for today
* it's an unpolished turd - I developed the tool in a hurry being fed up with my sloooow HDD that I will use for about another year before finally buying an SSD; it does what I want and that's it; so the future for this tool is not very bright and I chose not to polish it; however, pull requests are welcome because maybe it will be immensely useful for someone else :)


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
* `vmtouch_hotspot_preload_boot_late.service` loads all the recorded caches during about 10 minutes after boot
* no more processes are then run and nothing recorded, unless you run the above command manually

## more info

* read the source code of everything

## security considerations

* if someone edits the cache files, they can execute anything as root on your computer!
* everything has to be run as root

## performance considerations

* no support for partially loading files - for only loading the used pages of files
* sizes of what is loaded might need to be changed based on the amount of RAM in your system and based on your workload
* `vmtouch` scanning for which files are cached takes several minutes of full disk activity - it might actually hurt the performance for your particular workload
* you might want to change the parameters in `tune-kernel-caching-hdd.sh`
* If you want to drastically reduce the amount of cached data, reduce not only the max amount of cached data, but also reduce the max file size to something like 64 - 256 kB. HDDs are slowest at random operations, which often includes reading small files, and the smaller, the more random.



