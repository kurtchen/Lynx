#!/bin/sh
# $LynxId: install-lss.sh,v 1.1 2007/05/13 22:15:29 tom Exp $
# install lynx.lss, ensuring the old config-file is saved to a backup file.
#
# $1 = install program
# $2 = file to install
# $3 = where to install it
PRG="$1"
SRC=$2
DST=$3

if test -f "$DST" ; then
	# See if we have saved this information before
	if cmp -s $SRC $DST
	then
		echo "... installed $DST would not be changed"
	else
		NUM=1
		while test -f ${DST}-${NUM}
		do
			if cmp -s $SRC ${DST}-${NUM}
			then
				break
			fi
			NUM=`expr $NUM + 1`
		done
		if test ! -f ${DST}-${NUM}
		then
			echo "... saving old config as ${DST}-${NUM}"
			mv $DST ${DST}-${NUM} || exit 1
		fi
		echo "** installing $SRC as $DST"
		eval $PRG $SRC $DST || exit 1
	fi
else
	echo "** installing $SRC as $DST"
	eval $PRG $SRC $DST || exit 1
fi
