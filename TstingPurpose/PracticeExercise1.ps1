### START
#Andreas Tigasing#
#Practice Exercise taken from http://www.techsckool.com/2021/06/practice-exercise1-file.html

#Sets location to C:\powershell\TstingPurpose

$location = Set-Location C:\powershell\TstingPurpose
$location

#How many folders i want

$FolderCount = 1..3

#Creates 3 folders with number in their name is asc to as many folders i have

foreach($CountNumber in $FolderCount){
    New-Item -Path .\ -ItemType Directory -Name SubFolder$CountNumber -Force
}

#Basic 1-50 and 51-100

$Sub1Count = 1..50
$Sub2Count = 51..100

#SubFolder1 creates new folders with .txt names in them - every file has a number in asc pattern 1-50

foreach($CountNumber in $Sub1Count){
    New-Item -Path .\SubFolder1 -ItemType File -Name TypeATest$CountNumber.txt -Force
}

#SubFolder2 creates new folders with .txt names in them - every file has a number in asc pattern 51-100

foreach($CountNumber in $Sub2Count){
    New-Item -Path .\SubFolder2 -ItemType File -Name TypeBTest$CountNumber.txt -Force
}

<#
Gets filename directory from C:\powershell\TstingPurpose\*subdirectories also* and sends them to if fucktion and looking up if filename has ood or even number in it. 
After that it moves that file to the right directory
#>

Get-ChildItem -Path "C:\powershell\TstingPurpose\" -File -Recurse | Where-Object {$_.Name -match "\d*.txt"} | ForEach-Object {
    if ($_.FullName -match '\d*[02468].txt') {
        Write-Output "Paaris arv" $_.FullName
        Move-Item -Path $_.FullName -Destination .\SubFolder1 -Force
    }
    elseif ($_.FullName -match '\d*[13579].txt') {
        Write-Output "Paaritu arv" $_.FullName
        Move-Item -Path $_.FullName -Destination .\SubFolder2 -Force
    }
    else {
        Write-Output "Ei matchi millegi minule antud konditsiooniga! Homo Sapiens rsk!" $_.FullName
    }
}

#Renames folder name

Rename-Item -Path .\SubFolder1 -NewName EvenFilesContainer 
Rename-Item -Path .\SubFolder2 -NewName OddFilesContainer

#Gets current date and sends that value to MasterFile.txt and after that it adds other AType and BType full filename directory to that file.

$Curdate = (Get-Date).tostring("dd.MM.yyyy hh:mm:ss")
New-Item -Path "C:\powershell\TstingPurpose\MasterFile.txt" -ItemType File -Value "As of $Curdate files inside Testing Purpose are: " -force
Add-Content -Path "C:\powershell\TstingPurpose\MasterFile.txt" -Value ""
Get-ChildItem -Recurse -ErrorAction SilentlyContinue | Select-Object $_.FullName -ExpandProperty FullName | Out-file -FilePath "C:\powershell\TstingPurpose\MasterFile.txt" -force -append -Encoding UTF8

#Removes all files cotaining filename TypeA*.txt

Get-ChildItem -Path "C:\powershell\TstingPurpose\" -Include TypeA*.txt -Recurse | Remove-Item


### END