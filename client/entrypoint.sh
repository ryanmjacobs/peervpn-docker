#!/bin/bash
cp /{etc,tmp}/peervpn.conf

# generate static ip (for worst case if dhcp fails)
static_ip="10.10.1.$((RANDOM % 251))"
echo "ifconfig4 ${static_ip}/23" >> /tmp/peervpn.conf

# dhcp client
# WARNING: this timeout command is stupid; future OS versions deprecated
#          the dash -t and this will throw an error. Busybox 1.29 -> 1.30
#          breaks this
echo "upcmd timeout -t 25 udhcpc -i peervpn0 &" >> /tmp/peervpn.conf

# launch peervpn
peervpn /tmp/peervpn.conf
