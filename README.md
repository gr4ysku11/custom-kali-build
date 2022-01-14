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
git clone https://github.com/gr4ysku11/kali-gr4ysku11-custom.git
./kali-gr4ysku11-custom/build.sh
```
