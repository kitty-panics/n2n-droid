#!/usr/bin/env bash

#
# make lib-natpmp
#

# 复制工作目录
rm -rf ./build.libnatpmp
cp -rf ./plug.libnatpmp ./build.libnatpmp

# 进入工作目录
cd ./build.libnatpmp

# 设置 NDK 环境
ENV_NDK_PATH="$(which env-droid-ndk)"
source "$ENV_NDK_PATH"

# Patch
sed -i -E -e '3a#define NATPMP_STATICLIB 1' ./natpmp_declspec.h

# 编译
make -j32 libnatpmp.a
