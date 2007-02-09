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

for y in about-ubuntu add-applications advanced-topics config-desktop games getting-help internet keeping-safe musicvideophotos office newtoubuntu printing programming switching; do
	for x in about-ubuntu add-applications advanced-topics config-desktop games getting-help internet keeping-safe musicvideophotos office newtoubuntu printing programming switching; do
 		sed -i $y/C/$y.xml -e "s#url=\"\.\./musicvideophotos/musicvideophotos.xml\#codecs\"#type=\"help\" url=\"ghelp:musicvideophotos\#codecs\"#g"
 		sed -i $y/C/$y.xml -e "s#url=\"\.\./programming/programming.xml\#java\"#type=\"help\" url=\"ghelp:programming\#java\"#g"
		sed -i $y/C/$y.xml -e "s#url=\"\.\./add-applications/add-applications.xml\#extra-repositories\"#type=\"help\" url=\"ghelp:add-applications\#extra-repositories\"#g"
		sed -i $y/C/$y.xml -e "s#url=\"\.\./$x/$x.xml\"#type=\"help\" url=\"ghelp:$x\"#g"
	done
done

