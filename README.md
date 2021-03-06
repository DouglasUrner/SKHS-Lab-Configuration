# SKHS-Lab-Configuration

Scripts to manage CS/Game Development lab configuration
(Currently running Windows 10 - scripts and notes prior to December 2018 were run against Windows 7).

Most packages come from [Chocolatey](https://chocolatey.org)

## Before Reimaging

1. Be sure to remove the Unity licences from all of the machines.

## After Reimaging

1. Log in to all of the student machines as a user with administrative rights. With LANSchool this is '''Administer > Log on Selected Students...```
1. Update PowerShell using the 5.1 package. This has to be initiated on each machine in the lab by hand.
1. Enable PowerShell script execution if necessary.

```Set-ExecutionPolicy unrestricted```

1. Enable PowerShell remote execution

   ```Enable-PSRemoting```
   
   or using the LANSchool ```Administer > Run Program on Student Machine``` option:
   
   ```powershell -Command "&{Enable-PSRemoting -force}"```
   
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
