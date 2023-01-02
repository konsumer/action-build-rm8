This is an action/docker-container to build [rm8](https://github.com/konsumer/rm8) easier. It's basically just rust + libsdl2 + libudev for x86_64/arm32/arm64 cross-building.

## usage

### github action

> **TODO**: I haven't quite worked this out.

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
        name: Build M8 armv7
        uses: konsumer/action-build-rm8@v2
        with:
          arch: armv7

```

Possible values for `arch` are `armv7`, `aarch64`, and `x86_64`. It defaults to `x86_64`.

### docker

You can use it on a x86_64 or arm64 host to build linux x86_64/arm32/arm64.

```
# cross build based on cargo config, for current CPU on linux
docker run -it -v $(pwd):/src konsumer/rm8

# cross build based on cargo config, for armv7 linux
docker run -it -v $(pwd):/src konsumer/rm8 armv7

# cross build based on cargo config, for x86_64 linux
docker run -it -v $(pwd):/src konsumer/rm8 x86_64

# cross build based on cargo config, for arm64 linux
docker run -it -v $(pwd):/src konsumer/rm8 aarch64
```
