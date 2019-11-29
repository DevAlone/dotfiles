#!/usr/bin/env python3

import os
import time
import psutil
import subprocess


programs_to_start = [
#     'setxkbmap -layout "us,ru" -model "pc105" -option "grp:alt_shift_toggle,grp_led:scroll"',
    'setxkbmap -layout us,ru -model pc105 -option grp:alt_shift_toggle,grp_led:scroll',
    ['kmix'],
    ['nm-applet'],
    'setxkbmap -option caps:swapescape',
#     ['compton', '-b'],
    "xss-lock -- i3lock -n",
    "/home/user/bin/libinput_settings.sh",
    "xfce4-power-manager",
    "aa-notify -p -v -f /var/log/audit/audit.log",
    "numlockx",
#    'xmodmap -e "keycode 77 = """'
]


def run_if_not_present(args):
    proc_iter = psutil.process_iter(attrs=["pid", "name", "cmdline"])
    is_running = any(args[0] in p.info["cmdline"] for p in proc_iter)
    if is_running:
        return

    print(f"running \"{args}\"")
    subprocess.Popen(args)
    time.sleep(0.1)


def args_from_command(command):
    return [arg.strip() for arg in command.split()]


if __name__ == '__main__':
    for args in programs_to_start:
        if type(args) is str:
            args = args_from_command(args)

        run_if_not_present(args)
