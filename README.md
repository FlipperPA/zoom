# Zoom Bot How-To

This how-to will walk you through creating a computer dedicated to hosting Zoom meetings. It uses a very light version of Linux Mint and Zoom, and will run on almost any PC computer that has been released in the past decade.

It includes options for creating multiple meeting shortcuts on the desktop for easy launching, and the option to automatically start one of the meetings when the computer boots up.

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

## Final Steps

* Install the latest updates. The update center appears as a shield in the lower-right hand corner of your screen.

![image](https://github.com/user-attachments/assets/c4efdfab-80cb-4ec3-896d-82a3c5ec286f)

* You may wish to increase the size of the Desktop icons. Right click the empty desktop -> `Desktop Settings` -> `Icons`
    * `Icon size` can be increased to 192
    * `Use custon font size` can be increased to 144
