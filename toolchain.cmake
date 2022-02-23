set(CMAKE_SYSTEM_NAME Windows)
set(TOOLCHAIN_PREFIX x86_64-w64-mingw32)

# cross compilers to use for C, C++ and Fortran
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
set(CMAKE_RC_COMPILER ${TOOLCHAIN_PREFIX}-windres)

# target environment on the build host system
set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX})

# Only build static executables
set(CMAKE_C_FLAGS_INIT "-static")
set(CMAKE_CXX_FLAGS_INIT "-static")

# Standard CMake variables
set(CMAKE_INSTALL_PREFIX /usr/${TOOLCHAIN_PREFIX} CACHE PATH "install path")
set(BUILD_SHARED OFF CACHE PATH "Always build static")
set(BUILD_STATIC ON CACHE PATH "Always build static")
set(BUILD_SHARED_LIBS OFF CACHE PATH "Always build static")
set(BUILD_STATIC_LIBS ON CACHE PATH "Always build static")


# modify default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

add_definitions("-DWIN32")
add_definitions("-DMINGW")
set(WIN32 TRUE)
set(MINGW TRUE)

set(PKG_CONFIG_EXECUTABLE "/usr/bin/x86_64-w64-mingw32-pkg-config")

