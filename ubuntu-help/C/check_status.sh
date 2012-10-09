#!/bin/bash

# Produce a summary of the statuses of all of the .page topics
# (Not done properly, but it's OK for a rough estimate)
# DO NOT TRANSLATE

if [ "x$1" = "x" -o "x$1" = "x--none" ]; then
    echo " "
    echo "== NONE =="
    grep -l "12\.10.*status=\"none" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--stub" ]; then
    echo " "
    echo "== STUB =="
    grep -l "12\.10.*status=\"stub" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--incomplete" ]; then
    echo " "
    echo "== INCOMPLETE =="
    grep -l "12\.10.*status=\"incomplete" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--draft" ]; then
    echo " "
    echo "== DRAFT =="
    grep -l "12\.10.*status=\"draft" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--review" ]; then
    echo " "
    echo "== REVIEW =="
    grep -l "12\.10.*status=\"review" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--candidate" ]; then
    echo " "
    echo "== CANDIDATE =="
    grep -l "12\.10.*status=\"candidate" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--final" ]; then
    echo " "
    echo "== FINAL =="
    grep -l "12\.10.*status=\"final" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--outdated" ]; then
    echo " "
    echo "== OUTDATED =="
    grep -l "12\.10.*status=\"outdated" *.page
fi

if [ "x$1" = "x" ]; then
    echo " "
fi
if [ "x$1" = "x" -o "x$1" = "x--summary" ]; then
    echo " "
    echo "== SUMMARY =="
    echo "None: 		" `grep "12\.10.*status=\"none" *.page | wc -l`
    echo "Stub: 		" `grep "12\.10.*status=\"stub" *.page | wc -l`
    echo "Incomplete: 	" `grep "12\.10.*status=\"incomplete" *.page | wc -l`
    echo "Draft: 		" `grep "12\.10.*status=\"draft" *.page | wc -l`
    echo "Review: 	" `grep "12\.10.*status=\"review" *.page | wc -l`
    echo "Candidate: 	" `grep "12\.10.*status=\"candidate" *.page | wc -l`
    echo "Final: 		" `grep "12\.10.*status=\"final" *.page | wc -l`
    echo "Outdated: 	" `grep "12\.10.*status=\"outdated" *.page | wc -l`
fi
echo " "
