# Rocky Linux 9 VM Setup

## Description
This project automates the provisioning of a Rocky Linux 9 virtual machine using KVM, Libvirt, and Kickstart.

The setup consists of two main files:
* rocky.sh: A Bash script that checks for resources and executes the virtualization command.
* rocky9.ks: A Kickstart file that handles the unattended installation, creates the user 'zigzag', and applies security hardening by disabling root login and password authentication.

## Dependencies

### Fedora

- 1 Run the following command to install the mandatory and default packages in the virtualization group:
```bash
sudo dnf install @virtualization
```
Alternatively, to install the mandatory, default, and optional packages, run:
```bash
sudo dnf group install --with-optional virtualization
```
2 - After the packages install, start the `libvirtd` service:
```bash
sudo systemctl start libvirtd
```
To start the service on boot, run:
```bash
sudo systemctl enable libvirtd
```
3 - To verify that the KVM kernel modules are properly loaded:
```bash
lsmod | grep kvm
kvm_amd               114688  0
kvm                   831488  1 kvm_amd
```

## Resources

- [https://docs.fedoraproject.org/en-US/quick-docs/virtualization-getting-started/](https://docs.fedoraproject.org/en-US/quick-docs/virtualization-getting-started/)
