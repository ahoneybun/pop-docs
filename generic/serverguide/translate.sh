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

tar -xzvf rosetta-serverguide.tar.gz
rm rosetta-serverguide/serverguide.pot
mv rosetta-serverguide po
rm rosetta-serverguide.tar.gz

for x in po/*; do
	y=$(basename ${x} .po)
	echo ${y}
	mkdir -p ${y}
	for i in C/*; do
		j=$(basename ${i} C/)
		echo ${j}
		xml2po -k -p ${x} C/${j} | replace-doctype-with.py C/${j} >${y}/${j}
	done
	if [ ! -e ${y}/serverguide-${y}.omf ]; then
		sed -e "s#\"C\"#\"${y}\"#;  s#/C/#/${y}/#" /serverguide-C.omf >${y}/serverguide-${y}.omf
	fi

	../../validate.sh ${y}/serverguide.xml

done

rm .xml2po.mo
