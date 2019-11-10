#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
config=$1

git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard 75efa3cdacd8271ca360e7d1680f25f5be218da3
#git submodule update --init --recursive

cp -r -p $config/* $DIR/Marlin
cp -p $DIR/platformio.ini $DIR/Marlin
cp -p $DIR/upload.py $DIR/Marlin

pwd=`pwd`
cd $DIR/Marlin
pio run -e LPC1768
cd $pwd
