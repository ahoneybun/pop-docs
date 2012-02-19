####################################################################################           
# Makefile for the GNOME Ubuntu Documentation
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
#
####################################################################################

MAKECMD=make

# Language code for documents
# Ex. LN=ja for japanese
LN=C

# Ubuntu Mallard Customization Layer

UBUNTUXSL=ubuntu.xsl

ubuntu-classic:

	for doc in `cat ../libs/shipped-docs`; do \
		mkdir -p ../build/ubuntu-classic/$$doc/$(LN); \
		yelp-build html -o ../build/ubuntu-classic/$$doc/$(LN) -x ubuntu.xsl ../$$doc/$(LN)/$$doc.xml; \
	done
	cd ../ ; ./scripts/fix-urls.sh -l $(LN); cd html
	mkdir -p ../build/ubuntu-classic/img
	mkdir -p ../build/ubuntu-classic/figures
	cp img/* ../build/ubuntu-classic/img/

clean:
	rm -rf ../build

serverguide:

	mkdir -p ../build/serverguide/$(LN)
	yelp-build html -o ../build/serverguide/$(LN) -x ubuntu.xsl ../serverguide/$(LN)/serverguide.xml
	cp -r ../serverguide/sample ../build/serverguide/
	mkdir -p ../build/img
	mkdir -p ../build/figures
	cp img/* ../build/img/


