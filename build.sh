#!/bin/bash

ver=1.6

pushd client
docker build -t ryanmjacobs/peervpn-client:$ver .
popd

pushd server
docker build -t ryanmjacobs/peervpn-server:$ver .
popd
