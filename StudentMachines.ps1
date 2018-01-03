### CONFIGURATION ###
$intelliJVersion = '2017.2.5'
#####################

[DSCLocalConfigurationManager()]
configuration StudentMachineMeta
{
    Node $nodename
    {
        Settings
        {
            RebootNodeIfNeeded = $true
        }
    }
} 

Configuration StudentMachine {
  param($nodename)

  Import-DscResource -Module cChoco
  Import-DscResource -Module DSCR_Shortcut


  node $nodename {
    cChocoInstaller installChoco {
        InstallDir = "c:\choco"
    }
    cChocoPackageInstaller java {
        Name = "jdk8"
        AutoUpgrade = $True
        DependsOn = "[cChocoInstaller]installChoco"
    }
    cChocoPackageInstaller intellij {
        Name = "intellijidea-ultimate"
        Version = $intelliJVersion
        DependsOn = "[cChocoInstaller]installChoco"
    }
    cChocoPackageInstaller unity {
        Name = "unity"
        AutoUpgrade = $True
        DependsOn = "[cChocoInstaller]installChoco"
    }
    cChocoPackageInstaller unity-android {
        Name = "unity-android"
        AutoUpgrade = $True
        DependsOn = "[cChocoInstaller]installChoco"
    }
    cChocoPackageInstaller android-sdk {
    	Name = "android-sdk"
	    AutoUpgrade = $True
	    DependsOn = "[cChocoInstaller]installChoco"
	}
    cChocoPackageInstaller git {
        Name = "git"
        AutoUpgrade = $True
        DependsOn = "[cChocoInstaller]installChoco"
    }
    Package noSkype {
        Name = "skype"
        Path = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' # Doesn't actually matter since we're uninstalling. exe file I know will exist
        ProductId = "3B7E914A-93D5-4A29-92BB-AF8C3F66C431"
        Ensure = "Absent"
    }
    Package reallyNoSkype {
        Name = "Skype™ 7.3"
        Path = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' # Doesn't actually matter since we're uninstalling. exe file I know will exist
        ProductId = ""
        Ensure = "Absent"
    }
    Package rider {
        Name = "Jetbrains Rider 2017.3"
        ProductId = "" # Required to exist, but not to have a value.
        Path = "\\HS024715\Users\urner\Documents\Shared\rider-installer.exe"
    }
    get-content "desktop-remove.txt" | foreach {
        File ('removeFromDesktop' + $_) {
            DestinationPath = 'C:\Users\Public\Desktop\' + $_
            Ensure = 'Absent'
        }
    }
    get-content "removefromlanschoolfiles.txt" | foreach {
        File ('removeFromLSF' + $_) {
            DestinationPath = 'C:\LanSchool Files\' + $_
            Ensure = 'Absent'
        }
    }
    File 'removeCSformLSF' {
        DestinationPath = 'C:\LanSchool Files\CS'
        Type            = 'Directory'
        Ensure          = 'Absent'
        Force           = $true
    }
    cShortcut intellij{
        Path = 'C:\Users\Public\Desktop\IntelliJ IDEA.lnk'
        Target = 'C:\Program Files (x86)\JetBrains\IntelliJ IDEA ' + $intelliJVersion + '\bin\idea64.exe'
    }
    cShortcut intellijStart {
        Path = 'C:\ProgramData\Microsoft\Windows\Start Menu\IntelliJ IDEA.lnk'
        Target = 'C:\Program Files (x86)\JetBrains\IntelliJ IDEA ' + $intelliJVersion + '\bin\idea64.exe'
    }
    cShortcut unity {
        Path = 'C:\Users\Public\Desktop\Unity.lnk'
        Target = 'C:\Program Files\Unity\Editor\Unity.exe'
        WorkingDirectory = 'C:\Program Files\Unity\Editor'
    }
    cShortcut chrome {
        Path = 'C:\Users\Public\Desktop\Google Chrome.lnk'
        Target = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
        WorkingDirectory = "C:\Program Files (x86)\Google\Chrome\Application"
    }
    File csaIcon {
        DestinationPath = "C:\LabFiles\CSAicon.ico"
        SourcePath = "\\HS024715\Users\urner\Documents\Shared\AP_CSA_icon.ico"
    }
    File theme {
        DestinationPath = "C:\LabFiles\Lab.theme"
        SourcePath = "\\HS024715\Users\urner\Documents\Shared\Lab.theme"
    }
    File themeImg {
        DestinationPath = "C:\LabFiles\pattern.png"
        SourcePath = "\\HS024715\Users\urner\Documents\Shared\pattern.png"
    }
    Registry defualtTheme {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes"
        ValueName = "InstallTheme"
        ValueData = "C:\LabFiles\Lab.theme"
        Force = $true
    }
  }
}

$Hosts = Get-Content ".\hostnames.txt" | FOREACH {
    $_ + '.skitsap.wednet.edu'
}

#StudentMachineMeta -nodename $Hosts
StudentMachine –nodename $Hosts

#Set-DscLocalConfigurationManager -Path .\StudentMachineMeta
Start-DscConfiguration -Path .\StudentMachine -Wait -Force
