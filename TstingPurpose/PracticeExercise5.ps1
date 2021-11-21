<#
Write a logic using nested loops(for loop or while loop) to draw the below pattern
#
##
###
####
#####
######
#######
########
#########
##########
###########
#>

$x = [int] (Read-Host "Write number")
for($i=1; $i -le $x; $i++) {
    for($k=1; $k -le $x; $k++ ){
        Write-Host -NoNewLine " "
    }
    for($j=1; $j -le 1 * $i - 1; $j++) {
        Write-Host -NoNewLine "#"
    }
    Write-Host " "
}
