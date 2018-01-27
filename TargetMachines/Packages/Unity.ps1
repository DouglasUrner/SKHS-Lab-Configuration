[DSCLocalConfigurationManager()]

Configration Unity {
    #param($nodename)
    node = 'localhost'
    
    Import-DscResource -Module cChoco
    Improt-DscResource -Module DSCR_Shortcut
    
    node $nodename {
    
        cChocoInstaller installChoco {
            InstallDir = "C:\choco"
        }
        
        cChocoPackageInstaller unity {
            Name = "unity"
            AutoUpgrade = $True
            DependsOn = "[cChocoInstaller]installChoco"
        }
    }
}