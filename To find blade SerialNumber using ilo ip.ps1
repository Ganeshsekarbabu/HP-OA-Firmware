#Author = Ganesh Sekarbabu
#Purpose = To get the Serail Number of the HP Blades
# Download and Install the HP Scripting Tools " http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=5440657#!tab=features "
# HPiLOCmdlets-x64 is requried to run this script
# To run this script pls check the avilabilty of Find-HPiLO cmdlet
#Reference - http://techbrainblog.com/2016/01/04/powershell-script-to-get-the-specified-direct-attached-blade-device-serial-number/

$HPilo = Get-Content ( read-host " Enter the path for the TXT file with ILO IPs " )

$HPilo | foreach { (Find-HPiLO $_) } | Select-Object IP,PN,SerialNumber |

Export-Csv  (read-host " Enter the path to save the result " )

