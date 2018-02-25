# SKHS-Lab-Configuration

Scripts to manage CS/Game Development lab configuration
(Currently running Windows 7).

Most packages come from [Chocolatey](https://chocolatey.org)

## Before Reimaging

1. Be sure to remove the Unity licences from all of the machines.

## After Reimaging

1. Update PowerShell - this may not be necessary, but one way that you know that you need to update is if you are seeing out of memory and/or stack overflow errors when running the configuration script.
1. Enable PowerShell script execution if necessary.
1. Enable PowerShell remote execution

   ```Enable-PSRemoting```
   
   or using the LANSchool ```Administer > Run Program on Student Machine``` option:
   
   ```powershell -Command "&{Enable-PSRemoting -force}"```
   
   after logging in as a user with administrative rights.
   
   If enabling remote execution fails, install the newest version of PowerShell
   from Microsoft.

1. On the master machine, run the PowerShell configuration script

   ```
   Configure-AllMachines
   ```

## Blender

## Git & GitHub

## IntelliJ IDEA

## Java SDK

## Rider

## Unity

To install a license key:

```
"C:\Program Files\Unity\Editor\Unity.exe" -quit -batchmode -nographics \
    -serial "<serial>" -username "<username>" -password "<password>"
```
To return a license key:
  
```
"C:\Program Files\Unity\Editor\Unity.exe" -quit -batchmode -nographics \
    -username "<username>" -password "<password>" -returnlicense
```
