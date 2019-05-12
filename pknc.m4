<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>LABEL</string>
        <key>Program</key>
        <string>ROOT/PROGRAM</string>
ifdef(`DEBUG',
`        <key>StandardInPath</key>
        <string>/tmp/test.stdin</string>
        <key>StandardOutPath</key>
        <string>/tmp/test.stdout</string>
        <key>StandardErrorPath</key>
        <string>/tmp/test.stderr</string>'
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
