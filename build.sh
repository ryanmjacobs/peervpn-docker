#!/bin/bash

ver=1.7

pushd client
docker build -t ryanmjacobs/peervpn-client:$ver .
popd

pushd server
docker build -t ryanmjacobs/peervpn-server:$ver .
popd

pushd peervpn-dhcp-server
docker build -t ryanmjacobs/peervpn-dhcp-server:$ver .
popd
