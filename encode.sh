#! /bin/bash
#if USB-DISK update.bin
set -ex
pk1=5cc5
pk2=c604
pk3=4d19

zip update.zip update.sh
sed -i "s/\x50\x4B\x01\x02/c604/g" update.zip
sed -i "s/\x50\x4B\x05\x06/4d19/g" update.zip
sed -i "s/\x50\x4B\x03\x04/5cc5/g" update.zip
tar -zcf update.bin update.zip
sed -i "s/\x00\x00\x00\x00\x00\x00/zzcat/g" update.bin
rm update.zip
