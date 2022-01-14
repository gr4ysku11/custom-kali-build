#!/bin/bash

apt update
apt install -y git live-build simple-cdd cdebootstrap curl

git clone https://gitlab.com/kalilinux/build-scripts/live-build-config.git

cd live-build-config

# add packages
cat > kali-config/variant-kde/package-lists << EOF
code-oss
chromium
firefox-esr
virtualenv
bloodhound
seclists
curl
enum4linux
feroxbuster
impacket-scripts
nbtscan
nikto
nmap
onesixtyone
oscanner
redis-tools
smbclient
smbmap
snmp
sslscan
sipvicious
tnscmd10g
whatweb
wkhtmltopdf
git
EOF

# create hook for python 2/3 virtual environments
cat > kali-config/common/hooks/live/kali-gr4ysku11.chroot << EOF
#!/bin/bash

# setup python3 virtualenv
virtualenv -p $(which python3) /pyenv/python3
. /pyenv/python3/bin/activate
pip install impacket
pip install sshuttle

# install autorecon
pip install git+https://github.com/Tib3rius/AutoRecon.git
deactivate

# setup python2 virtualenv
virtualenv -p $(which python2) /pyenv/python2
. /pyenv/python2/bin/activate
pip install impacket
deactivate
EOF

chmod +x kali-config/common/hooks/live/kali-gr4ysku11.chroot

# disable zsh configuration
# is there a better way to do this (LIVE_BUILD_CMD_LINE)?
sed -i 's/configure_zsh$/#configure_zsh/' kali-config/common/includes.chroot/usr/lib/live/config/0031-kali-user-setup

./build.sh --variant kde --verbose
