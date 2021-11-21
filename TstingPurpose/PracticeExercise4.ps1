<#
Simple interest calculation on any principal amount involves variables like Principle amount, Interest rate and tenure for which you are calculating SI

Simple interest can be calculated by using below formula

SI = P * R * T / 100

where,

P = Principal amount

R = Rate of Interest

T = Time(in years)

Write a PowerShell to take user inputs and show the results user
#>

Write-Host 'This is simple interest calculator! Please input below:'
[uint16]$Principal = Read-Host -Prompt 'Input your principal amount'
[uint16]$RateOfInterest = Read-Host -Prompt 'What is the Rate of Interest'
[uint16]$Time = Read-Host -Prompt 'Please input your Time in years'
[uint16]$Si = $($Principal*$RateOfInterest*$Time/100)
Write-Host $Si 'Have to pay back'

