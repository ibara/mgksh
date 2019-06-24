#!/bin/sh

echo Building mgksh...
echo First we need to build ncurses...

cd ncurses
CC=cc ./configure --without-ada --without-cxx --disable-db-install --without-manpages --without-progs --without-tests --without-debug --disable-database --with-fallbacks=vt100 --disable-termcap --enable-widec --enable-sigwinch
make

echo Finished building ncurses...
echo Now onto building mgksh itself...

cd ..
make

echo Done!
echo You can install with:
echo install -c -s -o root -g bin -m 555 mgksh /bin/mgksh
