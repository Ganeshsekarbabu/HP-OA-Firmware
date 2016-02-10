#Author = Ganesh Sekarbabu
# Site - https://techbrainblog.com/
#Purpose = To update the HPilofirmware from the list of IPs
# Download and Install the HP Scripting Tools " http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=5440657#!tab=features "
# HPiLOCmdlets-x64 is requried to run this script
#Provide the IPs in the text file
# Download the firmware and provide the path of the firmware.

$HPilo = Get-Content ( read-host " Enter the path for the TXT file with ILO IPs " )

$Location =  read-host " Enter the location path of the firmware (.bin)  " 

update-HPiLOFirmware -Server $HPilo -Location $Location 