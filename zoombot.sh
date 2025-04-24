#!/bin/bash
gsettings set org.cinnamon.desktop.screensaver lock-enabled false
gsettings set org.cinnamon.desktop.interface icon-size 192
wget https://zoom.us/client/latest/zoom_amd64.deb && apt install ./zoom_amd64.deb && rm zoom_amd64.deb

DESKTOP_DIR="$HOME/Desktop"
AUTOSTART_DIR="$HOME/.config/autostart"
mkdir -p "$AUTOSTART_DIR"

while true; do
    read -p "Enter Zoom Meeting Name (or leave blank and hit enter to finish): " MEETING_NAME
    if [[ -z "$MEETING_NAME" ]]; then
        echo "Done creating meeting shortcuts."
        break
    fi

    read -p "Enter Zoom Meeting ID (or leave blank to finish): " MEETING_ID
    read -p "Enter Zoom Password Hash: " PASSWORD

    if [[ -z "$STARTUP_MEETING_EXISTS" ]]; then
        read -p "Automatically Start This Meeting on Boot? [Y/N]: " MEETING_START
    fi

    FILENAME="$DESKTOP_DIR/Zoom-${MEETING_NAME}.desktop"

    echo "Creating launcher for Meeting ID $MEETING_ID..."

    cat > "$FILENAME" <<EOF
[Desktop Entry]
Name=$MEETING_NAME
Exec=zoom 'zoommtg://zoom.us/join?action=join&confno=$MEETING_ID&pwd=$PASSWORD&zc=0&uname=$MEETING_NAME'
Type=Application
Terminal=false
Icon=/usr/share/pixmaps/Zoom.png
EOF

    # Mark the shortcut as safe to run
    chmod +x "$FILENAME"
    gio set "$FILENAME" "metadata::trusted" yes 2>/dev/null || true
    touch "$FILENAME"
    echo "Shortcut created: $FILENAME"

    if [[ "$MEETING_START" =~ ^[Yy]$ && -z "$STARTUP_MEETING_EXISTS" ]]; then
        AUTOSTART_FILE="$AUTOSTART_DIR/Zoom-${MEETING_NAME}.desktop"
        cp "$FILENAME" "$AUTOSTART_FILE"
        chmod +x "$AUTOSTART_FILE"
        echo "Autostart enabled for: $MEETING_NAME"
        STARTUP_MEETING_EXISTS=true
    fi
done

cat > "$DESKTOP_DIR/shutdown.desktop" <<EOF
[Desktop Entry]
Name=Shutdown Computer
Exec=shutdown -r now
Type=Application
Terminal=false
Icon=/usr/share/pixmaps/debian-logo.png
EOF

# Mark the shortcut as safe to run
chmod +x "$DESKTOP_DIR/shutdown.desktop"
gio set "$DESKTOP_DIR/shutdown.desktop" "metadata::trusted" yes 2>/dev/null || true
touch "$DESKTOP_DIR/shutdown.desktop"
echo "Shortcut to shutdown created. ALL DONE! You can type 'exit' now."
