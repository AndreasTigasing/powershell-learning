<#
Write a quick PowerShell script which,
-> Read multiple server names from a text file
-> Ask the user to specify which log they want to scan- like Application, System etc
-> Upon providing input, ask for event ID which they are looking for
Once this information is provided, Script should scan all the computers event logs for provided eventID and generate a nicely formatted CSV report whose headers should be:
 "MachineName","TimeGenerated","Source","Message"
#>

$ComputerList = Get-Content -Path "C:\powershell\Intermediate\Computers.txt"

ForEach ($computer in $ComputerList) {
    
}