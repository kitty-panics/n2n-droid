#!/usr/bin/env bash

#
# make lib-miniupnp
#

# 复制工作目录
rm -rf ./build.miniupnp
cp -rf ./plug.miniupnp ./build.miniupnp

# 进入工作目录
cd ./build.miniupnp/miniupnpc

# 设置 NDK 环境
ENV_NDK_PATH="$(which env-droid-ndk)"
source "$ENV_NDK_PATH"

# Patch
sed -i -E -e '3a#define MINIUPNP_STATICLIB 1' ./include/miniupnpc_declspec.h

# 编译
make -j32
cp -a ./include ./build/miniupnpc

# 清理 .so
rm ./build/libminiupnpc.so
