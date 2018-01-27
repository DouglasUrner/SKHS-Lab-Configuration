### CONFIGURATION ###
$configDir = 'U:\src\SKHS-Lab-Configuration\TargetMachines'

Configuration TargetMachine {
  param($nodename)

  Import-DscResource -Module cChoco

  node $nodename {

    cChocoInstaller installChoco {
        InstallDir = "c:\choco"
    }

    cChocoPackageInstaller git {
        Name = "git"
        AutoUpgrade = $True
        DependsOn = "[cChocoInstaller]installChoco"
    }
  }
}

# Generate the list of target machines

$Hosts = cat "$configDir\hostnames.txt" | FOREACH {
    $_ + '.skitsap.wednet.edu'
}

# Generate the compiled configurations for the machines in $Hosts
# The configurations will be stored in a folder called TargetMachine
# which will be created in the current directory.

TargetMachine –nodename $Hosts