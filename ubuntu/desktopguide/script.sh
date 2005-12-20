#!/bin/sh

tar -xzvf rosetta-faqguide.tar.gz

for x in rosetta-faqguide/*; do
	y=$(basename ${x} .po)
	echo ${y}
	mkdir -p ${y}
	xml2po -e -p ${x} C/faqguide.xml >${y}/faqguide.xml

	if [ ! -e ${y}/faqguide-${y}.omf ]; then
		sed -e "s#\"C\"#\"${y}\"#;  s#/C/#/${y}/#" C/faqguide-C.omf >${y}/faqguide-${y}.omf
	fi
done

rm -rf rosetta-faqguide
