#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo mount /dev/sdc1 /media/sdcard
sudo cp -r $DIR/firmware.bin /media/sdcard
sudo umount /dev/sdc1

