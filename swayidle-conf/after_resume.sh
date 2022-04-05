#!/bin/bash

light -s sysfs/backlight/backlight_warm -I
light -s sysfs/backlight/backlight_cool -I
killall imv-wayland
