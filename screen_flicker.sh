#!/bin/bash


#A function to make things a little bit pretty, why not?
#Description: adds a short timer with a spinny graphic using |/-\|
function spin() {
   local -a marks=( '/' '-' '\' '|' )
   for i in `seq 1 15`; do
     printf '%s\r' "${marks[i++ % ${#marks[@]}]}"
     sleep 0.3
   done
 }

echo 'apt-get repositories will be updated.'
spin
sudo apt-get update -y

echo 'Did it work? If yes wait, else Ctrl+c'
spin
Reinstall everything to do with xorg!!!
sudo apt-get install --reinstall xserver-xorg-video-intel libgl1-mesa-glx libgl1-mesa-dri xserver-xorg-core
#reconfigure it!
sudo dpkg-reconfigure xserver-xorg
#IMPORTANT:
#might want to try unity --restart
#probably will break things and force a reboot. just reboot anyway.
echo 'Reconfiguration successful!  Would you like to reboot now? [Y/n]'
read isReboot
if [[ "$isReboot" == "Y" || "$isReboot" == "y" ]]; then
  echo 'Ready to go! I hope this works! If it persits '\
       'ensure that hardware acceleration is turned on in Google Chrome or '\
       'Chromium.  You can do this after your computer restarts.'
  spin
  echo 'See you soon!'
  sleep 1
  echo 'REBOOT'
  sudo reboot
else
  echo 'A reboot is required to finish fixing this problem.  If it persits '\
       'ensure that hardware acceleration is turned on in Google Chrome or '\
       'Chromium'
fi
