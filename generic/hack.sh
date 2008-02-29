for i in serverguide ; do cd $i/po ; for x in $i-*.po ; do echo $x ; mv $x ${x#$i-}; done ; cd ../../ ; done
