#!/bin/sh

segmentsDir=/home/ylj/nutch/apache-nutch-1.4-bin/runtime/local/newegg.com.cn_result_2/segments
nutch_cmd=/home/ylj/nutch/apache-nutch-1.4-bin/runtime/local/bin/nutch



mkdir ~/new_egg_extract_temp
mkdir ~/new_egg_extract_result

rm -rf ~/new_egg_extract_temp/*
rm -rf ~/new_egg_extract_result/*

for filename in `ls $1`
do
if [ -d $1'/'$filename ]
then
echo Dir $1'/'$filename
segmenfile=$1'/'$filename

#dump segment
echo "**************************"
echo "dumping segment file":$segmenfile"..."

$nutch_cmd readseg -dump $segmenfile   ~/new_egg_extract_temp/$filename  -nofetch -nogenerate -noparse -noparsedata -noparsetex
echo "dump segment file":$filename" complete!"
ls ~/new_egg_extract_temp/$filename
#extract comments from segment
echo "**************************"
echo "extracting comments from segment file":$filename"..."

java -cp ~/java/htmlparser/htmlparser1_6/lib/htmlparser.jar:/home/ylj/java/htmlparser/test_code/bin/ FindComments ~/new_egg_extract_temp/$filename/dump
echo "extract comments from segment file":$filename" complete!"

#resharp comments
echo "**************************"
echo "resharping comments ":$filename"..."
sh ~/shell/remove#.sh ~/new_egg_extract_temp/$filename/dump_comments > ~/new_egg_extract_result/$filename
echo "resharp comments ":$filename" complete!"


#delete dumpsegment"..."
echo "**************************"
echo "delete temp file ":~/new_egg_extract_temp/$filename"..."
rm -rf ~/new_egg_extract_temp/$filename
echo "delete complete! "
else
echo $tempfile
fi
done
