#!/bin/bash

# Prerequisites
# Do -without-mouse first (just to make sure everything's setup)
# Open Shutter and make sure "Include cursor" is checked

lang=$(basename $LANG .UTF-8)
echo "lang: $lang"
dir=$HOME/.ubuntu-help/$lang/figures
downdir=$HOME/.downloads
echo "dir: $dir"
mkdir -p $dir
mkdir -p $downdir

long_pause="sleep 5"
mid_pause="sleep 3"
short_pause="$short_pause"

# Set the screen resolution
xrandr -s 1024x768
$mid_pause

# Change the time to match the version number
# This needs to be updated for different locales
gsettings set com.canonical.indicator.datetime time-format "custom"
gsettings set com.canonical.indicator.datetime custom-time-format "12:04 %p"
gsettings set org.gnome.Evince.Default show-sidebar false # This doesn't seem to work?
gsettings set com.canonical.Unity form-factor "Netbook"	

gsettings set com.canonical.Unity.Launcher favorites "['ubuntu-software-center.desktop',
 'ubuntuone-installer.desktop', 'gnome-control-center.desktop']"
evince $downdir/standard-tube-map.pdf &
$long_pause
xdotool getactivewindow windowsize 600 500
xdotool getactivewindow windowmove 55 208
xdotool key Down Down Down Down
xdotool key Down Down Down Down
xdotool key Right Right Right Right Right Right
sol -v Klondike &
$mid_pause
xdotool getactivewindow windowmove 240 340
xdotool mousemove --sync 300 510
xdotool click 1
xdotool mousemove --sync 53 413
$short_pause
shutter -f -e -o $dir/unity-workspace-intro.png
$mid_pause
convert $dir/unity-workspace-intro.png -crop 375x300+0+202 +repage $dir/unity-workspace-intro.png
$short_pause
convert $dir/unity-workspace-intro.png -resize 250x200 $dir/unity-workspace-intro.png
pkill evince
pkill sol
gsettings reset com.canonical.Unity.Launcher favorites

xdotool key Ctrl+Alt+Down Ctrl+Alt+Right
software-center &
$long_pause
$long_pause
xdotool key Ctrl+Alt+Up
$mid_pause
evince $downdir/EmblemDivide.pdf &
$mid_pause
xdotool key Down Down Down Down Down Down
xdotool getactivewindow windowsize --sync 580 520
xdotool getactivewindow windowmove --sync 270 150
xdotool key Ctrl+Alt+Left
xdg-open "http://www.ubuntu.com"
$long_pause
$mid_pause
xdotool mousemove --sync 53 650
$short_pause
xdotool click 1
shutter -f -e -o $dir/unity-windows.png
convert $dir/unity-windows.png -resize 400x300 $dir/unity-windows.png
xdotool click 1
pkill software-center
pkill evince

xdotool key Ctrl+Super+Right
xdotool key Alt+F1
$short_pause
xdotool key Down
$short_pause
xdotool key Down
$short_pause
xdotool key Right
$short_pause
xdotool key Down
$short_pause
xdotool mousemove --sync 80 205
shutter -f -e -o $dir/unity-launcher-intro.png
convert $dir/unity-launcher-intro.png -crop 300x240+0+83 +repage $dir/unity-launcher-intro.png
$short_pause
convert $dir/unity-launcher-intro.png -resize 250x200 $dir/unity-launcher-intro.png
xdotool key Escape
xdotool key Ctrl+Super+Up
xdotool key Ctrl+W

xdg-open $downdir/Echoes\ In\ Time.mp3
sleep 25
xdotool key Alt+F4
$short_pause
xdotool key Alt+F10
$short_pause
xdotool key Left
$short_pause
xdotool key Left
$short_pause
xdotool key Left
$short_pause
xdotool key Left
$short_pause
xdotool key Down
$short_pause
xdotool key Down
$short_pause
xdotool key Down
$short_pause
xdotool mousemove --sync 900 165
shutter -f -e -o $dir/unity-appmenu-intro.png
pkill rhythmbox
convert $dir/unity-appmenu-intro.png -crop 375x300+650+0 +repage $dir/unity-appmenu-intro.png
convert $dir/unity-appmenu-intro.png -resize 250x200 $dir/unity-appmenu-intro.png

xdotool key Right
$short_pause
xdotool key Right
$short_pause
xdotool key Right
$short_pause
xdotool key Up
$short_pause
xdotool key Up
$short_pause
xdotool key Up
$short_pause
xdotool mousemove --sync 900 225
shutter -f -e -o $dir/unity-exit.png
convert $dir/unity-exit.png -crop 375x300+650+0 +repage $dir/unity-exit.png
$short_pause
convert $dir/unity-exit.png -resize 250x200 $dir/unity-exit.png
xdotool key Escape


# Change things back to normal
gsettings reset com.canonical.indicator.datetime time-format
gsettings reset com.canonical.indicator.datetime custom-time-format
gsettings reset com.canonical.Unity form-factor

# This is supposed to set a laptop's screen resolution back to default
xrandr --output LVDS1 --auto
