#!/bin/bash

light -s sysfs/backlight/backlight_warm -O
light -s sysfs/backlight/backlight_warm -S 0
light -s sysfs/backlight/backlight_cool -O
light -s sysfs/backlight/backlight_cool -S 0
imv -f ~/Pictures/cat.jpg
