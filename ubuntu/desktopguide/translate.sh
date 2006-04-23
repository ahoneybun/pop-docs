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
for x in rosetta-desktopguide/*; do
	y=$(basename ${x} .po)
	echo ${y}
	rm -rf ${y}/
	mkdir -p ${y}
	xml2po -e -p ${x} C/desktopguide.xml >${y}/desktopguide.xml
	xml2po -e -p ${x} C/getting-started.xml >${y}/getting-started.xml
	xml2po -e -p ${x} C/add-applications.xml >${y}/add-applications.xml
	xml2po -e -p ${x} C/getting-help.xml >${y}/getting-help.xml
	xml2po -e -p ${x} C/bookinfo.xml >${y}/bookinfo.xml
	xml2po -e -p ${x} C/preface.xml >${y}/preface.xml
	xml2po -e -p ${x} C/desktopguide-C.omf >${y}/desktopguide-${y}.omf
	xml2po -e -p ${x} C/config-system.xml >${y}/config-system.xml
	xml2po -e -p ${x} C/common-tasks.xml >${y}/common-tasks.xml
	../../validate.sh ${y}/desktopguide.xml
	sed -i -e s@\"C\"@\"${y}\"@g -e s@C/@${y}/@g ${y}/desktopguide-${y}.omf

done

rm -rf rosetta-desktopguide*
rm .xml2po.mo
