#!/bin/bash

# Prerequisites
# sudo apt-get install gstreamer0.10-fluendo-mp3 imagemagick shutter xdotool
#
# Save this script in ~/.ubuntu-help (this is also where the screenshots will be kept)
# The hidden directory is so that they don't clutter the File Browser screenshot
#
# Open Shutter and set the delay (in the bottom right corner) to 3, make sure 
# "Include cursor" isn't checked
#
# Open System Settings>Privacy. Delete all history
# Switch to the Files tab and add the .ubuntu-help directory to the don't record list.
#
# Make sure that /etc/default/apport has enabled=0 . This
# will turn off the automatic bug report window that will just get in the way of screenshots.
#
# Finally press Alt+F2 and run .ubuntu-help/collect-screenshots-without-mouse.sh

function error {
  echo -e $1
  exit 1
}

## prerequisites installed? Needs more work
#for pkg in gedit gstreamer0.10-fluendo-mp3 shutter xdotool imagemagick ; do
#  if dpkg --get-selections | grep -q $pkg ; then error "Error: $pkg isn't installed. To install it, run: \n sudo apt-get install $pkg#"; fi
#done

lang=$(basename $LANG .UTF-8)
echo "lang: $lang"
dir=$HOME/.ubuntu-help/$lang/figures
downdir=$HOME/.downloads
echo "dir: $dir"
mkdir -p $dir
mkdir -p $downdir

long_pause="sleep 5"
mid_pause="sleep 3"
short_pause="sleep 1"

wget -c -O $downdir/EmblemDivide.pdf http://emblemdivide.files.wordpress.com/2009/12/chapter0.pdf
wget -c -O $downdir/standard-tube-map.pdf http://www.tfl.gov.uk/assets/downloads/standard-tube-map.pdf
wget -c -O $downdir/richard-stallman-young.jpg http://upload.wikimedia.org/wikipedia/commons/f/f7/Richard_Matthew_Stallman.jpeg
wget -c -O $downdir/Echoes\ In\ Time.mp3 http://people.ubuntu.com/~jbicha/Echoes%20In%20Time.mp3

# Set the screen resolution
xrandr -s 1024x768
$long_pause
xdotool mousemove 1024 350

# Change the time to match the version number
# This needs to be updated for different locales
gsettings set com.canonical.indicator.datetime time-format "custom"
gsettings set com.canonical.indicator.datetime custom-time-format "12:04 %p"
gsettings set org.gnome.Evince.Default show-sidebar false # This doesn't seem to work
gsettings set com.canonical.Unity form-factor "Netbook"

xdotool key Super
$mid_pause
xdotool key u p d a
$short_pause
xdotool key Down Down Return
$long_pause

xdotool key Super
$mid_pause
xdotool key m a h j
$short_pause
xdotool key Down Down Return
$mid_pause

xdotool key Super
$mid_pause
xdotool key g e d i
$short_pause
xdotool key Down Down Return
$mid_pause

xdotool key Super
$mid_pause
xdotool key e v i n
$short_pause
xdotool key Down Down Return
$mid_pause

xdotool key Super
$mid_pause
xdotool key e o g
$short_pause
xdotool key Down Down Return
$mid_pause

pkill update-manager
pkill mahjongg
evince $downdir/standard-tube-map.pdf &
$mid_pause
pkill evince
touch $downdir/index.html
gedit $downdir/index.html &
$mid_pause
pkill gedit
evince $downdir/EmblemDivide.pdf &
$mid_pause
pkill evince
eog $downdir/richard-stallman-young.jpg &
$mid_pause
pkill eog

shutter -f -e -o dir/unity.png
$short_pause
convert $dir/unity.png -resize 250x188 $dir/unity.png
if [ $dir -eq ".ubuntu-help/en-US/figures" ] # English only
  then
    convert $dir/unity.png -crop 65x180+0+25 +repage $dir/unity-launcher.png
    $short_pause
    convert $dir/unity-launcher.png -crop 65x123+0+57 +repage $dir/unity-launcher-apps.png
fi

nautilus &
$long_pause
xdotool getactivewindow windowsize 650 325
shutter -a -e -o $dir/nautilus.png
$long_pause
convert $dir/nautilus.png -resize 250x125 $dir/nautilus.png
xdotool key Alt+F4

xdotool key Super
$short_pause
xdotool key BackSpace
$short_pause
shutter -f -e -o $dir/unity-overview-original.png
convert $dir/unity-overview-original.png -crop 230x130+0+0 +repage $dir/unity-dash-sample.png
$short_pause
convert $dir/unity-overview-original.png -resize 75% $dir/unity-overview.png
rm $dir/unity-overview-original.png

xdotool key Ctrl+Tab
shutter -f -e -o $dir/unity-dash.png
convert $dir/unity-dash.png -crop 525x227+0+0 +repage $dir/unity-dash.png

xdotool key Escape

# Change things back to normal
gsettings reset com.canonical.indicator.datetime time-format
gsettings reset com.canonical.indicator.datetime custom-time-format
gsettings reset com.canonical.Unity form-factor

# This is supposed to set a laptop's screen resolution back to default
xrandr --output LVDS1 --auto
