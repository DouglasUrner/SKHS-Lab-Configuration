# SKHS-Lab-Configuration

Scripts to manage CS/Game Development lab configuration
(Currently running Windows 7).

Most packages come from [Chocolatey](https://chocolatey.org)

## Before Reimaging

1. Be sure to remove the Unity licences from all of the machines.

## After Reimaging

1. Enable PowerShell script execution
1. Enable PowerShell remote execution

   ```Enable-PSRemoting```
   
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
"C:\Program Piles\Unity\Editor\Unity.exe" -quit -batchmode -nographics \
    -serial <key> -username "<username>" -password "<password>"
```
To return a license key:
  
```
"C:\Program Files\Unity\Editor\Unity.exe" -quit -batchmode -nographics \
    -username "<username>" -password "<password>" -returnlicense
```
