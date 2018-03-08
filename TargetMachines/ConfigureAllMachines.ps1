$LabConfigDir = "U:\Source\Admin\SKHS-Lab-Configuration"
# Session setup
$Hostnames = cat $LabConfigDir\TargetMachines\hostnames.txt | foreach { $_ + '.skitsap.wednet.edu' }
$Sessions = New-PSSession $Hostnames

# Copy packages.config
invoke-command -Session $Sessions -ScriptBlock { mkdir C:\"Lab Files" }
    echo "Created Lab Files folder."
    foreach ($session in $sessions) {
    cp $LabConfigDir\TargetMachines\packages.config C:\"Lab Files" -ToSession $Session
    echo "Copied packages.config"
    if(-not (invoke-command -session $session -scriptblock { Test-Path "C:\Lab Files\MIT_App_Inventor_Tools_2.3.0_win_setup.exe" })) {
        cp $LabConfigDir\TargetMachines\MIT_App_Inventor_Tools_2.3.0_win_setup.exe C:\"Lab Files" -ToSession $Session
        echo "Copied AI Tools"
    } else {
        echo "AI tools already exist."
    }
}

# Run the script
invoke-command -Session $Sessions -FilePath $LabConfigDir\TargetMachines\TargetScript.ps1 | foreach { echo ($_.PSComputerName+': '+$_) }