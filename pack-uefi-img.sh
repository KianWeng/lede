#!/bin/sh
sudo modprobe nbd
sudo qemu-nbd -c /dev/nbd0 ./openwrt.vmdk
sudo fdisk -l /dev/nbd0
sudo mkdir -p /tmp/nbd0p1
sudo mkdir -p /tmp/nbd0p2
sudo mount /dev/nbd0p1 /tmp/nbd0p1
sudo mount /dev/nbd0p2 /tmp/nbd0p2
sudo rm /tmp/nbd0p1/vmlinuz
sudo cp ./bin/targets/x86/64/openwrt-x86-64-vmlinuz /tmp/nbd0p1/vmlinuz
sudo rm -rf /tmp/nbd0p2/*
sudo tar zxvf ./bin/targets/x86/64/openwrt-x86-64-generic-rootfs.tar.gz -C /tmp/nbd0p2/
sudo umount /dev/nbd0p1
sudo umount /dev/nbd0p2
sudo qemu-nbd -d /dev/nbd0
sudo rmmod nbd
