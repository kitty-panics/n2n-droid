#!/usr/bin/env bash

#
# Cross Compiling
#
# Docs:
# - https://developer.android.com/ndk/guides/other_build_systems
# - https://github.com/hamishcoleman/n3n/blob/main/doc/BuildConfig.md
# - https://github.com/ntop/n2n/issues/1110

# Set NDK ENV
ENV_NDK_PATH="$(which env-droid-ndk)"
source "$ENV_NDK_PATH"

# Configure
mkdir -p ./n2n/build; cd ./n2n
./autogen.sh
./configure CFLAGS="$CFLAGS -O3" --host=$TARGET

# Configure Static Libs
    # zstd
echo "#define HAVE_LIBZSTD 1" >>include/config.h
echo 'LDLIBS_EXTRA+=-lzstd' >>config.mak
echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.zstd/lib/)' >>config.mak
echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.zstd/lib/)' >>config.mak
    # openssl
echo "#define HAVE_CRYPTO 1" >>include/config.h
echo 'LDLIBS_EXTRA+=-lcrypto' >>config.mak
echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.openssl/)' >>config.mak
echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.openssl/)' >>config.mak
    # libcap
echo "#define HAVE_CAP 1" >>include/config.h
echo 'LDLIBS_EXTRA+=-lcap' >>config.mak
echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.libcap/libcap/)' >>config.mak
echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.libcap/libcap/)' >>config.mak
    # libpcap
echo "#define HAVE_PCAP 1" >>include/config.h
echo 'LDLIBS_EXTRA+=-lpcap' >>config.mak
echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.libpcap/)' >>config.mak
echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.libpcap/)' >>config.mak
    # libnatpmp
echo "#define HAVE_LIBNATPMP 1" >>include/config.h
echo 'LDLIBS_EXTRA+=-lnatpmp' >>config.mak
echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.libnatpmp/)' >>config.mak
echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.libnatpmp/)' >>config.mak
    # miniupnp
echo "#define HAVE_LIBMINIUPNP 1" >>include/config.h
echo 'LDLIBS_EXTRA+=-lminiupnpc' >>config.mak
echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.miniupnp/miniupnpc/build/)' >>config.mak
echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.miniupnp/miniupnpc/build/)' >>config.mak

# Build and Install
mkdir -p ./build
DESTDIR=./build make -j32 install
