<#
Practice Exercise 3:  Windows Process Related
Write PowerShell One-liners for:

1.) Get all windows processes whose name starts with letter "A"

2.) Get list of processes whose name is svchost and PM more than 100MB

3.) Get Process Name, Process ID and handleCount whose PM is more then 10MB and CPU more than 100s

4.) Export the results of (3) to html and CSV format
#>

Get-Process A*

Get-Process -name svchost | Where-Object {$_.PM -gt 100MB}

Get-Process | Where-Object {$_.PM -gt 10 -and $_.CPU -gt 100} | Select-Object -Property Name, Id, HandleCount

Get-Process | Where-Object {$_.PM -gt 10 -and $_.CPU -gt 100} | Select-Object -Property Name, Id, HandleCount | ConvertTo-Csv | Out-File -FilePath "C:\powershell\TstingPurpose\processes.csv" -Force
Get-Process | Where-Object {$_.PM -gt 10 -and $_.CPU -gt 100} | Select-Object -Property Name, Id, HandleCount | ConvertTo-HTML | Out-File -FilePath "C:\powershell\TstingPurpose\processes.html" -Force