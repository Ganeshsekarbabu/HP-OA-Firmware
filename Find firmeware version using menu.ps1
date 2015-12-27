#Author : Ganesh Sekarbabu
#Site - https://techbrainblog.com/
#Purpose: To find the firmware version of the HP Enclosure Onboard Administrator and its releated components 
# Download the HP CMDLTS from the " http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=5440657#!tab=features "
# By using this HP CMDLTS we can  Configure and manege insight Lights Out (iLO), HP BIOS and Onboard Administrator (OA)
# To run this script pls check the avilabilty of Get-HPOAFWSummary cmdlet
# Fimeware components - OnboardAdministratorFirmwareInformation , EnclosureComponentFirmwareInformation , InterconnectFirmwareInformation , DeviceFirmwareInformation
#Reference - http://techbrainblog.com/2015/12/27/powershell-to-find-the-firmware-version-of-the-hp-enclosure-onboard-administrator-and-its-related-components-part-1/
# Provide the text file path which contains the HP OA IPs
# By selecting the options we can get the firmware components of particulat item.
# Output with the firmware details will be stored in the given path for each Enclosure

 
 
 
$OA = Get-Content  (Read-host " Enter the path for the Text file contains OA IPs " )

 Foreach ( $dd in $OA ) { 



$d = connect-HPOA $dd | Get-HPOAFWSummary 


do
{
cls
     Write-Host "================ $Title ================"
     
     Write-Host "1: Press '1' for the OnboardAdministratorFirmwareInformation."
     Write-Host "2: Press '2' for the EnclosureComponentFirmwareInformation."
     Write-Host "3: Press '3' for the InterconnectFirmwareInformation."
     Write-Host "4: Press '4' for the DeviceFirmwareInformation."
     Write-Host "Q: Press 'Q' to quit."
    
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                 cls
                  
                $output1 = Read-Host " Enter the out-put location for store the OnboardAdministratorFirmwareInformation [$dd]"
                
                $d | Select-Object -ExpandProperty OnboardAdministratorFirmwareInformation | Format-List > $output1

   
                }'2' {
                cls
                
                $output2 = Read-Host " Enter the out-put location for store the EnclosureComponentFirmwareInformation [$dd] "

                

               $d | Select-Object -ExpandProperty EnclosureComponentFirmwareInformation | Format-List -Property  Device,Name,Location,version | Out-File  $output2


                } '3' {
                cls

                $output3 = Read-Host " Enter the out-put location for store the InterconnectFirmwareInformation [$dd]"
                
                $d | Select-Object -ExpandProperty InterconnectFirmwareInformation | Format-List -Property Bay,DeviceModel,FirmwareVersion >  $output3

                 } '4' {
                cls

                $output4 = Read-Host " Enter the out-put location for store the DeviceFirmwareInformation [$dd]  "
                 
                 $d | Select-Object -ExpandProperty DeviceFirmwareInformation | Format-List -Property Bay,DeviceFWDetail > $output4

                 } 
                 'q' {
               
               Write-Host "End of the Search "
          }
     }
    
}
until ($input -eq 'q')
}