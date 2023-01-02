#!/bin/bash

targetArch="${1}"
arch=$(uname -m)

echo "Running on ${arch}, targeting ${targetArch}"

if [ "${targetArch}" == "armv7" ];then
  if [ "$arch" != 'armv7' ]; then
    export PKG_CONFIG_ALLOW_CROSS="true"
    export PKG_CONFIG_PATH="/usr/lib/arm-linux-gnueabihf/pkgconfig/"
  fi
  GCC=arm-linux-gnueabihf-gcc
  RUST_TARGET=armv7-unknown-linux-gnueabihf
fi

if [ "${targetArch}" == "aarch64" ];then
  if [ "$arch" != 'aarch64' ]; then
    export PKG_CONFIG_ALLOW_CROSS="true"
    export PKG_CONFIG_PATH="/usr/lib/aarch64-linux-gnu/pkgconfig"
  fi
  GCC=aarch64-linux-gnu-gcc
  RUST_TARGET=aarch64-unknown-linux-gnu
fi

if [ "${targetArch}" == "x86_64" ];then
  if [ "$arch" != 'x86_64' ]; then
    export PKG_CONFIG_ALLOW_CROSS="true"
    export PKG_CONFIG_PATH="/usr/lib/x86_64-unknown-linux-gnu/pkgconfig"
  fi
  GCC=x86_64-linux-gnu-gcc
  RUST_TARGET=x86_64-unknown-linux-gnu
fi

exec cargo build --release --config "target.${RUST_TARGET}.linker"="\"${GCC}\"" --target="${RUST_TARGET}"