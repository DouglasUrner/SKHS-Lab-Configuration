# Session setup
$Hostnames = cat U:\Source\SKHS-Lab-Configuration\TargetMachines\hostnames.txt | foreach { $_ + '.skitsap.wednet.edu' }
$Hostnames = 'HS022382.skitsap.wednet.edu'
$Sessions = New-PSSession $Hostnames

# Copy packages.config
invoke-command -Session $Sessions -ScriptBlock { mkdir C:\"Lab Files" }
echo "Created Lab Files folder."
cp U:\Source\SKHS-Lab-Configuration\TargetMachines\packages.config C:\"Lab Files" -ToSession $Sessions
echo "Copied packages.config."

# Run the script
invoke-command -Session $Sessions -FilePath U:\Source\SKHS-Lab-Configuration\TargetMachines\TargetScript.ps1 | foreach { echo ($_.PSComputerName+': '+$_) }