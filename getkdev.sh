#!/bin/bash
# gets the resources need for developing kubuntu docs only
# written by Sean Wheller <sean@inwords.co.za>

mkdir kubuntu-docs
svn co https://docteam.ubuntu.com/repos/trunk/common kubuntu-docs/common
svn co https://docteam.ubuntu.com/repos/trunk/libs kubuntu-docs/libs
svn co https://docteam.ubuntu.com/repos/trunk/kde kubuntu-docs/repos
svn co https://docteam.ubuntu.com/repos/trunk/validate.sh kubuntu-docs