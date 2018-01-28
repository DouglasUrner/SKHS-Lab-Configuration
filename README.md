# SKHS-Lab-Configuration
Scripts to manage CS/Game Development lab configuration (Currently running Windows 7).

Most packages come from [Chocolatey](https://chocolatey.org)

## Getting DSC working

Note: for reference - DSC is not used in any of the current scripts.

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

## Git & GitHub

## Unity

"C:\Program Piles\Unity\Editor\Unity.exe" -quit -batchmode -nographics -serial <key> -username "<username>" -password "<password>"
  
"C:\Program Files\Unity\Editor\Unity.exe" -quit -batchmode -nographics -username "<username>" -password "<password>" -returnlicense
