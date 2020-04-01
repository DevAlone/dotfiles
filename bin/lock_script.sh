#!/bin/bash

case $(($RANDOM%10)) in 
[0-5] )
	IMAGE=/home/$USER/wallpapers/bsod.png
	i3lockmore --image-fill $IMAGE
;;
[6-9] ) 
	# Take a screenshot
	scrot /tmp/screen_locked.png
	# Pixellate it
	mogrify -scale 5% -scale 2000% /tmp/screen_locked.png
	# mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
	# mogrify -scale 2.5% -scale 4000% /tmp/screen_locked.png
	IMAGE=/tmp/screen_locked.png
	i3lock --tiling -i $IMAGE --ignore-empty-password --show-failed-attempts -c 000000
;;
esac


# i3lock --tiling -i /home/$USER/wallpapers/bsod.png --ignore-empty-password --show-failed-attempts -c 000000
# i3lock -i /tmp/screen_locked.png --ignore-empty-password --show-failed-attempts -c 000000 --pointer=default
