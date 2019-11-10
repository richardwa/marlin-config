#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
config=$1

git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard 4db68d704f560d8450bfb4d1ee3127b34623c319

cp -r -p $config/* $DIR/Marlin
cp -p $DIR/platformio.ini $DIR/Marlin

pwd=`pwd`
cd $DIR/Marlin
pio run -e LPC1768
cd $pwd
