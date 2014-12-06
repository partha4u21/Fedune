#!/bin/bash
#Author : Partha Murmu
#Email : partha4u21@gmail.com
#Script : Fedune Backup
#Version : 0.1

echo "========== Reinstall SCRIPT : FEDORA ==============="
echo "Hi $USER"
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo "$(date)"
echo "Copying repo files to /etc/yum.repos.d/ "
cp -n -r ./repo/* /etc/yum.repos.d
yum -y --nogpgcheck update
echo "Copying gnome shell extensions"
cp -n -r gnome-shell-extensions/* ~/.local/share/gnome-shell/extensions
echo "Installing softwares...."
yum -y --nogpgcheck install pysdm vlc gnome-tweak-tool fedy google-chrome-stable yum-fastestmirror axel youtube-dl azureus samba-client.x86_64 samba-common.x86_64 samba.x86_64 system-config-samba.noarch paman tlp
