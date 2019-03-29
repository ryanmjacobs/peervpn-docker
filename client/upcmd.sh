#!/bin/bash

# dhcp client
dhclient -v peervpn0

# route modification
route del -net 0.0.0.0 gw 10.10.0.1
route del -net 0.0.0.0 gw 10.10.0.1
route del -net 0.0.0.0 gw 10.10.0.1
