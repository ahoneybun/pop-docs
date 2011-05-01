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

while getopts "l:" Option
do
	case ${Option} in
		l) lang=${OPTARG};;
		*) lang="C";;
	esac
done

for y in `cat libs/shipped-docs`; do

## Skip this loop if the directory doesn't exist (probably means no translations for this section)
	if [ ! -d build/$y/$lang ]; then
		echo "Missing directory 'build/$y/$lang' - skipping..."
		continue
	fi
	
## Ubuntu links

	sed -i build/$y/$lang/*.html -e "s#ghelp:about-ubuntu#\.\./\.\./about-ubuntu/$lang/#g" 
 	sed -i build/$y/$lang/*.html -e "s#ghelp:add-applications\#extra-repositories#\.\./\.\./add-applications/$lang/extra-repositories-adding.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:add-applications\#synaptic#\.\./\.\./add-applications/$lang/advanced.html#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:add-applications\#restricted-software#\.\./\.\./add-applications/$lang/restricted-software.html#g"	
 	sed -i build/$y/$lang/*.html -e "s#ghelp:add-applications#\.\./\.\./add-applications/$lang/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:administrative#\.\./\.\./administrative/$lang/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:basic-commands#\.\./\.\./basic-commands/$lang/#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:config-desktop#\.\./\.\./config-desktop/$lang/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:desktop-effects#\.\./\.\./desktop-effects/$lang/#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:files-and-docs#\.\./\.\./files-and-docs/$lang/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:keeping-safe\#users#\.\./\.\./keeping-safe/$lang/users.html#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:keeping-safe#\.\./\.\./keeping-safe/$lang/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:office#\.\./\.\./office/$lang/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:hardware\#disks#\.\./\.\./hardware/$lang/disks.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:hardware\#laptops-touchpads#\.\./\.\./hardware/$lang/laptops.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:hardware\#jockey#\.\./\.\./hardware/$lang/jockey.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:internet\#web-plugins-flash#\.\./\.\./internet/$lang/web-plugins.html\#web-plugins-flash#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:internet#\.\./\.\./internet/$lang/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#codecs#\.\./\.\./musicvideophotos/$lang/codecs.html#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#onlinemedia-plugins#\.\./\.\./musicvideophotos/$lang/onlinemedia.html#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#onlinemedia-audiostreams#\.\./\.\./musicvideophotos/$lang/onlinemedia.html\#onlinemedia-audiostreams#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#video-playback-flash#\.\./\.\./musicvideophotos/$lang/video-playback.html\#video-playback-flash#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#video#\.\./\.\./musicvideophotos/$lang/video.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#video-online#\.\./\.\./musicvideophotos/$lang/video.html\#video-online#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#music-audiostreams#\.\./\.\./musicvideophotos/$lang/music.html\#music-audiostreams#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#cdburning#\.\./\.\./musicvideophotos/$lang/cdburning.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#photos-slideshow#\.\./\.\./musicvideophotos/$lang/photos.html\#photos-slideshow#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos\#photos-printing#\.\./\.\./musicvideophotos/$lang/photos.html\#photos-printing#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:musicvideophotos#\.\./\.\./musicvideophotos/$lang/#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:newtoubuntu#\.\./\.\./newtoubuntu/$lang/#g"
        sed -i build/$y/$lang/*.html -e "s#ghelp:printing\#faxing#\.\./\.\./printing/$lang/faxing.html#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:printing#\.\./\.\./printing/$lang/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:serverguide#\.\./\.\./serverguide/$lang/index.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:windows#\.\./\.\./windows/$lang/#g"
        sed -i build/$y/$lang/*.html -e "s#\"legal\.html\"#\"/legal\.html\"#g"
 	sed -i build/$y/$lang/*.html -e "s#man:iptables#http://manpages\.ubuntu\.com/iptables#g"
 	sed -i build/$y/$lang/*.html -e "s#man:ufw#http://manpages\.ubuntu\.com/ufw#g"
        sed -i build/$y/$lang/*.html -e "s#x-yelp-toc:\#Man#http://manpages\.ubuntu\.com#g"
        sed -i build/$y/$lang/*.html -e "s#x-yelp-toc:\#Info#http://manpages\.ubuntu\.com#g"

## For Software Center, documentation needs to be built separately
        sed -i build/$y/$lang/*.html -e "s#ghelp:software-center#https://help\.ubuntu\.com/11\.04/software-center/C/index\.html#g"

## Gnome links

 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#panels#http://library\.gnome\.org/users/user-guide/stable/panels\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#menubar#http://library\.gnome\.org/users/user-guide/stable/menubar\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#basic-skills#http://library\.gnome\.org/users/user-guide/stable/basic-skills\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#overview-workspaces#http://library\.gnome\.org/users/user-guide/stable/overview-workspaces\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#overview#http://library\.gnome\.org/users/user-guide/stable/overview\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#prefs-mouse#http://library\.gnome\.org/users/user-guide/stable/prefs-mouse\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#mouse-skills#http://library\.gnome\.org/users/user-guide/stable/mouse-skills\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#gosnautilus-460#http://library\.gnome\.org/users/user-guide/stable/gosnautilus-460\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#nautilus-accessnetwork#http://library\.gnome\.org/users/user-guide/stable/nautilus-accessnetwork\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#prefs-keyboard#http://library\.gnome\.org/users/user-guide/stable/prefs-keyboard\.html#g"
	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#prefs#http://library\.gnome\.org/users/user-guide/stable/prefs\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#keyboard-skills#http://library\.gnome\.org/users/user-guide/stable/prefs-mouse\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#nautilus-cdwriter-copy#http://library\.gnome\.org/users/user-guide/stable/nautilus-cdwriter-copy\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#nautilus-cdwriter-writeimage#http://library\.gnome\.org/users/user-guide/stable/nautilus-cdwriter-writeimage\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#nautilus-preferences#http://library\.gnome\.org/users/user-guide/stable/nautilus-preferences\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#nautilus-permissions#http://library\.gnome\.org/users/user-guide/stable/nautilus-permissions\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:user-guide\#nautilus#http://library\.gnome\.org/users/user-guide/stable/nautilus\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:gnome-access-guide#http://library\.gnome\.org/users/gnome-access-guide/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:gnome-access-guide\#dtconfig-1#http://library\.gnome\.org/users/gnome-access-guide/stable/dtconfig-1\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:gnome-access-guide\#dtconfig-0#http://library\.gnome\.org/users/gnome-access-guide/stable/dtconfig-0\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:gnome-access-guide\#keynav-0#http://library\.gnome\.org/users/gnome-access-guide/stable/keynav-0\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:gswitchit\#gswitchit-applet-switching#http://library\.gnome\.org/users/gswitchit/stable/gswitchit-applet-switching\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:accessx-status\#index#http://library\.gnome\.org/users/accessx-status/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:char-palette\#charpick-characters#http://library\.gnome\.org/users/char-palette/stable/charpick-usage\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:baobab#http://library\.gnome\.org/users/baobab/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:users-admin#http://library\.gnome\.org/users/users-admin/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:evolution\#usage-mail#http://library\.gnome\.org/users/evolution/stable/usage-mail\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:evolution\#usage-calendar-todo#http://library\.gnome\.org/users/evolution/stable/usage-calendar-todo\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:evolution\#usage-calendar#http://library\.gnome\.org/users/evolution/stable/usage-calendar\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:evolution\#usage-contact#http://library\.gnome\.org/users/evolution/stable/usage-contact\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:evolution#http://library\.gnome\.org/users/evolution/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:ekiga#http://library\.gnome\.org/users/ekiga/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:clock\#clock-usage-calendar#http://library\.gnome\.org/users/clock/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:f-spot\#sharing-e-mail#http://f-spot\.org/User_Guide/Share\#Email#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:f-spot\#sharing-flickr-or-php-gallery#http://f-spot\.org/User_Guide/Share\#Post_to_your_Flickr_or_PHP_Gallery#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:f-spot\#enjoying-fullscreen-mode-and-slideshows#http://f-spot\.org/User_Guide/Enjoy\#Slideshow_and_Fullscreen_Modes#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:f-spot#http://f-spot\.org/User_Guide#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:eog\#eog-fullscreen#http://library\.gnome\.org/users/eog/stable/eog-view\.html\#eog-fullscreen#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:eog\#eog-manipulate#http://library\.gnome\.org/users/eog/stable/eog-manipulate\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:sound-juicer\#extracting#http://library\.gnome\.org/users/sound-juicer/stable/extracting\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:sound-juicer#http://library\.gnome\.org/users/sound-juicer/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:gnome-sound-recorder\#grecord-usage#http://library\.gnome\.org/users/gnome-sound-recorder/stable/grecord-usage\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:gnome-sound-recorder#http://library\.gnome\.org/users/gnome-sound-recorder/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#file:///usr/share/doc/diveintopython/html/toc/index\.html#http://diveintopython\.org/toc/index\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#file:///usr/share/doc/python-gtk2-tutorial/html/index\.html#http://www\.pygtk\.org/pygtk2tutorial/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:shares-admin#http://library\.gnome\.org/users/shares-admin/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:rhythmbox#http://library\.gnome\.org/users/rhythmbox/unstable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:rhythmbox\#cd-burning#http://library\.gnome\.org/users/rhythmbox/unstable/AudioCD\.html\.en\#cd-burning#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:rhythmbox\#cd-import#http://library\.gnome\.org/users/rhythmbox/unstable/AudioCD\.html\.en\#cd-import#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:brasero#http://library\.gnome\.org/users/brasero/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:empathy#http://library\.gnome\.org/users/empathy/stable/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:banshee#http://library\.gnome\.org/users/banshee/1\.8/#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:gnome-help\#nautilus-prefs#https://help\.ubuntu\.com/11\.04/ubuntu-help/nautilus-prefs\.html#g"
 	sed -i build/$y/$lang/*.html -e "s#ghelp:gnome-help\#nautilus-file-properties-permissions#https://help\.ubuntu\.com/11\.04/ubuntu-help/nautilus-file-properties-permissions\.html#g"

## Other links
 	sed -i build/$y/$lang/*.html -e "s#ghelp:synaptic\#synaptic-single#https://help\.ubuntu\.com/community/SynapticHowto#g"

## index.html
 	sed -i build/index.html -e "s#$y/C/#$y/$lang/#g"

## Images

 	sed -i build/$y/$lang/*.html -e "s#/usr/share/pixmaps/firefox-3.5\.png#../../libs/img/firefox-3.5\.png#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/hicolor/48x48/apps/empathy\.png#../../libs/img/empathy\.png#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/hicolor/48x48/apps/f-spot\.png#../../libs/img/f-spot\.png#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/hicolor/48x48/apps/rhythmbox\.png#../../libs/img/rhythmbox\.png#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/hicolor/48x48/apps/ubuntuone-client\.png#../../libs/img/ubuntuone-client\.png#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/places/48/distributor-logo\.svg#../../libs/img/distributor-logo\.svg#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/apps/48/evolution\.svg#../../libs/img/evolution\.svg#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/categories/48/applications-office\.svg#../../libs/img/applications-office\.svg#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/apps/48/gnome-apt\.svg#../../libs/img/gnome-apt\.svg#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/apps/48/update-manager\.svg#../../libs/img/update-manager\.svg#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/apps/48/gnome-help\.svg#../../libs/img/gnome-help\.svg#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/status/24/gnome-netstatus-disconn\.svg#../../libs/img/gnome-netstatus-disconn\.svg#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/devices/24/network-wired\.svg#../../libs/img/network-wired\.svg#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/devices/24/network-wireless\.svg#../../libs/img/network-wireless\.svg#g"
 	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/Humanity/apps/48/gnome-volume-control\.svg#../../libs/img/gnome-volume-control\.svg#g"
	sed -i build/$y/$lang/*.html -e "s#/usr/share/icons/gnome/24x24/status/dialog-password\.png#../../libs/img/dialog-password\.png#g"

done

## Search for unfixed ghelp links
echo "\nSearching for unfixed ghelp links:"
grep -r "href=\"ghelp:" build/

## Search for unfixed manpage links
echo "\nSearching for unfixed manpage links:"
grep -r "href=\"man:" build/
grep -r "url=\"man:" build/

exit 0

