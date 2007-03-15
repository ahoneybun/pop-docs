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

# We have some different groups of documentation for the purposes of making
# the pot files

# Group one - those with an omf file
for x in about-ubuntu add-applications advanced-topics config-desktop files-and-docs internet keeping-safe musicvideophotos newtoubuntu printing; do
	echo ${x}
	xml2po -e -o ${x}/${x}.pot ${x}/C/*.xml ${x}/C/*-C.omf
done

# Group two - those without an omf file
for y in administrative basic-commands desktop-effects games office programming windows; do
	echo ${y}
	xml2po -e -o ${y}/${y}.pot ${y}/C/*.xml
done

# Group three - server material
	echo server
	xml2po -e -o ../generic/serverguide/serverguide.pot ../generic/serverguide/C/*xml ../generic/server/C/*xml

