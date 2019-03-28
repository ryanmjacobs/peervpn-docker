#!/bin/bash

version=1.3

pushd client
docker build -t ryanmjacobs/peervpn-client:1.4 .
popd

pushd server
docker build -t ryanmjacobs/peervpn-server:1.4 .
popd
