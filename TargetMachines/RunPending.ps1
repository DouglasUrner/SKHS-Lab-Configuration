$Hosts = Get-Content C:\Users\urner\Documents\Config\hostnames.txt | FOREACH {
    $_ + '.skitsap.wednet.edu'
}

Start-DscConfiguration -ComputerName $Hosts -UseExisting -Wait