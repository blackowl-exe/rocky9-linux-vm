#!/bin/bash

set -e

VM_NAME="Rocky-Server"
VM_ISO_PATH="/home/redowl/machines/iso/Rocky-9.6-x86_64-minimal.iso"
VM_RAM_SIZE="2048"
VM_CPU_CORES="2"
VM_DISK_SIZE="20"
VM_OS_VARIANT="rocky9"
VM_KS_FILENAME="rocky9.ks"
VM_KS_PATH="$(pwd)/$VM_KS_FILENAME"

echo "Start creating the $VM_NAME machine ..."

if [ ! -f "$VM_ISO_PATH" ]; then
    echo "Error: ISO file not found at $VM_ISO_PATH"
    exit 1
fi

if [ ! -f "$VM_KS_PATH" ]; then
    echo "Error: Kickstart file not found at $VM_KS_PATH"
    exit 1
fi

virt-install \
	--name "$VM_NAME" \
	--memory "$VM_RAM_SIZE" \
	--vcpus "$VM_CPU_CORES" \
	--disk size="$VM_DISK_SIZE",format="qcow2" \
	--location "$VM_ISO_PATH" \
	--os-variant "$VM_OS_VARIANT" \
	--initrd-inject "$VM_KS_PATH" \
	--extra-args "inst.ks=file:/$VM_KS_FILENAME console=tty0 console=ttyS0,115200n8" \
	--network network=default \
	--graphics none \
	--noautoconsole

echo "$VM_NAME installation started in background."
echo "To watch the installation progress, run this NOW:"
echo "virsh console $VM_NAME"
