#!/bin/bash
lsblk
sudo mkfs -t ext4 /dev/xvdb
sudo mkdir /mydata
sudo mount /dev/xvdb /mydata/

# Format the volume to the ext4 filesystem
# Create a new directory to mount the ext4 volume
# Mount the volume to the“mydata” directory using the following command