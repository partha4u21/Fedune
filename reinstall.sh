#!/bin/bash
#Author : Partha Murmu
#Email : partha4u21@gmail.com
#Script : Fedune
#Version : 0.1

echo "========== Reinstall SCRIPT : FEDORA ==============="
echo "Hi $USER"
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo "$(date)"
echo "unzipping neceassary files..."

BASEDIR=$(dirname $0)

if tar -xzf $BASEDIR/core.tar.gz;

then 
   echo "Successfully extracted required files"
else 
   echo "Couldnt extract required files "
fi


echo " ============== Copying Repo Files ==========="
if cp -n -r ./repo/* /etc/yum.repos.d;
then 
   echo " Added new repo files"
else
  echo " Failed to add repo files :/"
fi  

echo " =========== Gnome Shell Extensions =========="
if cp -n -r ./gnome-shell-extensions/* /home/$USER/.local/share/gnome-shell/extensions/;
then 
  echo " Added gnome shell extensions"
else 
  echo " Failed to add gnome shell extensions"
fi

echo " ========== Copying theme file ==============="
if cp -n -r ./themes/* /home/$USER/.themes/;
then 
  echo " Added theme files"
else 
  echo " Failed to add theme files"
fi

echo " ============ Installing Softwares ==========="
yum -y --nogpgcheck install yum-fastestmirror
yum -y --nogpgcheck install pysdm vlc gnome-tweak-tool fedy audacity-freeworld flash-plugin google-chrome-stable axel youtube-dl azureus samba-client.x86_64 samba-common.x86_64 samba.x86_64 system-config-samba.noarch paman tlp
	
echo " Successfully installed and updated softwares "


check_process() {
  [ "$1" = "" ]  && return 0
  [ `pgrep -f $1` ] && return 1 || return 0
}

if check_process "gnome-tweak-tool"
then echo " Launching Gnome tweak tool" 
gnome-tweak-tool &> /dev/null
fi
echo " Script completed successfully "
