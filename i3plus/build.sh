#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pwd=`pwd`
cd ../target

VERSION=03
FILE=$VERSION.zip
FOLDER=i3PlusPlus-$VERSION
BOARD=mega2560

if [ ! -f "$FILE" ]; then
  wget https://github.com/Silverquark/i3PlusPlus/archive/$FILE
fi

# rm -rf i3PlusPlus-$VERSION # clean
unzip -o $FILE
cd $FOLDER
# cp -r -p $DIR/Marlin/* Marlin
cp $DIR/platformio.ini .
pio run -e $BOARD
cp .pio/build/$BOARD/firmware.bin $DIR
cd $pwd
