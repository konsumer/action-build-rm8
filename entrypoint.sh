#!/bin/bash

targetArch="${1}"
filename="${2:=src/main.rs}"
arch=$(uname -m)

echo "Running on ${arch}, targeting ${targetArch}"

options="--release"

if [ "${targetArch}" == "armv7" ];then
  if [ "$arch" != 'armv7' ]; then
    export PKG_CONFIG_ALLOW_CROSS="true"
    export PKG_CONFIG_PATH="/usr/lib/armv7-unknown-linux-gnueabihf/pkgconfig"
  fi
  options="${options} -C --config target.armv7-unknown-linux-gnueabihf.linker=armv7-linux-gnueabihf-gcc --target=armv7-unknown-linux-gnueabihf"
fi

if [ "${targetArch}" == "aarch64" ];then
  if [ "$arch" != 'aarch64' ]; then
    export PKG_CONFIG_ALLOW_CROSS="true"
    export PKG_CONFIG_PATH="/usr/lib/aarch64-unknown-linux-gnueabihf/pkgconfig"
  fi
  options="${options} --config target.aarch64-unknown-linux-gnu.linker=aarch64-linux-gnu-gcc --target=aarch64-unknown-linux-gnu"
fi

if [ "${targetArch}" == "x86_64" ];then
  if [ "$arch" != 'x86_64' ]; then
    export PKG_CONFIG_ALLOW_CROSS="true"
    export PKG_CONFIG_PATH="/usr/lib/x86_64-unknown-linux-gnu/pkgconfig"
  fi
  options="${options} --config target.x86_64-unknown-linux-gnu.linker=x86_64-linux-gnu-gcc --target=x86_64-unknown-linux-gnu"
fi

exec cargo build $options "${filename}"