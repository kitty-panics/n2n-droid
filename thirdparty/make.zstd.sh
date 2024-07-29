#!/usr/bin/env bash

#
# make zstd
#

# 复制工作目录
rm -rf ./build.zstd
cp -rf ./plug.zstd ./build.zstd

# 进入工作目录
cd ./build.zstd/lib

# 设置 NDK 环境
ENV_NDK_PATH="$(which env-droid-ndk)"
source "$ENV_NDK_PATH"

# 编译
make -j32 libzstd.a
