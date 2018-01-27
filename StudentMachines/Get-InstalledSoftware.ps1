[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
  [string]$computerName
)

Invoke-Command -ComputerName $computerName -ScriptBlock { Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate } | Out-GridView