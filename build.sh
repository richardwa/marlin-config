#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
config=$1

git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive

echo cp -r $config/* $DIR/Marlin
cp -r $config/* $DIR/Marlin
pwd=`pwd`
cd $DIR/Marlin
pio run -e `cat board.txt`
cd $pwd
