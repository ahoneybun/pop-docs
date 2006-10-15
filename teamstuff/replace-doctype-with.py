#!/usr/bin/env python
# replace-doctype-with.py
#
import re, sys

regex = re.compile("(<!DOCTYPE(.|\n)*]>)", re.MULTILINE)
content = ''.join(file(sys.argv[1]))
input = sys.stdin.read()

result = regex.search(content)

if result and result.group(1):
    replacement = result.group(1)
    print regex.sub(replacement, input)
else:
    print input
