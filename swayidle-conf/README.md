# PineNote swayidle

I use `imv` for the fullscreen image and `light` for backlight control.

Put `before_sleep.sh` and `after_resume.sh` in `.local/bin`, set executable flag and use something like the following swayidle command:
`swayidle timeout 600 "systemctl suspend" before-sleep "~/.local/bin/before_sleep.sh" after-resume "~/.local/bin/after_resume.sh"`

Change the image path to an existing picture on your evice.
To give my user account access to the backlight I created udev rules (`backlight.rules`) and added my user to the video group.
