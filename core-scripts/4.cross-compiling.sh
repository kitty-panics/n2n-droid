#!/usr/bin/env bash

#
# Compiling
#
# Docs:
# - https://developer.android.com/ndk/guides/other_build_systems
# - https://github.com/hamishcoleman/n3n/blob/main/doc/BuildConfig.md
# - https://github.com/ntop/n2n/issues/1110

# Set NDK Env
ENV_NDK_PATH="$(which env-droid-ndk)"
source "$ENV_NDK_PATH"

# Configure
mkdir -p ./n2n/build; cd ./n2n
./autogen.sh
./configure --host=$TARGET

## Configuration at Build time
#    # lib-zstd
##echo "#define HAVE_ZSTD 1" >>include/config.h
##echo 'LDLIBS_EXTRA+=-lzstd' >>config.mak
##echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.1.zstd/lib/)' >>config.mak
##echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.1.zstd/lib/)' >>config.mak
#    # lib-openssl
#echo "#define HAVE_OPENSSL 1" >>include/config.h
#echo 'LDLIBS_EXTRA+=-lcrypto -lssl' >>config.mak
#echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.2.openssl/)' >>config.mak
#echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.2.openssl/)' >>config.mak
#    # lib-cap
#echo "#define HAVE_CAP 1" >>include/config.h
#echo 'LDLIBS_EXTRA+=-lcap' >>config.mak
#echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.3.cap/libcap/)' >>config.mak
#echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.3.cap/libcap/)' >>config.mak
#    # lib-pcap
#echo "#define HAVE_PCAP 1" >>include/config.h
#echo 'LDLIBS_EXTRA+=-lpcap' >>config.mak
#echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.4.pcap/)' >>config.mak
#echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.4.pcap/)' >>config.mak
#    # lib-natpmp
#echo "#define HAVE_NATPMP 1" >>include/config.h
#echo 'LDLIBS_EXTRA+=-lnatpmp' >>config.mak
#echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.5.natpmp/)' >>config.mak
#echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.5.natpmp/)' >>config.mak
#    # lib-miniupnp
#echo "#define HAVE_MINIUPNP 1" >>include/config.h
#echo 'LDLIBS_EXTRA+=-lminiupnpc' >>config.mak
#echo 'CFLAGS+=-I$(realpath ../../thirdparty/build.6.miniupnp/miniupnpc/build/)' >>config.mak
#echo 'LDFLAGS+=-L$(realpath ../../thirdparty/build.6.miniupnp/miniupnpc/build/)' >>config.mak

# Build and Install
DESTDIR=./build make -j32 install
