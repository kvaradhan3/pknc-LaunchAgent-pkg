#! /bin/sh

ROOT=
PROG=$(basename $(pwd))
PROGRAM=usr/local/share/$PROG/$PROG
LIBDIR=Library/LaunchAgents
LABEL=org.ieee.kannan.$PROG

if test "$1" = '-d'
then
    DEBUG=:
fi

templateCopy() {
    src=$1
    dst=$2

    flags="-DLABEL=$LABEL      \
        -DPROG=$PROG        \
        -DPROGRAM=$PROGRAM  \
        -DROOT=$ROOT        \
        -DLIBDIR=$LIBDIR"
    if ${DEBUG:-false} 
    then
	flags="$flags -DDEBUG"
    fi
    m4 $flags $src > $dst
    chmod 0755       $dst
    chown root:wheel $dst
}

mkdir -p payload/$(dirname $PROGRAM) payload/$LIBDIR Scripts

templateCopy pknc.rb        ./payload/$PROGRAM
templateCopy pknc.m4        ./payload/$LIBDIR/$LABEL.plist
templateCopy uninstall.m4   ./payload/$(dirname $PROGRAM)/uninstall
templateCopy preinstall.m4  ./Scripts/preinstall
templateCopy postinstall.m4 ./Scripts/postinstall

pkgbuild --identifier $LABEL --root ./payload --scripts ./Scripts $PROG.pkg

exit

