#!/bin/bash

# fallback static ip
# will be overwritten quickly by the dhcp client
echo "ifconfig4 10.10.0.$((RANDOM % 251))/24" >> /etc/peervpn.conf

# launch peervpn
peervpn /etc/peervpn.conf
