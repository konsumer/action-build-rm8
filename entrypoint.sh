#!/bin/bash

targetArch="${1}"

options="--release"

if [ "${targetArch}" == "armv7" ];then
  export PKG_CONFIG_PATH="/usr/lib/armv7-unknown-linux-gnueabihf/pkgconfig"
  options="${options} --target=armv7-unknown-linux-gnueabihf"
fi

if [ "${targetArch}" == "aarch64" ];then
  export PKG_CONFIG_PATH="/usr/lib/aarch64-unknown-linux-gnueabihf/pkgconfig"
  options="${options} --target=aarch64-unknown-linux-gnu"
fi

if [ "${targetArch}" == "x86_64" ];then
  options="${options} --target=x86_64-unknown-linux-gnu"
fi


exec cargo build $options