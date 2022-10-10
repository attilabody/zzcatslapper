#! /bin/bash
#if USB-DISK update.bin
set -ex
INPUT=${1:-update.bin}
cp "${INPUT}" update.tmp
[ -f update.zip ] && rm update.zip
sed -i "s/zzcat/\x00\x00\x00\x00\x00\x00/g" update.tmp
tar -zxvf update.tmp
rm update.tmp
sed -i "s/5cc5/\x50\x4B\x03\x04/g" update.zip
sed -i "s/4d19/\x50\x4B\x05\x06/g" update.zip
sed -i "s/c604/\x50\x4B\x01\x02/g" update.zip
[ -f update.sh ] && rm update.sh
unzip update.zip
rm update.zip

