#!/usr/bin/env bash

#
# Install
#

# Delete old version
rm -rf ../core/bin
rm -rf ../core/share

# Install new version
cp -rf ./n2n/build/usr/bin   ../core/
cp -rf ./n2n/build/usr/share ../core/

# Clean
rm -rf ./n2n
