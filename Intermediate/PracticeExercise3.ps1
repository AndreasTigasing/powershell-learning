<#
There are scheduled tasks Important_Service_Restart and Important_Job_Processing running on 100 machines(you have their names in a text file). 
Tasks are scheduled to run on the daily basis and they are critical for your business.
You need to write a PowerShell script to run after 15 minutes of task scheduled time and collect the status into a CSV file(each task, each computer).
Next, Read the CSV file and get the name of servers where the last run of the task was failed.
Servers on which one task was failed, action should be sending an email to the support asking them to look into this urgently.
Servers on which both tasks were found in failed status, send an email to support and send a separate email to management informing them about the severity of the situation.
Next, Once your standard solution is ready, improvise your solution to decrease the overall script execution time(hint:; use multi threading)
#>