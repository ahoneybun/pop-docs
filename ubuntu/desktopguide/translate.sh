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

tar -xzvf rosetta-desktopguide.tar.gz
rm rosetta-desktopguide/desktopguide.pot
mv rosetta-desktopguide po
rm rosetta-desktopguide.tar.gz

for x in po/*; do
	y=$(basename ${x} .po)
	echo ${y}
	mkdir -p ${y}
	for i in C/*; do
		j=$(basename ${i} C/)
		echo ${j}
		xml2po -k -p ${x} C/${j} | replace-doctype-with.py C/${j} >${y}/${j}
	done
	sed -i -e s@\"C\"@\"${y}\"@g -e s@C/@${y}/@g ${y}/desktopguide-${y}.omf
	../../validate.sh ${y}/desktopguide.xml

done

rm .xml2po.mo
