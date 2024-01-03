#!/usr/bin/env bash

find ../core/bin -type f -not -name "*.conf" -exec rm {} \;
rm -rf ../core/share/*

cp -rf ./n2n/build/usr/bin/*   ../core/bin/
cp -rf ./n2n/build/usr/share/* ../core/share/
