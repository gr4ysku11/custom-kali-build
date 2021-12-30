# gr4ysku11's custom kali image build

### Installed packages
```bash
code-oss
chromium
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
- python virtualenv
  - autorecon
  - impacket
- code-oss extensions
  - vsvim
  - python
  
  ### Build
```bash
./build.sh --variant kde --verbose
```
