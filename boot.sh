#!/bin/bash
# Reference: https://github.com/debian-pi/raspbian-ua-netinst/issues/314

ROOTFS="./rootfs"
mount -o loop rootfs.img $ROOTFS

echo "Mounting /proc in chroot... "
if [ ! -d ${ROOTFS}/proc ] ; then
    mkdir -p ${ROOTFS}/proc
    echo "Created ${ROOTFS}/proc"
fi
mount -t proc -o nosuid,noexec,nodev proc ${ROOTFS}/proc
echo "OK"

echo "Mounting /sys in chroot... "
if [ ! -d ${ROOTFS}/sys ] ; then
    mkdir -p ${ROOTFS}/sys
    echo "Created ${ROOTFS}/sys"
fi
mount -t sysfs -o nosuid,noexec,nodev sysfs ${ROOTFS}/sys
echo "OK"

echo "Mounting /dev/ and /dev/pts in chroot... "
mkdir -p -m 755 ${ROOTFS}/dev/pts
mount -t devtmpfs -o mode=0755,nosuid devtmpfs ${ROOTFS}/dev
mount -t devpts -o gid=5,mode=620 devpts ${ROOTFS}/dev/pts
echo "OK"

if [ ! -d ${ROOTFS}/var/log ] ; then
    mkdir -p ${ROOTFS}/var/log
    echo "Created /var/log in chroot."
fi
clear
chroot ${ROOTFS} /bin/bash -l
#chroot ${ROOTFS} /sbin/init

