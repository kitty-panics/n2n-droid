#!/usr/bin/env bash

#
# make openssl
#

# 复制工作目录
rm -rf ./build.openssl
cp -rf ./plug.openssl ./build.openssl

# 进入工作目录
cd ./build.openssl

# 设置 NDK 环境
ENV_SDK_PATH="$(which env-droid-ndk)"
ENV_NDK_PATH="$(which env-droid-ndk)"
source "$ENV_SDK_PATH"
source "$ENV_NDK_PATH"

# Patch
#sed -i '188,191 s/^/#/' ./Configurations/15-android.conf

# 编译
./Configure android-arm64 -D__ANDROID_API__=31
make -j32

# 清理 .so
rm -rf *.so
