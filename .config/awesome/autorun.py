#!/usr/bin/env python3

import os
import time
import psutil
import subprocess

HOME = os.environ["HOME"]


programs_to_start = [
    #     'setxkbmap -layout "us,ru" -model "pc105" -option "grp:alt_shift_toggle,grp_led:scroll"',
    "setxkbmap -layout us,ru -model pc105 -option grp:alt_shift_toggle,grp_led:scroll",
    ["kmix"],
    ["nm-applet"],
    "setxkbmap -option caps:swapescape",
    ["compton", "-b"],
    "xss-lock -- i3lock -n",
    "xfce4-power-manager",
    "numlockx",
    #    'xmodmap -e "keycode 77 = """',
]

if os.environ["COMPUTER_TYPE"] != "work_laptop":
    programs_to_start.extend(
        [
            "/home/user/create_hotspot_and_wait_forever.sh",
            "/home/user/bin/libinput_settings.sh",
            "aa-notify -p -v -f /var/log/audit/audit.log",
        ]
    )

if os.environ["COMPUTER_TYPE"] == "work_laptop":
    programs_to_start.extend(
        [
            "xrandr --output eDP-1 --mode 1368x768",
            HOME + "/bin/configure_touchpad.sh",
            # remap Menu key to right control
            'xmodmap -e "keycode 135 = Control_R"',
        ]
    )


def run_if_not_present(args):
    proc_iter = psutil.process_iter(attrs=["pid", "name", "cmdline"])
    # print([p.info["cmdline"] for p in proc_iter])
    # print(args[0])
    is_running = any(args[0] in p.info["cmdline"] for p in proc_iter)
    if is_running:
        return

    print(f'running "{args}"')
    subprocess.Popen(args)
    time.sleep(0.1)


def args_from_command(command):
    return [arg.strip() for arg in command.split()]


if __name__ == "__main__":
    for args in programs_to_start:
        if type(args) is str:
            args = args_from_command(args)

        run_if_not_present(args)
