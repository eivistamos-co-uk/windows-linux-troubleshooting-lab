# IIS Service Health Check and Restart Script
$service = Get-Service W3SVC #Retrieves Wprld Wide Web Publishing Service and stores it as variable
if ($service.Status -ne 'Running') { # Checks if the status of W3SVC is not equal to Running, if so, then:
    Start-Service W3SVC # Start the service
    Add-Content "C:\Temp\iis_log.txt" "$(Get-Date) - IIS restarted" # Adds a timestamped entry to the file noting that IIS was started again
}
