<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>LABEL</string>
        <key>ProgramArguments</key>
        <array>
            <string>/usr/bin/sudo</string>
            <string>ROOT/PROGRAM</string>
        </array>
ifdef(`DEBUG',dnl
        <key>StandardInPath</key>
        <string>/tmp/PROG.stdin</string>
        <key>StandardOutPath</key>
        <string>/tmp/PROG.stdout</string>
        <key>StandardErrorPath</key>
        <string>/tmp/PROG.stderr</string>'
)dnl
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <dict>
            <key>SuccessfulExit</key>
            <false/>
        </dict>
    </dict>
</plist>
