#!/bin/bash

targetArch="${1}"
arch=$(uname -i)

options="--release"

if [ "${targetArch}" == "armv7" ];then
  export PKG_CONFIG_ALLOW_CROSS="true"
  export PKG_CONFIG_PATH="/usr/lib/armv7-unknown-linux-gnueabihf/pkgconfig"
  options="${options} --target=armv7-unknown-linux-gnueabihf"
fi

if [ "${targetArch}" == "aarch64" ];then
  if [ "$arch" != 'aarch64' ]; then
    export PKG_CONFIG_ALLOW_CROSS="true"
    export PKG_CONFIG_PATH="/usr/lib/aarch64-unknown-linux-gnueabihf/pkgconfig"
  fi
  options="${options} --target=aarch64-unknown-linux-gnu"
fi

if [ "${targetArch}" == "x86_64" ];then
  if [ "$arch" != 'x86_64' ]; then
    export PKG_CONFIG_ALLOW_CROSS="true"
    export PKG_CONFIG_PATH="/usr/lib/x86_64-unknown-linux-gnu/pkgconfig"
  fi
  options="${options} --target=x86_64-unknown-linux-gnu"
fi


exec cargo build $options