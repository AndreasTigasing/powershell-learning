<#
Practice Exercise 2:  Windows Service Related
Write PowerShell One-liners for:

1.) Get all services which are stopped

2.) Get all services whose name starts with letter "A"

3.) Get all services which are set to start automatically (look for property      StartType  : Automatic)

4.) Restart-Service Winmgmt

5.) Export the service name and status into a text file.

Example:

Service Name,  Status

Service A,   Running

Service B,    Stopped

6.) Export the service name, StartType, and status into an HTML file.

 #>

Get-Service | Where-Object {$_.Status -eq "Stopped"}

Get-Service "A*"

Get-Service | Where-Object {$_.StartType -eq "Automatic"} | Select-Object -property Name, Status, StartType

Restart-Service *Winmgmt*

Get-Service | Select-Object -Property Name, Status | Sort-Object -Property Status | Out-File -FilePath ".\services.txt" -force

Get-Service | Select-Object -Property Name, StartType, Status | Sort-Object -Property Name | ConvertTo-Html -Title "Services of AndreasPC" | Out-File -FilePath ".\Services.html" -force