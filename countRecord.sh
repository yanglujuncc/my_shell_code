#!/bmein/sh

totle_count=0

rm $1'/'"count_result"
touch $1'/'"count_result"

for filename in `ls $1`
do
	if [ -d $1'/'$filename ]
	then
		echo Dir $1'/'$filename
	else
		if [  "$filename" == "count_result" ] 
		then
			continue
		fi
		nu_str=`wc -l $1'/'$filename`	
		echo "$nu_str" >> $1'/'"count_result"
		record_n=`echo "$nu_str" | cut  -d " " -f 1`
		totle_count=$[ $record_n + $totle_count]
		
	fi
done

echo "totle = $totle_count" >> $1'/'"count_result"

