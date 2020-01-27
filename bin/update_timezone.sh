#!/usr/bin/env bash

timedatectl set-timezone $(curl https://ipapi.co/timezone 2> /dev/null)
