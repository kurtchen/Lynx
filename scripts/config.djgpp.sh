#!/bin/sh
CFLAGS="-g -gcoff -O2 -W -Wall -I/dev/env/DJDIR/pdcur_cvs/PDCurses -I/dev/env/DJDIR/watt32/inc" \
CPPFLAGS="-DBOXHORI=0 -DBOXVERT=0 -I/dev/env/DJDIR/pdcur_cvs/PDCurses -I/dev/env/DJDIR/watt32/inc" \
LIBS="-L/dev/env/DJDIR/pdcur_cvs/PDCurses/lib -L/dev/env/DJDIR/watt32/lib -lwmemu" \
/dev/env/DJDIR/bin/bash.exe ./configure  \
--datadir=/dev/env/DJDIR/lib \
--sysconfdir=/dev/env/DJDIR/lib \
--disable-dired-override \
--disable-full-paths \
--enable-addrlist-page \
--enable-change-exec \
--enable-cgi-links \
--enable-charset-choice \
--enable-exec-links \
--enable-externs \
--enable-nested-tables \
--enable-nls \
--enable-scrollbar \
--enable-vertrace \
--with-bzlib \
--with-mime-libdir=/dev/env/DJDIR/lib \
--with-screen=curses \
--with-ssl \
--with-zlib
