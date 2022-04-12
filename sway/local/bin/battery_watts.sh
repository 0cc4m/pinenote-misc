#!/bin/bash

CURRENT=$(cat /sys/class/power_supply/rk817-battery/current_avg)
VOLTAGE=$(cat /sys/class/power_supply/rk817-battery/voltage_avg)

((POWER=CURRENT*VOLTAGE))

POWER_WATTS=$(echo "$POWER/1000000000000" | bc -l)

printf "%.1f" $POWER_WATTS
