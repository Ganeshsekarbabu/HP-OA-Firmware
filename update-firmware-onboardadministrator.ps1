# Author : Ganesh Sekarbabu
# Site - https://techbrainblog.com/
# Purpose: To update the Onboard Administrator firmware.
# Download the HP CMDLTS from the " http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=5440657#!tab=features "
# To run this script pls check the avilabilty of Update-HPOAFirmware
# Reference - 
# Provide the ftp path which contains the firmware bin



$OA =  Read-host " Enter the HP OA IP "


$c = Connect-HPOA $OA

$url = Read-Host " Enter the FTP path of the firmware (ftp://IP-ADD/*.bin) "

Update-HPOAFirmware -Connection $c -Source URL -url $url

Disconnect-HPOA $c