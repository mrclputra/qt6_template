#!/bin/bash
set -e

BUILD_DIR="build"
: "${VCPKG_ROOT:?VCPKG_ROOT is not set}"
QT_PREFIX="C:/Qt/6.11.2/mingw_64"
MINGW_BIN="C:/Qt/Tools/mingw1310_64/bin"

cmake -B "$BUILD_DIR" -S . \
  -G Ninja \
  -DCMAKE_C_COMPILER="$MINGW_BIN/gcc.exe" \
  -DCMAKE_CXX_COMPILER="$MINGW_BIN/g++.exe" \
  -DCMAKE_BUILD_TYPE=Release \
  -DVCPKG_TARGET_TRIPLET=x64-mingw-dynamic \
  -DCMAKE_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" \
  -DCMAKE_PREFIX_PATH="$QT_PREFIX" \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

cmake --build "$BUILD_DIR"

PATH="$QT_PREFIX/bin:$MINGW_BIN:$VCPKG_ROOT/installed/x64-mingw-dynamic/bin:$PATH" \
  ./"$BUILD_DIR"/qt-test.exe
