#!/usr/bin/env bash
#COMPILER AND PATH
PREFIX=/usr
C_COMPILER="gcc"
CXX_COMPILER="g++"

## BUILD ##
autoreconf -i
PKG_CONFIG_PATH=/opt/aria2/build_libs/lib/pkgconfig/ \
LD_LIBRARY_PATH=/opt/aria2/build_libs/lib/ \
CC="$C_COMPILER" \
CXX="$CXX_COMPILER" \
./configure \
    --prefix=$PREFIX \
    --enable-https \
    --enable-bittorrent \
    --enable-gzip \
    --enable-metalink \
    --enable-xmlrpc \
    && make -j4
