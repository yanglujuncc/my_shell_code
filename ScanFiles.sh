#!/bin/sh
function scanDir(){
	for filename in `ls $1`
	do
	if [ -d $1'/'$filename ]
	then 
	   echo Dir $1'/'$filename
	else
	    echo $filename
	fi
	done
}

read file
scanDir $file
