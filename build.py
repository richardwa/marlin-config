import os
import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('config', default='kossel',
                    nargs='*', help='folder to build')
args = parser.parse_args()

DIR = os.path.dirname(os.path.realpath(__file__))

# os.system('git submodule add -b 2.0.x -f --name Marlin https://github.com/MarlinFirmware/Marlin.git Marlin')
os.system('git submodule foreach --recursive git clean -xfd')
os.system('git submodule foreach --recursive git reset --hard d6e767e36be5852a32526c08d9ade974b18f6546')
os.system(
    f'xcopy /E /Y  {os.path.join(DIR, args.config, "*")} {os.path.join(DIR, "Marlin")}')

pwd = os.getcwd()
os.chdir(os.path.join(DIR, "Marlin"))
# for Windows add pio to path: %USERPROFILE%\.platformio\penv\Scripts
os.system('pio run -e LPC1768')
os.chdir(pwd)
