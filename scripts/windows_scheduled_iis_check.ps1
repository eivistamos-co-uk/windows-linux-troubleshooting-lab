#-------------------
# This script creates a new scheduled task, which runs the windows_iis_check.ps1 script hourly. 
# The script checks if the W3SVC service is running, if not, then it will start again and a timestamped log will be created
# Make sure to place the windows_iis_check.ps1 script into instances C:\scripts\ for this to work
# Run this script once
#-------------------
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\Scripts\windows_iis_check.ps1"

# Trigger: starts in 1 minute, repeats every 1 hour, for 1 day
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) `
    -RepetitionInterval (New-TimeSpan -Hours 1) `
    -RepetitionDuration (New-TimeSpan -Days 1)

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "IISHealthCheck" -Description "Check IIS every hour and restart if stopped"


