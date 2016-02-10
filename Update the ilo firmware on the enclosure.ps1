# Author : Ganesh Sekarbabu
# Site - https://techbrainblog.com/
# Purpose: To update the ilo firmware of the blades running in HP Enclosure
# Download the HP CMDLTS from the " http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=5440657#!tab=features "
# By using this HP CMDLTS we can  Configure and manege insight Lights Out (iLO), HP BIOS and Onboard Administrator (OA)
# To run this script pls check the avilabilty of updaete-HPOAilo
# Reference - http://techbrainblog.com/2015/12/27/powershell-to-find-the-firmware-version-of-the-hp-enclosure-onboard-administrator-and-its-related-components-part-1/
# Provide the ftp path which contains the firmware bin
# Seelct the Bay number or use ALL to update all the Bay's


$OA =  Read-host " Enter the HP OA IP "
$Bay = Read-host " Enter the Bay number(s) where the iLO firmware is to be updated \ Values can be specified as All "


$c = Connect-HPOA $OA

$url = Read-Host " Enter the FTP path of the firmware (ftp://IP-ADD/*.bin) "

Update-HPOAiLO -Connection $c -Bay $Bay -url $url

Disconnect-HPOA $c

