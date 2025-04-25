# Zoom Bot How-To

This how-to will walk you through creating a computer dedicated to hosting Zoom meetings. It uses a very light version of Linux Mint and Zoom, and will run on almost any PC computer that has been released in the past decade.

It includes options for creating multiple meeting shortcuts on the desktop for easy launching, and the option to automatically start one of the meetings when the computer boots up.

## Installing Linux Mint

* [Download the Lightweight ISO](https://linuxmint.com/edition.php?id=320)
* Burn it to a USB drive with [Etcher](https://etcher.balena.io/)
* Boot to the USB drive, and click `Install Linux Mint` on the desktop
    * Follow to prompts to select your language and keyboard, then click Continue
    * Join a WiFi network
    * Check `Install multimedia codecs`, then Liclick `Continue`
    * Select `Erase disk and install Linux Mint`, click `Install Now`, then click `Continue` (**This will complete delete everything on the computer!**)
    * Select your time zone, then click `Continue`
    * Fill out your details to create an initial user and password, select `Log in automatically`, then click `Continue`.
 * After installation is complete, click `Restart Now`. You'll be prompted to remove the USB drive, and hit `Enter`.

## Configuring Zoom Meetings

* Uncheck `Show this dialog at startup` and close the `Welcome` window.
* Open the Terminal (it is a square, black icon on the Taskbar

![image](https://github.com/user-attachments/assets/ea14d6a5-096a-4e5b-9925-3ca79c9a7fd1)

* In the terminal, enter the following code:

```bash
curl -LsSf https://raw.githubusercontent.com/FlipperPA/zoom-bot-linux-mint/refs/heads/main/zoombot.sh -o /tmp/zoombot.sh && . /tmp/zoombot.sh
```

* First, the script will install Zoom on the computer.
    * When prompted for the password, enter the password for the username you selected above.
    * When it asks you to install additional packages that will require more disk space, select `YES`.
* Next, you will be prompted you for Zoom Meeting information to create shortcut icons on the desktop. For each meeting, enter:
    * The meeting name (`My Meeting`)
    * The meeting ID (`1231231234`)
    * The meeting password hash value (`U1ErUUU0OUpxWjZMeExzS1BpRmc2QT09`)
* When you are done adding meetings, leave the meeting name blank and hit enter. Then type `exit` to close the Terminal.

## Final Steps

* Click each icon on your desktop, and when the dialog appears, click `Make Executable`. You only have to do this the first time for each.
* Install the latest updates. The update center appears as a shield in the lower-right hand corner of your screen.

![image](https://github.com/user-attachments/assets/c4efdfab-80cb-4ec3-896d-82a3c5ec286f)

* You may wish to increase the size of the Desktop icons. Right click the empty desktop -> `Desktop Settings` -> `Icons`
    * `Icon size` can be increased to 192
    * `Use custon font size` can be increased to 144
