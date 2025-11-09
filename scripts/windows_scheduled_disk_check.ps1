#-------------------
# This script creates a new scheduled task, which runs the windows_disk_check.ps1 script hourly. 
# The script checks the disk utilisation percentage, if it's below a threshold, then a timestamped log will be created
# Make sure to place the windows_disk_check.ps1 script into the instances C:\scripts\ for this to work
# Run this script once
#-------------------
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\windows_disk_check.ps1"

# Trigger: starts in 1 minute, repeats every 1 hour, for 1 day
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) `
    -RepetitionInterval (New-TimeSpan -Hours 1) `
    -RepetitionDuration (New-TimeSpan -Days 1)

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "DiskUtilCheck" -Description "Check disk percentage every hour and log if over threshold"