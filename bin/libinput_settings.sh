#!/usr/bin/env bash

# touchpad
device_name="SynPS/2 Synaptics TouchPad"

# tapping
xinput set-prop "$device_name" "libinput Tapping Enabled" 1
# speed
xinput set-prop "$device_name" "libinput Accel Speed" 0.35
