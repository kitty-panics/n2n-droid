#!/usr/bin/env bash

#
# make libcap
#

# 复制工作目录
rm -rf ./build.libcap
cp -rf ./plug.libcap ./build.libcap

# 进入工作目录
cd ./build.libcap/libcap

# 设置 NDK 环境
ENV_NDK_PATH="$(which env-droid-ndk)"
source "$ENV_NDK_PATH"

# 编译
sed -i 's/\t\$(BUILD_CC)/\tgcc/' Makefile
make  CC="$CC" -j32 libcap.a
#make -j32 libcap.a
