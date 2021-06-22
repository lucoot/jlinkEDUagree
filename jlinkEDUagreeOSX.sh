#!/bin/bash
#Author: Lucas C. Jun 2021
#Description:
#Disables the J-Link EDU License Agreement Pop-Up.
#Updates the date inside the J-Link settings XML file.
#Installation
#Use cron or Launchd to run every day automatically at midnight or at login.

#For J-Link EDU
#Generate new date value
new="LicenseEDU_DontShowAgainToday=\"0x$(printf '%04x%02x%02x' $(date +%Y) $(date +%m) $(date +%d))\""
#Extract old date value from XML file
old=$(awk '{for(i=1;i<=NF;i++){if($i~/^LicenseEDU_DontShowAgainToday=/){print $i}}}' "$HOME/library/Application Support/segger/segger_reg_hkey_current_user.xml")
#Replace old value with the new value
sed -i.bu "s/$old/$new/g" "$HOME/library/Application Support/segger/segger_reg_hkey_current_user.xml"
#You have now already agreed to the license

#For J-Link Mini EDU
#Generate new date value
new="LicenseEDUMini_DontShowAgainToday=\"0x$(printf '%04x%02x%02x' $(date +%Y) $(date +%m) $(date +%d))\""
#Extract old date value from XML file
old=$(awk '{for(i=1;i<=NF;i++){if($i~/^LicenseEDUMini_DontShowAgainToday=/){print $i}}}' "$HOME/library/Application Support/segger/segger_reg_hkey_current_user.xml")
#Replace old value with the new value
sed -i.bu "s/$old/$new/g" "$HOME/library/Application Support/segger/segger_reg_hkey_current_user.xml"
#You have now already agreed to the license