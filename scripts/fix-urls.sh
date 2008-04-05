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

for y in `cat libs/shipped-docs`; do
	
## Ubuntu links

 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:add-applications\#extra-repositories#\.\./\.\./add-applications/C/extra-repositories-adding.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:add-applications\#synaptic#\.\./\.\./add-applications/C/advanced.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:add-applications#\.\./\.\./add-applications/C/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:administrative#\.\./\.\./administrative/C/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:basic-commands#\.\./\.\./basic-commands/C/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:desktop-effects#\.\./\.\./desktop-effects/C/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:keeping-safe\#users#\.\./\.\./keeping-safe/C/users.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:office#\.\./\.\./office/C/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:hardware\#disks#\.\./\.\./harware/C/disks.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:hardware\#laptops-touchpads#\.\./\.\./office/C/laptops.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:hardware\#restricted-manager#\.\./\.\./office/C/restricted-manager.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:musicvideophotos\#codecs#\.\./\.\./musicvideophotos/C/codecs.html#g"
	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:musicvideophotos\#onlinemedia-plugins#\.\./\.\./musicvideophotos/C/onlinemedia.html#g"
	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:musicvideophotos\#onlinemedia-audiostreams#\.\./\.\./musicvideophotos/C/onlinemedia.html\#onlinemedia-audiostreams#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:musicvideophotos\#video#\.\./\.\./musicvideophotos/C/video.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:musicvideophotos\#video-online#\.\./\.\./musicvideophotos/C/video.html\#video-online#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:musicvideophotos\#music-audiostreams#\.\./\.\./musicvideophotos/C/music.html\#music-audiostreams#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:musicvideophotos\#cdburning#\.\./\.\./musicvideophotos/C/cdburning.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:musicvideophotos\#photos-slideshow#\.\./\.\./musicvideophotos/C/photos.html\#photos-slideshow#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:musicvideophotos\#photos-printing#\.\./\.\./musicvideophotos/C/photos.html\#photos-printing#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:internet\#web-plugins-flash#\.\./\.\./internet/C/web-plugins.html\#web-plugins-flash#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:programming\#java#\.\./\.\./programming/C/java.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:programming#\.\./\.\./programming/C/index.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:windows#\.\./\.\./windows/C/#g"
	sed -i ../build/ubuntu/$y/C/*.html -e "s#/usr/share/ubuntu-docs/common/C/ccbysa\.xml#../../common/C/ccbysa.html#g"

## Gnome links

 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#panels#http://library\.gnome\.org/users/user-guide/stable/panels\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#menubar#http://library\.gnome\.org/users/user-guide/stable/menubar\.html#g"
	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#prefs#http://library\.gnome\.org/users/user-guide/stable/prefs\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#nautilus#http://library\.gnome\.org/users/user-guide/stable/nautilus\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#basic-skills#http://library\.gnome\.org/users/user-guide/stable/basic-skills\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#overview#http://library\.gnome\.org/users/user-guide/stable/overview\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#prefs-mouse#http://library\.gnome\.org/users/user-guide/stable/prefs-mouse\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#mouse-skills#http://library\.gnome\.org/users/user-guide/stable/mouse-skills\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#gosnautilus-460#http://library\.gnome\.org/users/user-guide/stable/gosnautilus-460\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#nautilus-accessnetwork#http://library\.gnome\.org/users/user-guide/stable/nautilus-accessnetwork\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#prefs-keyboard#http://library\.gnome\.org/users/user-guide/stable/prefs-mouse\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#keyboard-skills#http://library\.gnome\.org/users/user-guide/stable/prefs-mouse\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#nautilus-cdwriter-copy#http://library\.gnome\.org/users/user-guide/stable/nautilus-cdwriter-copy\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:user-guide\#nautilus-cdwriter-writeimage#http://library\.gnome\.org/users/user-guide/stable/nautilus-cdwriter-writeimage\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:gnome-access-guide\#dtconfig-1#http://library\.gnome\.org/users/gnome-access-guide/stable/dtconfig-1\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:gnome-access-guide\#dtconfig-0#http://library\.gnome\.org/users/gnome-access-guide/stable/dtconfig-0\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:gnome-access-guide\#keynav-0#http://library\.gnome\.org/users/gnome-access-guide/stable/keynav-0\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:gswitchit\#gswitchit-applet-switching#http://library\.gnome\.org/users/gswitchit/stable/gswitchit-applet-switching\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:accessx-status\#index#http://library\.gnome\.org/users/accessx-status/stable/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:char-palette\#charpick-characters#http://library\.gnome\.org/users/char-palette/stable/charpick-usage\.html/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:baobab#http://library\.gnome\.org/users/baobab/stable/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:users-admin#http://library\.gnome\.org/users/users-admin/stable/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:evolution#http://library\.gnome\.org/users/evolution/stable/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:evolution\#usage-mail#http://library\.gnome\.org/users/evolution/stable/usage-mail\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:evolution\#usage-calendar#http://library\.gnome\.org/users/evolution/stable/usage-calendar\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:ekiga#http://library\.gnome\.org/users/ekiga/stable/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:clock\#clock-usage-calendar#http://library\.gnome\.org/users/clock/stable/#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:f-spot\#sharing-e-mail#http://f-spot\.org/User_Guide/Share\#Email#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:f-spot\#sharing-flickr-or-php-gallery#http://f-spot\.org/User_Guide/Share\#Post_to_your_Flickr_or_PHP_Gallery#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:f-spot\#enjoying-fullscreen-mode-and-slideshows#http://f-spot\.org/User_Guide/Enjoy\#Slideshow_and_Fullscreen_Modes#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:f-spot#http://f-spot\.org/User_Guide#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:eog\#eog-fullscreen#http://library\.gnome\.org/users/eog/stable/eog-view\.html\#eog-fullscreen#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:eog\#eog-manipulate#http://library\.gnome\.org/users/eog/stable/eog-manipulate\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:sound-juicer\#extracting#http://library\.gnome\.org/users/sound-juicer/stable/extracting\.html#g"
 	sed -i ../build/ubuntu/$y/C/*.html -e "s#ghelp:gnome-sound-recorder\#grecord-usage#http://library\.gnome\.org/users/gnome-sound-recorder/stable/grecord-usage\.html#g"

done
