#!/usr/bin/env bash

# pulseaudio -k; pulseaudio --start
pactl load-module module-loopback latency_msec=1
