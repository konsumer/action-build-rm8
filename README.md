This is an action/docker-container to build [rm8]() easier. It's basically just rust + libsdl2 + libudev for x86_64/arm32/arm64.

## usage

### github action

Put this in a yml file in `.github/workflows/` in your repo:

```yml
name: ci

on:
  push:
    branches:
      - 'main'

jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      -
        name: Build M8
        uses: konsumer/action-build-rm8

```

## docker

You can use it on a x86_64 or arm64 host to build x86_64/arm32/arm64.

```
# build for linux for current CPU on linux
docker run -it -v $(pwd):/src konsumer/rm8 cargo build --release

# cross build for armv7 linux
docker run -it -v $(pwd):/src -e PKG_CONFIG_PATH="/usr/lib/armv7-unknown-linux-gnueabihf/pkgconfig" konsumer/rm8 cargo build --release --target=armv7-unknown-linux-gnueabihf

# cross build for x86_64 linux
docker run -it -v $(pwd):/src -e PKG_CONFIG_PATH="/usr/lib/x86_64-unknown-linux-gnueabihf/pkgconfig" konsumer/rm8 cargo build --release --target=x86_64-unknown-linux-gnu

# cross build for arm64 linux
docker run -it -v $(pwd):/src -e PKG_CONFIG_PATH="/usr/lib/aarch64-unknown-linux-gnueabihf/pkgconfig" konsumer/rm8 cargo build --release --target=aarch64-unknown-linux-gnu
```