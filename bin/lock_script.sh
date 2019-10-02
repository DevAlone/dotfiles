#!/bin/bash

i3lock -i /home/user/wallpapers/bsod.png --ignore-empty-password --show-failed-attempts -c 000000

exit

case $(($RANDOM%10)) in 
0 )
        i3lock -i /home/user/.config/openbox/3.png --ignore-empty-password --show-failed-attempts -c 000000
;;
[1-9] ) 
	# Take a screenshot
	scrot /tmp/screen_locked.png
	# Pixellate it
	mogrify -scale 5% -scale 2000% /tmp/screen_locked.png
	# Lock screen displaying this image.
	i3lock -i /tmp/screen_locked.png --ignore-empty-password --show-failed-attempts -c 000000 --pointer=default
;;
esac
