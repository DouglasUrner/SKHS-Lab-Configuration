Configuration IntelliJ
{
    param ($NodeName)

    Import-DscResource -Module cChoco

    Node $NodeName
    {
        cChocoInstaller installChoco {
            InstallDir = "C:\choco"
        }

        cChocoPackageInstaller intellij {
            Name = "intellijidea-ultimate"
            #AutoUpgrade = $True
            DependsOn = "[cChocoInstaller]installChoco"
        }
    }
 }

 Start-DscConfiguration -Path U:\src\SKHS-Lab-Configuration\StudentMachine -ComputerName "HS022371.skitsap.wednet.edu"