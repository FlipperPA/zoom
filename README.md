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
curl -LsSf https://raw.githubusercontent.com/FlipperPA/zoom-bot-linux-mint/refs/heads/main/zoombot.sh | bash
```
