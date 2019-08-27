#! /bin/sh -x

U=$(/usr/bin/logname)
if [ $U = _reportmemoryexception ] ; then
    echo "*** Working around LOGNAME BUG" >&2
    exit 1
fi

cat >/etc/sudoers.d/$U-$(/usr/bin/basename PROGRAM) <<EOF
$U	ALL=(ALL) NOPASSWD:  ROOT/PROGRAM
EOF

launchctl load ROOT/LIBDIR/LABEL.plist
exit
