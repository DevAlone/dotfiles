#!/usr/bin/env bash

from_interface="enp7s0"
to_interface="tun0"
# to_interface="wlp13s0"

iptables -F
iptables -t nat -F

# Always accept loopback traffic
iptables -A INPUT -i lo -j ACCEPT

# We allow traffic from the LAN side
iptables -A INPUT -i $from_interface -j ACCEPT

######################################################################
#
#                         ROUTING
#
######################################################################

# eth0 is LAN
# eth1 is WAN

# Allow established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# Masquerade.
iptables -t nat -A POSTROUTING -o $to_interface -j MASQUERADE
# fowarding
iptables -A FORWARD -i $to_interface -o $from_interface -m state --state RELATED,ESTABLISHED -j ACCEPT
# Allow outgoing connections from the LAN side.
iptables -A FORWARD -i $from_interface -o $to_interface -j ACCEPT

ifconfig $from_interface 10.11.0.1 netmask 255.255.255.0
killall dnsmasq
dnsmasq \
	--interface=$from_interface \
	--listen-address=10.11.0.1 \
	--dhcp-range=10.11.0.3,10.11.0.254,96h \
	--dhcp-option=option:router,10.11.0.1 \
	--dhcp-option=option:dns-server,10.11.0.1 \
	--bind-interfaces
