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


tar -xzvf rosetta-about-ubuntu.tar.gz
rm rosetta-about-ubuntu/about-ubuntu.pot

for x in rosetta-about-ubuntu/*; do
	y=$(basename ${x} .po)
	echo ${y}
	mkdir -p ${y}
	xml2po -k -p ${x} C/about-ubuntu.xml >${y}/about-ubuntu.xml
	xml2po -k -p ${x} ${y}/about-ubuntu-C.omf >${y}/about-ubuntu-${y}.omf
	sed -i -e s@\"C\"@\"${y}\"@g -e s@C/@${y}/@g ${y}/about-ubuntu-${y}.omf
	../../validate.sh ${y}/about-ubuntu.xml
done

rm -rf rosetta-about-ubuntu*
rm .xml2po.mo
