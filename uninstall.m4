#! /bin/sh

launchctl unload ROOT/LIBDIR/LABEL.plist
rm     ROOT/LIBDIR/LABEL.plist
rm -rf $(dirname ROOT/PROGRAM)

PROG=$(basename ROOT/PROGRAM)

rm     /etc/sudoers.d/$(logname)-$PROG
rm -f  /tmp/$PROG.stdin /tmp/$PROG.stdout /tmp/$PROG.stderr
exit
