# zoom-bit-linux-mint

These instructions will let you build a dedicated computer to use Zoom as a hardware appliance.

## Installing Linux Mint

* [Download the Lightweight ISO](https://linuxmint.com/edition.php?id=320)
* Burn it to a USB drive with [Etcher](https://etcher.balena.io/)
* Install Linux Mint, create a user, and set it to login on boot

## Configuring Zoom Meetings

* Open the Terminal (it is a square, black icon on the Taskbar

![image](https://github.com/user-attachments/assets/ea14d6a5-096a-4e5b-9925-3ca79c9a7fd1)

* In the terminal, enter the following code:

```bash
curl -LsSf https://raw.githubusercontent.com/FlipperPA/zoom-bot-linux-mint/refs/heads/main/zoombot.sh -o /tmp/zoombot.sh && . /tmp/zoombot.sh
```

* This script will install Zoom, and prompt you for Zoom Meeting information to create shortcut icons on the desktop. For each meeting, enter:
    * The meeting name (`My Meeting`)
    * The meeting ID (`1231231234`)
    * The meeting password hash value (`U1ErUUU0OUpxWjZMeExzS1BpRmc2QT09`)
* When you are done adding meetings, leave the meeting name blank and hit enter. Then type `exit` to close the Terminal.

Scratch:

```bash
for schema in $(gsettings list-schemas); do gsettings list-keys "$schema" | grep -i icon | sed "s|^|$schema |"; done
```
