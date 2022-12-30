# docker-container for cross-building M8

FROM rust:latest

RUN dpkg --add-architecture armhf && \
  dpkg --add-architecture arm64 && \
  apt-get update && \
  apt-get install -y libudev-dev libsdl2-dev libudev-dev:armhf libsdl2-dev:armhf libudev-dev:arm64 crossbuild-essential-arm64 crossbuild-essential-armhf cargo rustup zip && \
  rustup target add aarch64-unknown-linux-gnu && rustup target add armv7-unknown-linux-gnueabihf