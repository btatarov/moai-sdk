#!/usr/bin/env bash

echo "Setting up MoaiUtil path..."

UTIL_PATH=$(dirname "${BASH_SOURCE[0]}")
UTIL_PATH=$(cd $UTIL_PATH/../util; pwd)
export PATH=$PATH:$UTIL_PATH

echo "getting latest cmake"
pushd ~
wget --quiet http://www.cmake.org/files/v3.1/cmake-3.1.3-Darwin-x86_64.tar.gz
tar xf cmake-3.1.3-Darwin-x86_64.tar.gz
cd cmake-3.1.3-Darwin-x86_64/CMake.app/Contents/bin/
export PATH=$(pwd):$PATH
popd


pushd `dirname $0`
bash build-osx.sh
echo OSX Lib Build Successful
popd
