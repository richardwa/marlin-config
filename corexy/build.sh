#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pwd=`pwd`
mkdir -p $DIR/../target
cd $DIR/../target

MARLIN_VERSION=2.0.6.1
if [ ! -f "$MARLIN_VERSION.zip" ]; then
  wget https://github.com/MarlinFirmware/Marlin/archive/$MARLIN_VERSION.zip
  unzip -o $MARLIN_VERSION.zip
fi

cd Marlin-$MARLIN_VERSION
cp -r -p $DIR/Marlin/* Marlin
pio run -e LPC1768
cp .pio/build/LPC1768/firmware.bin $DIR
cd $pwd
