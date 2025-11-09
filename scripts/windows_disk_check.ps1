# Disk usage alert script
$threshold = 15 # Defines percentage threshold for low disk space warning
$drive = Get-PSDrive -Name C # Retrieves the drive as a variable
$free = ($drive.Free / $drive.Used) * 100 # Stores percentage storage space free as variable
if ($free -lt $threshold) { # If storage % is less than defined threshhold, then:
    Add-Content "C:\Temp\disk_alert.txt" "$(Get-Date) - WARNING: Low disk space ($([math]::Round($free,2))%)" # Adds a timestamped entry to the file noting free % of disk space remaining
}



