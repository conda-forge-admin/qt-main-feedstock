#!/bin/bash
set -ex

# test for presence of sql plugin
test -f $PREFIX/plugins/sqldrivers/libqsqlite${SHLIB_EXT}

ls
cd test
ln -s ${GXX} g++
cp ../xcrun .
cp ../xcodebuild .
export PATH=${PWD}:${PATH}
qmake hello.pro
make
./hello
# Only test that this builds
make clean

qmake test_qmimedatabase.pro
make
./test_qmimedatabase
make clean

# Manually inspect this file remove me when done
cat "${PREFIX}/lib/cmake/Qt5Gui/Qt5GuiConfigExtras.cmake"
