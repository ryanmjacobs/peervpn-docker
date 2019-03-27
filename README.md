# peervpn-docker

## Usage

Edit peervpn.conf to whatever you want. You should definitely generate a new
64-character password (with `pwgen` etc.) to replace the PSK that's shared
between all your devices.

Then add your public-facing peers (e.g. VPSs) to `initpeers`.

Or....

```console
$ docker run --cap-add NET_ADMIN --network=host -v $PWD/peervpn.conf:/etc/peervpn.conf -it ryanmjacobs/peervpn`
```

(add the `-d` flag to run in background)

## Releases

### 1.0

Everything works great!
