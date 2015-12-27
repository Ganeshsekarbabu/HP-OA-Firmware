#Author : Ganesh Sekarbabu
#Site - https://techbrainblog.com/
#Purpose: To find the firmware version of the HP Enclosure Onboard Administrator and its releated components 
# Download the HP CMDLTS from the " http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=5440657#!tab=features "
# By using this HP CMDLTS we can  Configure and manege insight Lights Out (iLO), HP BIOS and Onboard Administrator (OA)
# To run this script pls check the avilabilty of Get-HPOAFWSummary cmdlet
# Fimeware components - OnboardAdministratorFirmwareInformation , EnclosureComponentFirmwareInformation , InterconnectFirmwareInformation , DeviceFirmwareInformation
#Reference - http://techbrainblog.com/2015/12/27/powershell-to-find-the-firmware-version-of-the-hp-enclosure-onboard-administrator-and-its-related-components-part-1/
# Provide the text file path which contains the HP OA IPs
# Output with the firmware details will be stored in the format below so provide the exact folder path
#Output format ( ( "C:\Tmp\" + $dd + "_device_firmware.txt" ) - C:\Tmp = folder name with path ; + $dd + = It will show the current IP in the variable ; _device_firmware.txt = componentname of the firmware in text format
# Change the output of the file to the desired path C:\Tmp = folder name with path and leave the reset as it is in the below out-file function.



$OA = Get-Content  (Read-host " Enter the path for the Text file contains OA IPs " )

Foreach ( $dd in $OA ) { 

$d = connect-HPOA $dd | Get-HPOAFWSummary 


$d | Select-Object -ExpandProperty DeviceFirmwareInformation | Format-List -Property Bay,DeviceFWDetail | Out-File -encoding unicode ( "C:\tmp\" + $dd + "_device_firmware.txt" )

$d | Select-Object -ExpandProperty EnclosureComponentFirmwareInformation | Format-List -Property  Device,Name,Location,version | Out-File -encoding unicode ( "C:\tmp\" + $dd + "_EnclosureComponent_Firmware.txt" )

$d | Select-Object -ExpandProperty InterconnectFirmwareInformation | Format-List -Property Bay,DeviceModel,FirmwareVersion |  Out-File -encoding unicode ( "C:\tmp\" + $dd + "_Interconnect_Firmware.txt" )


$d | Select-Object -ExpandProperty OnboardAdministratorFirmwareInformation | Format-List | Out-File -encoding unicode ( "C:\tmp\" + $dd + "_OnboardAdministrator_Firmware.txt" )

} 

