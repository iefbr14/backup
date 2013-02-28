#!/bin/bash

set -e

if [ ! -d "bin" ] ; then
	echo "Please run in your backup directory."
	exit 1
fi

PATH=`pwd`/bin:$PATH

echo "Start: $(date)";

DOW=`date +%a`

if [ ! -d Logs ] ; then
	mkdir Logs
fi

if [ ! -d Old ] ; then
	mkdir Old
fi

if mv -f Logs/$DOW* Old/ ; then
	:
fi

if [ "$DOW" = 'Sun' ] ; then
	clean-up 2>&1 | tee "Logs/$DOW=Clean-Up.log"
fi

if [ $# -eq 0 ] ; then
	set -- *.*.*
fi

for HOST in "$@" ; do 
 (
	echo "Start: $HOST $(date)";
	guard-cmd -w -l backup bin/rdiff-machine "$HOST"
	echo "Finished: $HOST $(date)";
 ) 2>&1 | tee Logs/"$DOW.$HOST"
done

echo "Finished: $(date)";
