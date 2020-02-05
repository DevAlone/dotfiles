#!/usr/bin/env bash

if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
        # Older Debian/Ubuntu/etc.
        OS=Debian
        VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
        # Older SuSE/etc.
        OS=SuSe
elif [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentOS, etc.
        OS=RedHat
else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
        OS=$(uname -s)
        VER=$(uname -r)
fi

case "$OS" in
        "Debian GNU/Linux")
                ;;
        "Fedora")
                dnf install -y kmix compton xss-lock xfce4-power-manager numlockx network-manager-applet dmenu @development-tools redhat-rpm-config python2-devel python3-devel
		pip3 install psutil
                ;;
        *)
                echo "Your distribution '$OS' is not supported yet"
                ;;
esac
