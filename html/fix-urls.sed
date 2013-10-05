#!/bin/sed -f

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

## Fix some of the gnome help links in the generated HTML documentation

s#help:\(orca\|cheese\|baobab\|brasero\|gucharmap\)#http://help\.gnome\.org/users/\1/3\.8/#g
s#ghelp:synaptic#https://help\.ubuntu\.com/community/SynapticHowto#g

## We use https for help.ubuntu.com, Chrome in particular doesn't
## like mixing http & https on the same page (LP: #1044714)
s#http://www.google#https://www.google#g
