<#
You have a folder in your computer(say C:\Important\My Coding Practice ).
Since you do some code changes on daily basis, you want to set up a daily backup using PowerShell.  Preferred time for backup is 10PM.  
The format of backup should be .zip with the date appended in the name.
When you are in office, your preferred backup location is a shared folder which is accessible to you by UNC path(say \\XYZ_CORPS\share\associates\personal\).
But not all the time, you stay in office till 10 PM, and UNC path is not available outside of office environment. In that case, you have to take a local backup to C:\Archives.
Whenever you are in office at the time of scheduled backup, your local backup should also be moved to UNC path as it is safer.
Your space in shared folder at work is limited, so you want to ensure that no more than last 30 backups are available at the backup directory.
Please find a solution using Windows PowerShell and Windows task Scheduler
#>