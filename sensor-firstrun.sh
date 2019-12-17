#!/bin/bash
#------------------------------------------------------------------------------#
# Copyright (C) 2019 Cisco
# Proprietary and Confidential
#
# First time setup utility for ONA.
#
# Added option for additional reconfigurations that will find new FS/UDPD 
# information on the fly. Usage: firstrun rerun
#
# By: Joe Buchanan (joebucha)
# Version: 0.1
# 12-11-2019
#------------------------------------------------------------------------------#

#Run this command first to stop the service
sudo service obsrvbl-ona stop

#Run these commands to delete stale files
sudo rm -rf /opt/obsrvbl-ona/logs/ipfix/
sudo mkdir /opt/obsrvbl-ona/logs/ipfix/
sudo chown obsrvbl_ona: /opt/obsrvbl-ona/logs/ipfix/
sudo rm -rf /opt/obsrvbl-ona/logs/pna/
sudo mkdir /opt/obsrvbl-ona/logs/pna/
sudo chown obsrvbl_ona: /opt/obsrvbl-ona/logs/pna/

# Create backup on config file
cp /opt/obsrvbl-ona/config.local /opt/obsrvbl-ona/config.local-BAK

# asks if changing the config.local
echo ""
echo -e "Are you configuring the ONA to work with your SWC portal? (y or n)"
echo ""
read answerPortal
echo ""

if [ "$answerPortal" = "y" ]; then
     echo ""
     echo -e "What is your SWC Portal Key?"
     echo ""
     read answerKey
     echo ""
     sed -i '/OBSRVBL_SERVICE_KEY/d' /opt/obsrvbl-ona/config.local  
     echo 'OBSRVBL_SERVICE_KEY="'$answerKey'"' >> /opt/obsrvbl-ona/config.local
 fi
 
# Start the service again.
sudo service obsrvbl-ona start

# EOF