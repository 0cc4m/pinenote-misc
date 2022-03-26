# pinenote-misc

## mesa-archlinux-arm
This contains a PKGBUILD and prebuilt versions of mesa for Arch Linux ARM on the PineNote, modified to support the rockchip\_ebc eink driver for panfrost GPU acceleration.

The origin of the PKGBUILD is the [Arch Linux for ARM PKGBUILD Repository](https://github.com/archlinuxarm/PKGBUILDs/tree/master/extra/mesa)

You need to enable the GPU in the kernel device tree driver first. [Here](https://github.com/DorianRudolph/pinenotes#gpu) is information on how to do that. No u-boot modifications were necessary in my case.
