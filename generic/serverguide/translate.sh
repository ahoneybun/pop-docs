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

# Before running this script download the relevant tarball of
# translations from Rosetta 
# (https://launchpad.net/distros/ubuntu/edgy/+source/ubuntu-docs/+pots)
# and place in this directory.

tar -xzvf rosetta-serverguide.tar.gz
rm rosetta-serverguide/serverguide.pot
mv rosetta-serverguide po

for x in po/*; do
	y=$(basename ${x} .po)
	echo ${y}
	mkdir -p ${y}
	xml2po -k -p ${x} C/bookinfo.xml >${y}/bookinfo.xml
	xml2po -k -p ${x} C/installation.xml >${y}/installation.xml
	xml2po -k -p ${x} C/introduction.xml >${y}/introduction.xml
	xml2po -k -p ${x} C/network-applications.xml >${y}/network-applications.xml
	xml2po -k -p ${x} C/packaging.xml >${y}/packaging.xml
	xml2po -k -p ${x} C/serverguide-C.omf >${y}/serverguide-${y}.omf
	xml2po -k -p ${x} C/serverguide.xml >${y}/serverguide.xml
	xml2po -k -p ${x} C/system-conf.xml >${y}/system-conf.xml
	xml2po -k -p ${x} C/windows-networking.xml >${y}/windows-networking.xml
	if [ ! -e ${y}/serverguide-${y}.omf ]; then
		sed -e "s#\"C\"#\"${y}\"#;  s#/C/#/${y}/#" /serverguide-C.omf >${y}/serverguide-${y}.omf
	fi
	../../validate.sh ${y}/serverguide.xml

done

