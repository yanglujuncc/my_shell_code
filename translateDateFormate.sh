#!/bin/sh

function RewriteRecord {

		local rawrecord=$1

		echo -e  $rawrecord
		
		local username=`echo -e $rawrecord |cut  -f 1`
		local production=`echo -e $rawrecord |cut  -f 2`
		local score=`echo -e $rawrecord |cut -f 3`
		local record_date=`echo -e $rawrecord |cut -f 4`

		#echo "username=$username"
		#echo "production=$production"
		#echo "score=$score"
		#echo "record_date=$record_date"

		local record_timestamp=`date -d "$record_date" +"%s"`
		local newrecord=$username'\t'$production'\t'$score'\t'$record_timestamp

		echo -e  $newrecord
		#return $newrecord
}

inputfile=$1
outputfile=$2
rawrecord="nicky1017\t00-C02-327\t5.0\t2011-10-26 20:05"



if [ -z $inputfile ]
then 
	echo "please input raw_record file as argment:1"
fi

if [ -z $outputfile ]
then 
	echo "please input raw_record file as argment:2"
fi

if [ -e $inputfile ]
then 
	echo "check input file ok"
else
	echo "input raw_record file as don't exist!!"
	exit 1	
fi

if [ -e $outputfile ]
then 
	echo "check output file ok"

else
	echo "output file don't exist"
	echo "creat file :$outputfile"
	touch $outputfile
fi

line=0
echo $rawrecord
#anewrecord=`RewriteRecord "$rawrecord"`
#echo -e $anewrecord

while [ 1 -eq 1 ]
do

line=$[ $line + 1 ] 
sedargs=$line'p';
echo "line :"$sedargs
rawrecord=`sed -n "$sedargs" $inputfile`

if [ -z "$rawrecord" ];then
echo "translate format complete!.."
exit 0
fi

username=`sed -n "$sedargs" $inputfile |cut  -f 1`
production=`sed -n "$sedargs" $inputfile |cut  -f 2`
score=`sed -n "$sedargs" $inputfile |cut -f 3`
record_date=`sed -n "$sedargs" $inputfile |cut -f 4`

#echo "username=$username"
#echo "production=$production"
#echo "score=$score"
#echo "record_date=$record_date"

record_timestamp=`date -d "$record_date" +"%s"`
newrecord=$username'\t'$production'\t'$score'\t'$record_timestamp

echo -e  $newrecord >> $outputfile

done
#return $newrecord


