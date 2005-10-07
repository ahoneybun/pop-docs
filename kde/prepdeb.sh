#!/bin/bash
# Builds Kubuntu Debian Package
# written by Sean Wheller <sean@inwords.co.za>

# remove previous copy of the deb building directory
if test ../kubuntu-docs; then
	rm -rf ../kubuntu-docs
	echo "old kubuntu-docs packaging directory removed"
fi

# create a new folder structure for deb building
if [ x$1 = x ]; then
#	echo "Enter a release folder number"
#	read X
        X=5.10
	echo "The release folder number is:" $X
	release=$(echo $X)
	mkdir ../kubuntu-docs
	mkdir ../kubuntu-docs/kubuntu-docs-$release
else
	release=$1
	mkdir ../kubuntu-docs
	mkdir ../kubuntu-docs/kubuntu-docs-$release
fi

# export prsitine copy of work from repos
if test ../kubuntu-docs/kubuntu-docs-$release; then
	mkdir ../kubuntu-docs/kubuntu-docs-$release/build
#	cp -rf debian ../kubuntu-docs/kubuntu-docs-$release
	svn export https://docteam.ubuntu.com/repos/branches/breezy/kde/debian ../kubuntu-docs/kubuntu-docs-$release/debian
	svn export https://docteam.ubuntu.com/repos/branches/breezy/common ../kubuntu-docs/kubuntu-docs-$release/common
	svn export https://docteam.ubuntu.com/repos/branches/breezy/libs ../kubuntu-docs/kubuntu-docs-$release/libs
	svn export https://docteam.ubuntu.com/repos/branches/breezy/kde ../kubuntu-docs/kubuntu-docs-$release/kde
	
	# We don't want all of kde only those docs that will be packaged
	rm -rf ../kubuntu-docs/kubuntu-docs-$release/kde/docspecs
	rm -rf ../kubuntu-docs/kubuntu-docs-$release/kde/kadminguide
	rm -rf ../kubuntu-docs/kubuntu-docs-$release/kde/kinstallguide
	rm -rf ../kubuntu-docs/kubuntu-docs-$release/kde/kynaptic
	rm -rf ../kubuntu-docs/kubuntu-docs-$release/kde/kuserguide
	rm -rf ../kubuntu-docs/kubuntu-docs-$release/kde/menus
	rm -rf ../kubuntu-docs/kubuntu-docs-$release/kde/prepdeb.sh
	rm -rf ../kubuntu-docs/kubuntu-docs-$release/kde/index.xml
	
	# move into folder for building
	cd ../kubuntu-docs/kubuntu-docs-$release
	debuild -us -uc
else
	exit

fi
