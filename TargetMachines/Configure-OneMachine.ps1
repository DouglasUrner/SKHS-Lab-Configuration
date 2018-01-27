[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
  [string]$computerName
)

### BEGIN CONFIGURATION ###
$configDir = 'U:\src\SKHS-Lab-Configuration'
#### END CONFIGURATION ####

& $configDir\TargetMachines\BuildConfig.ps1

Start-DscConfiguration -Path "TargetMachine" -Wait -Force -Verbose -ComputerName $computerName
