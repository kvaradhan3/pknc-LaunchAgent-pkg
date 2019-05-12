#! /bin/sh

launchctl unload ROOT/LIBDIR/LABEL.plist
rm     ROOT/LIBDIR/LABEL.plist
rm -rf $(dirname ROOT/PROGRAM)
exit
