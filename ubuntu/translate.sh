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

# NB - DON'T ATTEMPT TO USE THIS YET, IT HASN'T BEEN TESTED MUCH.
#
# This script is for generating XML documents from po files downloaded from Launchpad
# Put your freshly downloaded po files into the po folder under each document, then run:
#
# $ translate.sh lang
#
# The "lang" is optional, if passed without it, the script will generate all languages.

translate () {
	y=$(basename ${1} .po)
	echo ${y}
	mkdir -p ${y}
	for i in C/*xml; do
		j=$(basename ${i} C/)
		echo ${j}
		xml2po -e -p ${1} C/${j} C/${j} >${y}/${j}
	done
	xml2po -e -p ${1} C/$doc-C.omf >${y}/$doc-${y}.omf
	sed -i -e s@\"C\"@\"${y}\"@g -e s@C/@${y}/@g ${y}/$doc-${y}.omf
	../../validate.sh ${y}/$doc.xml
}

for doc in about-ubuntu advanced-topics files-and-docs internet newtoubuntu programming switching add-applications keeping-safe office administrative config-desktop games musicvideophotos printing windows; do
	cd $doc
	echo $doc
	if [ ${1} ]; then
		translate "po/${1}.po"
	else
		for x in po/*; do
			translate ${x}
		done
	fi
	rm .xml2po.mo
done

