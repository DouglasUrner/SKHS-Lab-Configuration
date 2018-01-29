if (-Not (Get-Command 'choco' -errorAction SilentlyContinue)) # If !(chocolatey exists)
{
    # Install chocolatey
    echo "starting to install choco"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    echo "successfully installed choco"
} else {
    echo "already has choco"
}

echo "starting to install packages"
choco install "C:\Lab Files\packages.config" -y
echo "finished installing packages"

echo "done"