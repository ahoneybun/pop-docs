#!/bin/sh

for x in */C/*.xml; do
		y=$(basename ${x})
		echo ${y}
		../validate.sh */C/${y}
done
