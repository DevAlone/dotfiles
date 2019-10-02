#!/usr/bin/env bash

SSLKEYLOGFILE="/home/user/wireshark/sslkeylogfile.txt" \
	mitmproxy \
		--mode transparent \
		--showhost \
		-w "/home/user/tmp/mitm.log" \
		$* 
		# -s /home/user/bin/mitmproxy_body_saver.py $*

