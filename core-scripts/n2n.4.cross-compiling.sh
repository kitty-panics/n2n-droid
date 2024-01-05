#!/usr/bin/env bash
#
# docs:
# - https://developer.android.com/ndk/guides/other_build_systems

# NDK Path
NDK=$(cat ../tools/ndk.info)

# TOOLCHAIN and TARGET
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
export TARGET=aarch64-linux-android

# Configure
export API=24 # minSdkVersion (Follow Termux)
export AR=$TOOLCHAIN/bin/llvm-ar
export CC=$TOOLCHAIN/bin/$TARGET$API-clang
export AS=$CC
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
export LD=$TOOLCHAIN/bin/ld
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip

# Build
cd ./n2n
! -d ./build || mkdir ./build
./autogen.sh
./configure --host=$TARGET --enable-cap
DESTDIR=./build make -j32 install
