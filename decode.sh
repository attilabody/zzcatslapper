#! /bin/bash
#if USB-DISK update.bin
set -ex
INPUT=${1:-update.bin}
cp "${INPUT}" update.tmp
pk1=$(md5sum root/1.raw | cut -d "3" -f1)
pk2=$(md5sum root/crc.raw | cut -d "3" -f2)
pk3=$(md5sum root/20.raw | cut -d "8" -f3)
[ -f update.zip ] && rm update.zip
sed -i "s/zzcat/\x00\x00\x00\x00\x00\x00/g" update.tmp
tar -zxvf update.tmp
rm update.tmp
sed -i "s/${pk1}/\x50\x4B\x03\x04/g" update.zip
sed -i "s/${pk3}/\x50\x4B\x05\x06/g" update.zip
sed -i "s/${pk2}/\x50\x4B\x01\x02/g" update.zip
[ -f update.sh ] && rm update.sh
unzip update.zip
rm update.zip

