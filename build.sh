#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
config=$1

git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard d6e767e36be5852a32526c08d9ade974b18f6546

cp -r -p $config/* $DIR/Marlin

pwd=`pwd`
cd $DIR/Marlin
pio run -e LPC1768
cd $pwd
