# docker-container for cross-building M8

FROM rust:latest

RUN dpkg --add-architecture amd64 && \
  dpkg --add-architecture armhf && \
  dpkg --add-architecture arm64 && \
  apt-get update && \
  apt-get install -y --no-install-recommends libsdl2-dev:amd64 libudev-dev:amd64 libudev-dev:armhf libsdl2-dev:armhf libudev-dev:arm64 libsdl2-dev:arm64 crossbuild-essential-amd64 crossbuild-essential-arm64 crossbuild-essential-armhf zip && \
  rustup target add aarch64-unknown-linux-gnu && \
  rustup target add armv7-unknown-linux-gnueabihf && \
  rustup target add x86_64-unknown-linux-gnu

WORKDIR /src

COPY entrypoint.sh /usr/local/entrypoint.sh
RUN chmod 755 /usr/local/entrypoint.sh

ENTRYPOINT ["/usr/local/entrypoint.sh"]
CMD ["x86_64"]
