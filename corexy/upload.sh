#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
scp $DIR/firmware.bin pi@octopi:~
ssh -T pi@octopi <<EOF
  mount /media/card
  cp ~/firmware.bin /media/card/
  umount /media/card
EOF

# restart board
# gcode_command=M997
# octoprint_key=E01B67DAC70E45FB87F33CE3CC0CF803
# curl -d "{\"command\":\"${gcode_command}\"}" \
#   -H 'Content-type: application/json' \
#   -H "X-Api-Key: ${octoprint_key}" \
#   -s "http://octopi.a.net/api/printer/command"

