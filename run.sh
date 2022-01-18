#!/bin/bash
DEVICE=$1

mkdir -p bin
monkeyc -d $DEVICE -f monkey.jungle -o bin/Menu2Sample.prg -y $HOME/Garmin/developer_key
cp bin/Menu2Sample.prg /tmp/GARMIN/APPS
monkeydo bin/Menu2Sample.prg $DEVICE
