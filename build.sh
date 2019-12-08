#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
config=$1

git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard 5103cdcff6a2d40c9d7eb5de2274fe23dbf56797

cp -r -p $config/* $DIR/Marlin

# to see diff with example delta
cp -r -p $config/Marlin/* $DIR/Marlin/config/examples/delta/Anycubic/Kossel

pwd=`pwd`
cd $DIR/Marlin
pio run -e LPC1768
cd $pwd
