#!/usr/bin/env bash 

rsync -r -a -v -e "ssh -p 22222" user@`cat ~/kimsufi_ip`:/home/db_dumps /mnt/data
