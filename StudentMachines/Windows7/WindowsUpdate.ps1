Hide-WUUpdate -Confirm:$false  -Title Dell -MicrosoftUpdate
Hide-WUUpdate -Confirm:$false  -Title HP -MicrosoftUpdate
Hide-WUUpdate -Confirm:$false  -Title Intel -MicrosoftUpdate
Get-WUInstall –MicrosoftUpdate -AcceptAll -AutoReboot