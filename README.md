# MinGW Game Builder

This repo contains the sources for a docker container which can be used for building Windows games. It has a toolchain file for building with CMake found at ``/usr/x86_64-w64-mingw32/share/toolchain.cmake`` within the container.

## Example of use

The container can be downloaded with:

```
docker pull ghcr.io/sharkwouter/mingw-game-builder:latest
```

Within the container, a game can be build using:

```
cmake -DCMAKE_TOOLCHAIN_FILE=/usr/x86_64-w64-mingw32/share/toolchain.cmake .
make
```

## Libraries included

The following libraries are included:

- SDL2
- SDL2_mixer
- SDL2_image
- SDL2_ttf
- jsoncpp

