text

keyboard --xlayouts='us'
lang en_US.UTF-8

network  --bootproto=dhcp --device=link --activate

cdrom

rootpw --lock
user --name=zigzag --groups=wheel --iscrypted --password=$6$sLSbvi9gddZH9tFn$wnBCViZf1hYZs044tsKCsIYvcKJT.siThAr9qwuepNRkuiNYjk2WTyP9tUYN3HLh9NMXRmje1q6.j.ewyA9L1/
sshkey --username=zigzag "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF22HF3IkPFevzj7zRCjCPkYIzGHto6K8AapMEo7ln57 admin@redowl"

authselect select sssd
firstboot --enable
services --enabled="chronyd,sshd"

ignoredisk --only-use=vda
clearpart --all --initlabel
autopart

skipx

reboot

%packages
@^minimal-environment
kexec-tools
curl
wget
tar
vim
%end

%post
sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl reload sshd
%end
