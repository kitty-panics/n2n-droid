#!/usr/bin/env bash

#
# make libpcap
#

# 复制工作目录
rm -rf ./build.libpcap
cp -rf ./plug.libpcap ./build.libpcap

# 进入工作目录
cd ./build.libpcap

# 设置 NDK 环境
ENV_NDK_PATH="$(which env-droid-ndk)"
source "$ENV_NDK_PATH"

# 编译
./autogen.sh    
./configure --host=$TARGET
make -j32 libpcap.a
