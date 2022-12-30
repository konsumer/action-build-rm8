This is an action/docker-container to build [rm8]() easier. It's basically just rust + libsdl2 + libudev.

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