#! /bin/sh

PROG=$(basename ROOT/PROGRAM)

launchctl unload ROOT/LIBDIR/LABEL.plist
sleep 1

rm     /etc/sudoers.d/$(logname)-$PROG
rm -f  /tmp/$PROG.stdin /tmp/$PROG.stdout /tmp/$PROG.stderr
rm     ROOT/LIBDIR/LABEL.plist


rm -rf $(dirname ROOT/PROGRAM)
exit
