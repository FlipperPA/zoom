#!/bin/bash
gsettings set org.cinnamon.desktop.screensaver lock-enabled false
gsettings set org.nemo.desktop icon-size 256
# wget https://zoom.us/client/latest/zoom_amd64.deb && apt install ./zoom_amd64.deb && rm zoom_amd64.deb

DESKTOP_DIR="$HOME/Desktop"

while true; do
    read -p "Enter Zoom Meeting Name (or leave blank and hit enter to finish): " MEETING_NAME
    if [[ -z "$MEETING_NAME" ]]; then
        echo "Done creating meeting shortcuts."
        break
    fi

    read -p "Enter Zoom Meeting ID (or leave blank to finish): " MEETING_ID
    read -p "Enter Zoom Password Hash: " PASSWORD

    FILENAME="$DESKTOP_DIR/Zoom-${MEETING_NAME}.desktop"

    echo "Creating launcher for Meeting ID $MEETING_ID..."

    cat > "$FILENAME" <<EOF
[Desktop Entry]
Name=$MEETING_NAME
Exec=zoom 'zoommtg://zoom.us/join?action=join&confno=$MEETING_ID&pwd=$PASSWORD&zc=0&uname=$MEETING_NAME'
Type=Application
Terminal=false
Icon=zoom
EOF

    chmod +x "$FILENAME"
    gio set "$FILENAME" "metadata::trusted" yes 2>/dev/null
    echo "Shortcut created: $FILENAME"
done
