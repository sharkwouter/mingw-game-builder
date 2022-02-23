FROM ubuntu:latest

ENV DEBIAN_FRONTEND="noninteractive"

ENV JSONCPP_VERSION="1.9.5"
ENV SDL2_VERSION="2.0.20"
ENV SDL_MIXER_VERSION="2.0.4"
ENV SDL_IMAGE_VERSION="2.0.5"
ENV SDL_TTF_VERSION="2.0.18"

COPY toolchain.cmake /usr/x86_64-w64-mingw32/share/toolchain.cmake
WORKDIR /build

RUN apt-get update && \
  apt-get install -y --no-install-recommends cmake make pkgconf wget ca-certificates tar unzip gcc-mingw-w64-x86-64 g++-mingw-w64-x86-64 mingw-w64-tools binutils-mingw-w64-x86-64 mingw-w64-x86-64-dev && \
  apt-get -y clean autoclean autoremove && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

# Build and install jsoncpp
RUN wget https://github.com/open-source-parsers/jsoncpp/archive/refs/tags/${JSONCPP_VERSION}.tar.gz && \
  tar -xvf ${JSONCPP_VERSION}.tar.gz && \
  cd jsoncpp-${JSONCPP_VERSION} && \
  mkdir build && cd build && \
  cmake -DCMAKE_TOOLCHAIN_FILE=/usr/x86_64-w64-mingw32/share/toolchain.cmake -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF -DJSONCPP_WITH_TESTS=OFF .. && \
  make install && \
  cd ../.. && \
  rm -rfv jsoncpp-${JSONCPP_VERSION} ${JSONCPP_VERSION}.tar.gz

# Download and install SDL2
RUN wget https://www.libsdl.org/release/SDL2-devel-${SDL2_VERSION}-mingw.tar.gz && \
  tar -xvf SDL2-devel-${SDL2_VERSION}-mingw.tar.gz && \
  cp -rpv SDL2-${SDL2_VERSION}/x86_64-w64-mingw32 /usr/ && \
  rm -rfv SDL2-${SDL2_VERSION} SDL2-devel-${SDL2_VERSION}-mingw.tar.gz

# Download and install SDL_mixer
RUN wget https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-devel-${SDL_MIXER_VERSION}-mingw.tar.gz && \
  tar -xvf SDL2_mixer-devel-${SDL_MIXER_VERSION}-mingw.tar.gz && \
  cp -rpv SDL2_mixer-${SDL_MIXER_VERSION}/x86_64-w64-mingw32 /usr/ && \
  rm -rfv SDL2_mixer-${SDL_MIXER_VERSION} SDL2_mixer-devel-${SDL_MIXER_VERSION}-mingw.tar.gz

# Download and install SDL_image
RUN wget https://www.libsdl.org/projects/SDL_image/release/SDL2_image-devel-${SDL_IMAGE_VERSION}-mingw.tar.gz && \
  tar -xvf SDL2_image-devel-${SDL_IMAGE_VERSION}-mingw.tar.gz && \
  cp -rpv SDL2_image-${SDL_IMAGE_VERSION}/x86_64-w64-mingw32 /usr/ && \
  rm -rfv SDL2_image-${SDL_IMAGE_VERSION} SDL2_image-devel-${SDL_IMAGE_VERSION}-mingw.tar.gz

# Download and install SDL_ttf
RUN wget https://github.com/libsdl-org/SDL_ttf/releases/download/release-2.0.18/SDL2_ttf-devel-${SDL_TTF_VERSION}-mingw.tar.gz && \
  tar -xvf SDL2_ttf-devel-${SDL_TTF_VERSION}-mingw.tar.gz && \
  cp -rpv SDL2_ttf-${SDL_TTF_VERSION}/x86_64-w64-mingw32 /usr/ && \
  rm -rfv SDL2_ttf-${SDL_TTF_VERSION} SDL2_ttf-devel-${SDL_TTF_VERSION}-mingw.tar.gz
