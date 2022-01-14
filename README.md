# gr4ysku11's custom kali image build

  ### Installation
```bash
git clone https://github.com/gr4ysku11/kali-gr4ysku11-custom.git
sudo ./kali-gr4ysku11-custom/build.sh
```

### Features
- pre installed packages that I most commonly use
- python virtual environments
- disable zsh in favor of good ol' bash

### Installed packages
```bash
# my commonly used packages
code-oss
git
keepassxc
chromium
firefox-esr
virtualenv
bloodhound

# autorecon packages
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
```

### Custom Hooks For
- python virtualenv's for both python 2 and 3
  - autorecon (python3)
  - sshuttle (python3)
  - impacket (python2/3)

virtual python environments are located in /pyenv/python\* directories

