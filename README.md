# peervpn-docker

DHCP and Docker-ized peervpn scripts. (If the DHCP-server node fails, future
clients will pick a random static ip and pray that they don't over step anyone.)

By default, DHCP clients are in the 10.10.0.10 to 10.10.0.250 block.<br>
Static clients are in the 10.10.1.0 to 10.10.1.255 block.

Master DHCP server is 10.10.0.1

## Usage

Edit peervpn.conf to whatever you want. You should definitely generate a new
64-character password (with `pwgen` etc.) to replace the PSK that's shared
between all your devices.

Then add your public-facing peers (e.g. VPSs) to `initpeers`.

Then build.

Or... just write your peervpn.conf and run the pre-compiled image:

```console
$ docker run --cap-add NET_ADMIN --network=host --device=/dev/net/tun -v $PWD/peervpn.conf:/etc/peervpn.conf -it ryanmjacobs/peervpn`
```

(add the `-d` flag to run in background)

## Releases

### 1.2
DHCP clients, with a single DHCP server node. TODO: have one client launch a
DHCP server if the main server goes down.

### 1.1
Removed random IP generation.

### 1.0

Everything works great!
