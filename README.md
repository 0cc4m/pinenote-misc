# pinenote-misc

## mesa-archlinux-arm
This contains a PKGBUILD and prebuilt versions of mesa for Arch Linux ARM on the PineNote, modified to support the rockchip\_ebc eink driver for panfrost GPU acceleration.

The origin of the PKGBUILD is the [Arch Linux for ARM PKGBUILD Repository](https://github.com/archlinuxarm/PKGBUILDs/tree/master/extra/mesa)

You need to enable the GPU in the kernel device tree first. [Here](https://github.com/DorianRudolph/pinenotes#gpu) is information on how to do that. No u-boot modifications were necessary in my case.

### Pre-built packages
* [Mesa 22.0.1-3-aarch64](mesa-archlinux-arm/pkgs/mesa-22.0.1-3-aarch64.tar)
* [Mesa 22.0.0-1.1-aarch64](mesa-archlinux-arm/pkgs/mesa-22.0.0-1.1-aarch64.tar)
* [Mesa 22.0.0-1-aarch64](mesa-archlinux-arm/pkgs/mesa-22.0.0-1-aarch64.tar)
* [Mesa 21.3.7-2-aarch64](mesa-archlinux-arm/pkgs/mesa-21.3.7-2-aarch64.tar)

## Koreader

Koreader does not provide an Archlinux-build, so I used [debtap](https://github.com/helixarch/debtap) to convert the [latest .deb](https://github.com/koreader/koreader/releases/tag/v2022.03.1) to an Archlinux-package.

* [koreader-2022.03.1-1-aarch64](koreader/koreader-2022.03.1-1-aarch64.pkg.tar.zst)

## Sway

My sway config, mostly customizations on window representation, grayscale compatibility and touch functionality using waybar.

Files in `sway/config` belong in `~/.config` and files in `sway/local` belong in `~/.local`.

To automatically start sway I used [autologin](https://git.sr.ht/~kennylevinsen/autologin), but because I had issues with missing environment I used commit `ba01e1630742c08d81a8d8a6dd961080c90bc63b`. For some reason sourcing the environment was removed afterwards.

Install the required programs with:
`sudo pacman -S sway swayidle polkit-gnome network-manager-applet alacritty ttf-dejavu ttf-font-awesome light imv wtype`
and the AUR programs:
`swaylock-fancy squeekboard ulauncher waybar-git`
(waybar-git until my battery-compatibility patch arrives in the community package)

## PineNote swayidle

I use `imv` for the fullscreen image and `light` for backlight control.

Put [before_sleep.sh](sway/local/bin/before_sleep.sh) and [after_resume.sh](sway/local/bin/after_resume.sh) in `.local/bin`, set executable flag and use something like the following swayidle command:
`swayidle timeout 600 "systemctl suspend" before-sleep "~/.local/bin/before_sleep.sh" after-resume "~/.local/bin/after_resume.sh"`

Change the image path to an existing picture on your device.
To give my user account access to the backlight I created udev rules [backlight.rules](udev/backlight.rules) and added my user to the video group.

## Firefox Hardware Acceleration

Firefox disables hardware acceleration by default on aarch64, to enable it set `MOZ_ENABLE_WAYLAND=1` in your environment to run Firefox in native Wayland mode, then set `gfx.webrender.all` to true in `about:config`. `about:support` should now show `WebRender` under `Compositing`, instead of `WebRender (Software)`.
