# Author : Ganesh Sekarbabu
# Site - https://techbrainblog.com/
# Purpose: To find valid ilo's in the subnet with the Serailnumber,firmware version,blademodel etc
# Download the HP CMDLTS from the " http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=5440657#!tab=features "
# The Find-HPiLO cmdlet lists valid iLOs in the subnet provided. You must provide the subnet in which the iLOs have to be searched.
# By default it searchs the default port in the iLOs. You can provide a port number by appending a port number (":#") to the IP range. The port number part is optional.
# To run this script pls check the avilabilty of Find-HPilo cmdlet
# Type ( get-help Find-hpilo -full ) for more expamples
# Reference - http://techbrainblog.com/2016/01/07/powershell-script-to-find-the-valid-ilos-in-the-subnet-and-also-its-firmware-version/




$IPRange = Read-host " Enter the IP Range of HPOA ( 10.10.10.1-255) "



Find-HPiLO $IPRange