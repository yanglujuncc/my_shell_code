#!/bin/sh

var1=$1
var2=$2

echo "var1="$var1
echo "var2="$var2

echo "###### test [ -n \$var1 ] #######"
if  [ -n $var1 ] 
then 
	echo "test return $?==0   var1 is not emputry"
else
	echo "test retuen $?=0   var1 is  emputry"
fi

echo "###### test [ -z \$var1 ] #######"
if  [ -z $var1 ] 
then 
	echo "test retuen ==0   var1 is  emputry"
else
	echo "test return !=0   var1 is not emputry"
fi

echo "###### digital compare.... #######"

echo  -n "digital compare(-gt):"

if  [ $var1 -gt $var2 ] 
then 
	echo "var1 bigger"
else
	echo "var2 bigger"
fi


echo  -n "digital compare(-lt):"

if  [ $var1 -lt $var2 ] 
then 
	echo "var2 bigger"
else
	echo "var1 bigger"
fi


echo "###### string compare.... #######"
echo  -n "string compare(>):"

if  [ $var1 \> $var2 ] 
then 
	echo "var1 bigger"
else
	echo "var2 bigger"
fi
echo  -n "string compare(<):"

if  [ $var1 \< $var2 ] 
then 
	echo "var2 bigger"
else
	echo "var1 bigger"
fi

