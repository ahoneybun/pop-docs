#!/bin/sh

tar -xzvf rosetta-desktopguide.tar.gz

for x in rosetta-desktopguide/*; do
	y=$(basename ${x} .po)
	echo ${y}
	mkdir -p ${y}
	xml2po -e -p ${x} C/desktopguide.xml >${y}/desktopguide.xml
	xml2po -e -p ${x} C/getting-started.xml >${y}/getting-started.xml
	xml2po -e -p ${x} C/getting-help.xml >${y}/getting-help.xml
	xml2po -e -p ${x} C/bookinfo.xml >${y}/bookinfo.xml
	xml2po -e -p ${x} C/preface.xml >${y}/preface.xml
	xml2po -e -p ${x} C/tips-and-tricks.xml >${y}/tips-and-tricks.xml
	xml2po -e -p ${x} C/desktopguide-C.omf >${y}/desktopguide-${y}.omf
	xml2po -e -p ${x} C/config-system.xml >${y}/config-system.xml
	xml2po -e -p ${x} C/common-tasks.xml >${y}/common-tasks.xml
	xml2po -e -p ${x} C/olinkdb.xml >${y}/olinkdb.xml
	mkdir ${y}/sample
	cp C/sample/* ${y}/sample/
	cp C/mk ${y}/
	if [ ! -e ${y}/desktopguide-${y}.omf ]; then
		sed -e "s#\"C\"#\"${y}\"#;  s#/C/#/${y}/#" C/desktopguide-C.omf >${y}/desktopguide-${y}.omf
	fi

done

	sed -i -e "s@/C@/$y@g" $y/mk

rm -rf rosetta-desktopguide
