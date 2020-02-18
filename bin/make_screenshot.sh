#!/usr/bin/env bash

filename=$HOME/screenshots/$(date +%Y-%m-%d-%T)-screenshot.png

sleep 0.3s;

case $1 in
	selection)
		scrot -s $filename
		;;
	window)
		scrot -u $filename
		;;
	*)
		scrot $filename
		;;
esac

xclip -selection clipboard -t image/png -i $filename
