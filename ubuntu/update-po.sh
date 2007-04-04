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

# NB - DON'T ATTEMPT TO USE THIS YET, IT HASN'T BEEN TESTED MUCH.
#
# This script is for generating po files after local changes have been made to translated
# xml docbook files. After making local changes, run:
#
# $ ./update-po.sh
#
# Optional parameters:
#	-d<documentname>
#	-l<language>

TMPFILE=tmp.po

updatepo () {
	rm -f $TMPFILE
	y=$(basename ${1} .po)
	echo ${y}
	for i in C/*.xml; do
    	TRFILE=${y}/`basename $i`
    	xml2po -k -r $TRFILE $i >>$TMPFILE
	done
	msguniq --use-first $TMPFILE >po/${y}.po && rm $TMPFILE
}

choose_language () {
	echo "Entering ${1}"
	cd ${1}
	if [ ${2} ]; then
		updatepo "po/${2}.po"
	else
		for x in po/*; do
			updatepo ${x}
		done
	fi
	cd ..
}

while getopts "d:l:" Option
do
	case ${Option} in
		d) document=${OPTARG};;
		l) lang=${OPTARG};;
		*) echo "Please specify an argument.";;
	esac
done

if [ ${document} ]; then
	choose_language ${document} ${lang}
else
	for doc in `cat libs/shipped-docs`
	do
		choose_language ${doc} ${lang}
	done
fi

