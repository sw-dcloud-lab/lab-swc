echo off
cd %userprofile%\Downloads
echo Search for hosts running common management protocols
echo FTP, SSH, Telnet, Web, SMB, Remote Desktop on tcp/22, 23, 80, 443, 3389
echo Using nmap the following commands will run
echo [press and key to run] nmap -n -v  -p 21,22,23,80,443,3389 10.201.0.0/24 198.19.20.0/24  --disable-arp-ping
pause 
nmap -n -v  -p 21,22,23,25,80,443,3389 10.201.0.0/24 198.19.20.0/24 --disable-arp-ping
pause
