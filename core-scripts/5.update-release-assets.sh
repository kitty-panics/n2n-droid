#!/usr/bin/env bash

#
# Install
#

rm -rf ../core/bin
rm -rf ../core/share

cp -rf ./n2n/build/usr/bin   ../core/
cp -rf ./n2n/build/usr/share ../core/
