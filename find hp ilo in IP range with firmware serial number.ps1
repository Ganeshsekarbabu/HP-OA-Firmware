# Author : Ganesh Sekarbabu
# Site - https://techbrainblog.com/
# Purpose: To find ilo in the subnet with the Serailnumber,firmware version,blademodel etc
# Download the HP CMDLTS from the " http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=5440657#!tab=features "
# The Find-HPiLO cmdlet lists valid iLOs in the subnet provided. You must provide the subnet in which the iLOs have to be searched.
# By default it searchs the default port in the iLOs. You can provide a port number by appending a port number (":#") to the IP range. The port number part is optional.
# To run this script pls check the avilabilty of Find-HPilo cmdlet
# Type ( get-help Find-hpilo -full ) for more expamples
# Reference - 




$IPRange = Read-host " Enter the IP Range of HPOA ( 10.10.10.1-255) "



Find-HPiLO $IPRange