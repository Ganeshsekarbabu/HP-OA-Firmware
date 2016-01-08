##Author = Ganesh Sekarbabu
#Purpose = To get the ilo_firmware_version 
# Download and Install the HP Scripting Tools " http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=5440657#!tab=features "
# HPiLOCmdlets-x64 is requried to run this script.
# We need Find-HPilo and get-HPiLoFirmwareversion cmdlet to run this script.
# Reference


 $HPilo = Get-Content ( read-host " Enter the path for the TXT file with ILO IPs " )


Find-HPiLO $HPilo | Get-HPiLOFirmwareVersion  | 
 Select-Object IP,FIRMWARE_VERSION,FIRMWARE_DATE