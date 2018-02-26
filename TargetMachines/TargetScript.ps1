if (-Not (Get-Command 'choco' -errorAction SilentlyContinue)) # If !(chocolatey exists)
{
    # Install chocolatey
    echo "starting to install choco"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    echo "successfully installed choco"
} else {
    echo "already has choco"
}

& "C:\Lab Files\MIT_App_Inventor_Tools_2.3.0_win_setup.exe" /S
echo "Started AppInventor Installer"

echo "starting to install packages"
choco install "C:\Lab Files\packages.config" -y --no-progress
echo "finished installing packages"

$WshShell = New-Object -ComObject WScript.Shell
$AIShortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\MIT App Inventor Tools\aiStarter.lnk")
$AIShortcut.TargetPath = 'C:\Program Files (x86)\AppInventor\aiStarter.exe'
$AIShortcut.Save()
echo "created AppInventor shortcut"

echo "done"