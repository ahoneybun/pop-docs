#!/bin/sh

# author: Sean Wheller (froud) sean@inwords.co.za
# remarks: Use this script to validate your documents.
# usage: ./validate.sh path/to/xmlinstance.xml
# example: ./validate userguide/userguide.xml


xmllint --noout --xinclude --noent --postvalid $1
