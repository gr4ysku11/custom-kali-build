# gr4ysku11's custom kali image build

### Installed packages
```bash
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
```
### Custom Hooks For
- python virtualenv's for both python 2 and 3
  - autorecon (python3)
  - impacket (python2/3)

virtual python environments are located in /pyenv/python\* directories
  
  ### Build
```bash
git clone https://gitlab.com/kalilinux/build-scripts/live-build-config.git
git clone https://github.com/gr4ysku11/custom-kali-build.git
cp -r custom-kali-build/* live-build-config
cd live-build-config
./build.sh --variant kde --verbose
```
