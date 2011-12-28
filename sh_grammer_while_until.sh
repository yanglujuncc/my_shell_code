#!/bin/sh

var1=$1
count=0
if [ -z $1 ]
then
	var1=100
fi
echo "********** while ***********"
echo "while \[ \$var1 \-gt 0\] "
echo "do ... done"
while [ $var1 -gt 0 ]
do
	count=$[ $count + 1 ]
	echo "loop:$count , var1=$var1 "
	var1=$[ $var1 - 1]
	
done

var1=$1
count=0
echo "********** until ***********"
echo "until \[ \$var1 \-le 0\] "
echo "do ... done"
until [ $var1 -le 0 ]
do
	count=$[ $count + 1 ]
	echo "loop:$count , var1=$var1 "
	var1=$[ $var1 - 1]
	
done
