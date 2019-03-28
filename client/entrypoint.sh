#!/bin/bash

# fallback static ip
# should be overwritten quickly by the dhcp client
echo "ifconfig4 10.10.1.$((RANDOM % 251))/23" >> /etc/peervpn.conf
echo "upcmd udhcpc -i peervpn0" >> /etc/peervpn.conf

# launch peervpn
peervpn /etc/peervpn.conf
