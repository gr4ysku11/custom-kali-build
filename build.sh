#!/bin/bash

apt update
apt install -y git live-build simple-cdd cdebootstrap curl

git clone https://gitlab.com/kalilinux/build-scripts/live-build-config.git

cd live-build-config

# add packages
cat >> kali-config/variant-kde/package-lists/kali.list.chroot << EOF
extrepo
git
keepassxc
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
EOF

# copy favorites/task manager config
mkdir -p kali-config/common/includes.chroot/usr/share/gr4ysku11
cp ../kali-gr4ysku11-custom/plasma-org.kde.plasma.desktop-appletsrc kali-config/common/includes.chroot/usr/share/gr4ysku11

# not needed?
#chown kali:kali kali-config/common/includes.chroot/usr/share/gr4ysku11/plasma-org.kde.plasma.desktop-appletsrc

# create post-install script and include it in chroot
cat > kali-config/common/includes.chroot/usr/share/gr4ysku11/post-install.sh << EOF
#!/bin/bash

# run this script as kali user, after live boot

# install vscode extensions
codium --install-extension vscodevim.vim
codium --install-extension ms-python.python

# copy config file for favorites and task manager
cp plasma-org.kde.plasma.desktop-appletsrc ~/.config/

# logout to reload plasma workspace
qdbus org.kde.ksmserver /KSMServer logout 0 3 3
EOF

# create hook for python 2/3 virtual environments
cat > kali-config/common/hooks/live/gr4ysku11.chroot << EOF
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

# code-oss currently has a bug that won't allow installing extensions from command line
# install vscodium instead
extrepo enable vscodium
apt update
apt install -y codium
EOF
chmod +x kali-config/common/hooks/live/gr4ysku11.chroot

# set ownership for post-install script, after 'kali' user creation
cat > kali-config/common/includes.chroot/usr/lib/live/config/9990-gr4ysku11 << EOF
chmod +x /usr/share/gr4ysku11/post-install.sh
chown kali:kali /usr/share/gr4ysku11/post-install.sh
EOF
chmod +x kali-config/common/includes.chroot/usr/lib/live/config/9990-gr4ysku11

# disable zsh configuration
# is there a better way to do this (LIVE_BUILD_CMD_LINE)?
sed -i 's/configure_zsh$/#configure_zsh/' kali-config/common/includes.chroot/usr/lib/live/config/0031-kali-user-setup

./build.sh --variant kde --verbose

