#!/bin/bash

#set the user to add for kvm and libvirt management
QEMU_USER=$1

# install KVM and additional virtualization packages on Ubuntu 22.04
sudo apt-get update && sudo apt-get install -y \
    qemu-kvm \
    virt-manager \
    libvirt-daemon-system \
    virtinst \
    libvirt-clients \
    bridge-utils

# start the Libvirt daemon.
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd

# add nonroot user to manage KVM
sudo usermod -aG kvm "$QEMU_USER"
sudo usermod -aG libvirt "$QEMU_USER"

