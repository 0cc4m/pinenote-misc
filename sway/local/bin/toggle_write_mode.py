#!/usr/bin/env python

import os
import sys

LUT_FILE = "/sys/module/rockchip_ebc/parameters/lut_type"
REFRESH_FILE = "/sys/module/rockchip_ebc/parameters/force_refresh"

state = False
with open(LUT_FILE, "r") as fd:
    state = fd.read()[0] != "7"

if not state:
    with open(LUT_FILE, "w") as fd:
        fd.write("4")
    os.system("swaymsg input 0:0:cyttsp5 events disabled")
else:
    with open(LUT_FILE, "w") as fd:
        fd.write("7")
    with open(REFRESH_FILE, "w") as fd:
        fd.write("1")
    os.system("swaymsg input 0:0:cyttsp5 events enabled")
