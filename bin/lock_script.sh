#!/usr/bin/env bash

function cleanup() {
	"$HOME"/bin/init_layout.sh
}
trap cleanup EXIT

# set the layout to US to not guess the current one
setxkbmap -layout us

case $((RANDOM%10)) in 
[0-5] )
	IMAGE=/home/$USER/wallpapers/bsod.png
	i3lockmore --image-fill "$IMAGE"
;;
[6-9] ) 
	IMAGE=/tmp/screen_locked.png
	# Take a screenshot
	scrot $IMAGE
	# Pixellate it
	mogrify -scale 5% -scale 2000% $IMAGE
	# mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
	# mogrify -scale 2.5% -scale 4000% /tmp/screen_locked.png
	IMAGE=/tmp/screen_locked.png
	i3lock --tiling -i $IMAGE --ignore-empty-password --show-failed-attempts -c 000000 --nofork
;;
esac


# i3lock --tiling -i /home/$USER/wallpapers/bsod.png --ignore-empty-password --show-failed-attempts -c 000000
# i3lock -i /tmp/screen_locked.png --ignore-empty-password --show-failed-attempts -c 000000 --pointer=default
