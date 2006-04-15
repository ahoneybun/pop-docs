#!/bin/sh

####################################################################################           
# Copyright (C) 2005-2006 Ubuntu Documentation Project (ubuntu-doc@lists.ubuntu.com)
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version. 
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#    On Debian based systems a copy of the GPL can be found 
#    at /usr/share/common-licenses/GPL
####################################################################################

tar -xzvf rosetta-packagingguide.tar.gz
rm -rf rosetta-packagingguide/packagingguide.pot
for x in rosetta-packagingguide/*; do
	y=$(basename ${x} .po)
	echo ${y}
	mkdir -p ${y}
	xml2po -e -p ${x} C/appendix.xml >${y}/appendix.xml
	xml2po -e -p ${x} C/basic.xml >${y}/basic.xml
	xml2po -e -p ${x} C/bookinfo.xml >${y}/bookinfo.xml
	xml2po -e -p ${x} C/bugs.xml >${y}/bugs.xml
	xml2po -e -p ${x} C/getting_started.xml >${y}/getting_started.xml
	xml2po -e -p ${x} C/introduction.xml >${y}/introduction.xml
	xml2po -e -p ${x} C/packagingguide.xml >${y}/packagingguide.xml
	xml2po -e -p ${x} C/packagingguide-C.omf >${y}/packagingguide-${y}.omf
	xml2po -e -p ${x} C/ubuntu.xml >${y}/ubuntu.xml
	if [ ! -e ${y}/packagingguide-${y}.omf ]; then
		sed -e "s#\"C\"#\"${y}\"#;  s#/C/#/${y}/#" /packagingguide-C.omf >${y}/packagingguide-${y}.omf
	fi
	sed -i -e "s@/C/preface@/$y/preface@g" $y/packagingguide.xml
	../../validate.sh $y/packagingguide.xml
done

rm -rf rosetta-packagingguide