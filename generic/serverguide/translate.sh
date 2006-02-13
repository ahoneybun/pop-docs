#!/bin/sh

tar -xzvf rosetta-serverguide.tar.gz

for x in rosetta-serverguide/*; do
	y=$(basename ${x} .po)
	echo ${y}
	mkdir -p ${y}
	xml2po -e -p ${x} C/serverguide.xml >${y}/serverguide.xml
	xml2po -e -p ${x} C/installation.xml >${y}/installation.xml
	xml2po -e -p ${x} C/introduction.xml >${y}/introduction.xml
	xml2po -e -p ${x} C/bookinfo.xml >${y}/bookinfo.xml
	xml2po -e -p ${x} C/preface.xml >${y}/preface.xml
	xml2po -e -p ${x} C/packaging.xml >${y}/packaging.xml
	xml2po -e -p ${x} C/serverguide-C.omf >${y}/serverguide-${y}.omf
	xml2po -e -p ${x} C/system-conf.xml >${y}/system-conf.xml
	xml2po -e -p ${x} C/network-applications.xml >${y}/network-applications.xml
	xml2po -e -p ${x} C/windows-networking.xml >${y}/windows-networking.xml
	cp C/mk ${y}/
	if [ ! -e ${y}/serverguide-${y}.omf ]; then
		sed -e "s#\"C\"#\"${y}\"#;  s#/C/#/${y}/#" /serverguide-C.omf >${y}/serverguide-${y}.omf
	fi

done

	sed -i -e "s@/C@/$y@g" $y/mk

rm -rf rosetta-serverguide
