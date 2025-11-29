# Automated Rocky Linux 9 VM Setup

## Description
This project automates the provisioning of a Rocky Linux 9 virtual machine using KVM, Libvirt, and Kickstart.

The setup consists of two main files:
* rocky.sh: A Bash script that checks for resources and executes the virtualization command.
* rocky9.ks: A Kickstart file that handles the unattended installation, creates the user 'zigzag', and applies security hardening by disabling root login and password authentication.

## Dependencies

### Fedora (Host OS)
To run this project on Fedora, you need to install the virtualization group and specific tools:

sudo dnf groupinstall "Virtualization Headless"
sudo dnf install virt-install

Ensure the libvirt service is started and enabled:

sudo systemctl enable --now libvirtd

### Other Distributions

**Debian / Ubuntu:**
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst

**Arch Linux:**
sudo pacman -S qemu libvirt virt-install

## How to Use

1. Clone the repository:
   git clone <YOUR_REPO_URL>
   cd <YOUR_REPO_DIRECTORY>

2. Configuration:
   Open the 'rocky.sh' file and locate the 'VM_ISO_PATH' variable. You must change this path to point to the location of your Rocky Linux 9 ISO file on your local machine.

   Example:
   VM_ISO_PATH="/home/youruser/Downloads/Rocky-9.6-x86_64-minimal.iso"

3. Execution:
   Make the script executable and run it with sudo privileges:

   chmod +x rocky.sh
   sudo ./rocky.sh

4. Monitoring:
   The installation runs in the background. To view the progress, connect to the console:

   virsh console Rocky-Server

   To exit the console, press 'Ctrl + ]'.

## How to Upgrade

To update the scripts to the latest version from the repository:

git pull origin main

If you need to update the Virtual Machine itself after installation, log in to the VM and run:

sudo dnf update -y
