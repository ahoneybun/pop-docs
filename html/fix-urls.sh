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

## ghelp links

 	sed -i build/*.html -e "s#ghelp:brasero#http://library\.gnome\.org/users/brasero/2\.32/#g"
 	sed -i build/*.html -e "s#ghelp:cheese#http://library\.gnome\.org/users/cheese/2\.32/#g"
 	sed -i build/*.html -e "s#ghelp:empathy#http://library\.gnome\.org/users/empathy/2\.32/#g"
 	sed -i build/*.html -e "s#ghelp:evolution?usage-calendar#http://library\.gnome\.org/users/evolution/stable/usage-calendar\.html#g"
 	sed -i build/*.html -e "s#ghelp:gucharmap#http://library\.gnome\.org/users/gucharmap/2\.32/#g"
 	sed -i build/*.html -e "s#ghelp:orca#http://library\.gnome\.org/users/orca/3\.0/#g"
 	sed -i build/*.html -e "s#ghelp:synaptic#https://help\.ubuntu\.com/community/SynapticHowto#g"
 	sed -i build/*.html -e "s#ghelp:software-center#https://help\.ubuntu\.com/11\.04/software-center/C/index\.html#g"
 	sed -i build/*.html -e "s#ghelp:gnome-classic-index#https://help\.ubuntu\.com/11\.04/ubuntu-classic/gnome-classic-index/C/index\.html#g"
 	sed -i build/*.html -e "s#ghelp:language-selector#https://help\.ubuntu\.com/11\.04/language-selector/C/index\.html#g"

## Icons

 	sed -i build/*.html -e "s#/usr/share/icons/gnome/apps/22/preferences-desktop-accessibility\.svg#img/preferences-desktop-accessibility\.svg#g"
 	sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/status/24/bluetooth-active\.svg#img/bluetooth-active\.svg#g"
 	sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/status/24/bluetooth-active\.svg#img/bluetooth-active\.svg#g"
 	sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/status/24/battery-100\.svg#img/battery-100\.svg#g"
 	sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/status/24/network-offline\.svg#img/network-offline\.svg#g"
 	sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/status/24/audio-volume-high-panel\.svg#img/audio-volume-high-panel\.svg#g"
 	sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/status/24/indicator-messages\.svg#img/indicator-messages\.svg#g"
 	sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/status/24/user-offline-panel\.svg#img/user-offline-panel\.svg#g"
 	sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/actions/24/system-shutdown-panel\.svg#img/system-shutdown-panel\.svg#g"
    sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/stock/22/stock_person-panel\.svg#img/stock_person-panel\.svg#g"
    sed -i build/*.html -e "s#/usr/share/icons/ubuntu-mono-light/status/22/system-devices-panel\.svg#img/system-devices-panel\.svg#g"

## Search for unfixed ghelp links
echo "\nSearching for unfixed ghelp links:"
grep -r "href=\"ghelp:" build/

exit 0
