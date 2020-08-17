#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pwd=`pwd`
cd ../Marlin

git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard d6e767e36be5852a32526c08d9ade974b18f6546

cp -r -p $DIR/Marlin/* Marlin
pio run -e LPC1768
cd $pwd
