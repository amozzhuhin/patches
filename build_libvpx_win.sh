set -e
FullExecPath=$PWD
pushd `dirname $0` > /dev/null
FullScriptPath=`pwd`
popd > /dev/null

pacman --noconfirm -Sy
pacman --noconfirm -S msys/make

./configure --prefix=$FullScriptPath/../local \
--target=$TARGET \
--disable-examples \
--disable-tools \
--disable-docs \
--enable-static-msvcrt \
--enable-vp8 \
--enable-vp9 \
--enable-webm-io

make -j8
make -j8 install