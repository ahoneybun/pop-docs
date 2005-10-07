#!/bin/sh
BUILDBASE="build"
MODULES="generic gnome kde"
MODVARFILE="modvars.make"
echo Building the following modules: $MODULES

for m in $MODULES
do
BUILDDIR=$BUILDBASE/$m
SUBDIR=`ls -d $m/*/*/`
	for i in $SUBDIR; 
	do
		# load the document variables
		if test -f $i$MODVARFILE; then
			. $i$MODVARFILE
		else
			echo "No $MODVARFILE for $i"
			continue
		fi
		# handle documents
		if test `echo $i | grep -e 'C'`; then
			C_DOC=$i$DOC_NAME.xml
			
			# test for pot, if found merge any update, if not exist make first instance
			if test -f $i$DOC_NAME.pot; then
				echo "= $DOC_NAME"
				# create temp pot file
				if xml2pot $i$DOC_NAME.xml > $i$DOC_NAME.new; then
					# compare old pot and new pot
					msgmerge -o $i$DOC_NAME.pot -i $i$DOC_NAME.pot $DOC_NAME.new 2> /dev/null
					# if different update old pot, otherwise remove new 
					if ! cmp -s $i$DOC_NAME.pot $DOC_NAME.new; then
						rm $i$DOC_NAME.new
						echo "   No Change"
					else
						msgmerge -U -i $i$DOC_NAME.pot $i$DOC_NAME.new
						echo "   Modified $DOC_NAME.pot"
					fi
				fi
			else
				# create first instance
				xml2pot $DOC_NAME.xml > $i$DOC_NAME.pot
				echo "   Write $DOC_NAME.pot"
			fi
		else
			# handle translations
			if test ! `echo $i | grep -e 'C'`; then
				# test for po file
				if test -f $i$DOC_NAME-$LANG.xml; then
					echo "= $DOC_NAME-$LANG"
					if test $i$DOC_NAME-$LANG.po; then
						# Check integrity of po file
						msgfmt -vc $i$DOC_NAME-$LANG.po
						# Convert po against corresponding english file to temp xml file
						po2xml $C_DOC $i$DOC_NAME-$LANG.po > $i$DOC_NAME-$LANG.new
						#Test if diff and patch if diff, otherwise remove temp files
						diff $i$DOC_NAME-$LANG.xml $i$DOC_NAME-$LANG.new > $i$DOC_NAME-$LANG.diff
						if test -f $i$DOC_NAME-$LANG.diff
						then
							patch -p0 $i$DOC_NAME-$LANG.xml $i$DOC_NAME-$LANG.diff
							rm $i$DOC_NAME-$LANG.diff
							rm $i$DOC_NAME-$LANG.new
							echo "   Modified"
							xmllint --noout --xinclude --noent --postvalid $i$DOC_NAME-$LANG.xml
						else
							rm $i$DOC_NAME-$LANG.diff
							rm $i$DOC_NAME-$LANG.new
							echo "   No Change"
						fi
					fi
				else
					po2xml $C_DOC $i$DOC_NAME-$LANG.po > $i$DOC_NAME-$LANG.xml
					echo "  Write $i$DOC_NAME-$LANG.xml"
					xmllint --noout --xinclude --noent --postvalid $i$DOC_NAME-$LANG.xml
				fi
			else
				echo "   No translation"
			fi
		
		fi
	done
done 
