
$ServiceName = 'Print Spooler'

$GetService = Get-Service -ComputerName $computer -DisplayName $ServiceName

Get-Service -ComputerName AndreasPC -DisplayName $ServiceName | Select-Object -Property DisplayName, Status, StartType


if ($GetService.Status -eq "Stopped") {
    Write-Host 'Service is stopped'
}
