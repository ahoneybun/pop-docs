#!/bin/sh

tar -xzf rosetta-aboutubuntu.tar.gz

for x in rosetta-aboutubuntu/*; do
	y=$(basename ${x} .po)
	echo ${y}
	mkdir -p ${y}
	xml2po -p ${x} C/about-ubuntu.xml >${y}/about-ubuntu.xml

	if [ ! -e ${y}/about-ubuntu-${y}.omf ]; then
		sed -e "s#\"C\"#\"${y}\"#;  s#/C/#/${y}/#" C/about-ubuntu-C.omf >${y}/about-ubuntu-${y}.omf
	fi
done

rm -rf rosetta-aboutubuntu
