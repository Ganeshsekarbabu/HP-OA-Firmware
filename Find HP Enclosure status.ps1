$OA = Get-content (Read-host " Enter the path of the TXT file contains HP OA IPs  ")

connect-HPOA $OA | Get-HPOAEnclosureStatus | Select-Object IP,EnclosureName,StatusMessage,OnboardAdministrator,PowerSubsystem,CoolingSubsystem