#!/bin/sh

dir=$1
output=$2

if [ -z $dir ]
then
        echo "please input raw_record file as argment:1"
	exit 1
fi

if [ -z $output ]
then
        echo "please input raw_record file as argment:2"
	exit 1
fi

if [ -e $dir ]
then
        echo "check input file ok"
else
        echo "input raw_record file as don't exist!!"
        exit 1
fi

if [ -e $output ]
then
        echo "check output file ok"

else
        echo "output file don't exist"
        echo "creat file :$outputfile"
        touch $dir'/'$output
fi


for filename in `ls $dir`
do

if [ -d $dir'/'$filename ]
then
	echo Dir $dir'/'$filename
else
	echo "translate.....file:$filename"
	sh translateDateFormate.sh $dir'/'$filename $dir'/'$output	
fi

done
