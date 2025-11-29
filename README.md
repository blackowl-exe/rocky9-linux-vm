# Rocky Linux 9 VM Setup

## Description
This project automates the provisioning of a Rocky Linux 9 virtual machine using KVM, Libvirt, and Kickstart.

The setup consists of two main files:
* rocky.sh: A Bash script that checks for resources and executes the virtualization command.
* rocky9.ks: A Kickstart file that handles the unattended installation, creates the user 'zigzag', and applies security hardening by disabling root login and password authentication.

## Dependencies

### Fedora (Host OS)
To run this project on Fedora, you need to install the virtualization group and specific tools:

```bash
sudo dnf groupinstall "Virtualization Headless"
sudo dnf install virt-install
```

Ensure the libvirt service is started and enabled:

```bash
sudo systemctl enable --now libvirtd
```

### Other Distributions

**Debian / Ubuntu:**
```bash
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst
```

**Arch Linux:**
```bash
sudo pacman -S qemu libvirt virt-install
```
