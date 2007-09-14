#! /bin/bash

for po in `ls *.po`;
do
	name=`grep "h:1" -A2 ${po} | grep msgstr | cut -d '"' -f 2`
	lang=`echo $po|cut -d "." -f1`

	if [ "$name" ]
	then
		echo  Name[$lang]=$name
	fi

done
