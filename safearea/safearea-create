#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-use-dm-crypt-to-create-an-encrypted-volume-on-an-ubuntu-vps
# http://askubuntu.com/questions/63594/mount-encrypted-volumes-from-command-line
#sudo apt-get install libpam-mount

function fail() {
    local status=$?
    echo -e "\n\nPROCEDUE FAILED\n\n"
    exit $status;
}

SCRIPT=$(basename $0)
if [ "$#" != "1" ]; then
  echo -e "\nUsage:\t$SCRIPT 50G\n\n"
  exit 1
fi

SIZE=$1
SUPPORT_FILE="/root/$USER-safe.partition"
DEVICE_NAME="$USER-safe"
MAPPED_DEVICE=/dev/mapper/$DEVICE_NAME

if [ -e $MAPPED_DEVICE ]; then
    echo -e "\n$MAPPED_DEVICE already exist\n"
    exit 1
fi

if sudo [ -e $SUPPORT_FILE ]; then
    echo -e "\n$SUPPORT_FILE already exist\n"
    exit 1
fi

# may be fallocate is better
echo -e "\ncreating support file $SUPPORT_FILE\n"
sudo truncate -s $SIZE $SUPPORT_FILE || fail

echo -e "\ncreating crypted partition inside $SUPPORT_FILE\n"
sudo cryptsetup -y luksFormat $SUPPORT_FILE || fail

echo -e "\nopening crypted partition with device name $DEVICE_NAME\n"
sudo cryptsetup luksOpen $SUPPORT_FILE $DEVICE_NAME || fail

echo -e "\nformatting crypted partition $DEVICE_NAME\n"
sudo mkfs.ext4 -j $MAPPED_DEVICE || fail

echo -e "\ngiving crypted partition the name: \"safe\"\n"
sudo e2label $MAPPED_DEVICE safe || fail

echo -e "\nmounting crypted partition: $DEVICE_NAME\n"
udisksctl mount --block-device $MAPPED_DEVICE || fail

echo -e "\ngiving ownership to $USER\n"
sudo chown $USER:$USER /media/$USER/safe || fail

