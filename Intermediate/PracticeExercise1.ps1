<#
Write a PowerShell script to read the computer names from a text file Then,

Stop a given service (say Print Spooler service ) and wait for 30 seconds after logging the status into a dedicated log file.
Ensure no child process is alive so that graceful stop of service can be confirmed
If there is any child process, kill it forcefully and log the information into the log file
After waiting for 30 seconds, start the service
Check for the service status, log into the log file and come out.
Next level,  You can see the above process might take around 2 minutes of time for gracefully restarting a service on 1 server.  using a single thread, It is not a good solution if we have to gracefully restart 5 services on 1000 machines(ETA: 10,000 minutes).
So, Use multithreading to improvise the solution. (hint: Invoke-Command or Start-Job might help you here)
#>

$ServiceName = 'Print Spooler'
$LogFile = "C:\powershell\Intermediate\logs.txt"
New-Item $LogFile -type file -Force
Start-Transcript -path $LogFile -append -Force


$ComputerList = Get-Content -Path "C:\powershell\Intermediate\Computers.txt"

ForEach ($computer in $ComputerList) {
    $GetService = Get-Service -ComputerName $computer -DisplayName $ServiceName
    Write-Host 'Started to stop Service' $ServiceName 'in a device:' $computer
    Get-Service -ComputerName $computer -DisplayName $ServiceName | Stop-Service
    Start-Sleep 1
    Get-Service -ComputerName $computer -DisplayName $ServiceName | Select-Object -Property DisplayName, Status, StartType
    Start-Sleep 1
    Write-Host 'Service' $ServiceName 'has been stopped in a device:' $computer
    Start-Sleep 1
    if ($GetService.Status -eq "Stopped") {
        
    }
}

Stop-Transcript
