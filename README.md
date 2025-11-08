# Windows SysAdmin Lab (AWS EC2)

## Overview
Single-instance Windows Server 2025 EC2 lab demonstrating troubleshooting and automation.

## Architecture
- AWS EC2 t3.small instance
- Security Groups: RDP 3389, HTTP 80
- IIS installed and tested via public IP

## Incidents Simulated
### Incident 1 - IIS Service Failure
![issue1](screenshots/windows_issue1.png)
**Symptoms:** HTTP site inaccessible  
**Diagnosis:** `Get-Service W3SVC` showed stopped  
**Resolution:** `Start-Service W3SVC`  
**Verification:** Site restored (`http://localhost`)  

### Incident 2 - Low Disk Space
![issue2](screenshots/windows_issue2.png)
**Symptoms:** Disk warning / files not saving  
**Diagnosis:** `Get-PSDrive C` showed < 5 GB free  
**Resolution:** Removed large files  
**Verification:** Disk usage normalised  

### Incident 3 - Disabled Account
![issue3](screenshots/windows_issue3.png)
**Symptoms:** Login failure for TestUser  
**Diagnosis:** `Get-LocalUser TestUser` → Disabled = True  
**Resolution:** `Enable-LocalUser TestUser`  
**Verification:** Login success  

## Automation
- `windows_iis_check.ps1` - Restarts IIS if stopped  
- `windows_disk_check.ps1` - Logs low-disk alerts  

### Optional scheduled scripts for hourly checks:
- `windows_scheduled_iis_check.ps1` - Restarts IIS if stopped  
- `windows_scheduled_disk_check.ps1` - Logs low-disk alerts  

## Skills Demonstrated
- Windows Server Administration & Troubleshooting  
- PowerShell Automation  
- AWS EC2 Management  
- Incident Diagnosis and Documentation  

## Next Steps
- CloudWatch monitoring
- SNS alerting
- CloudFormation templates to deploy the instance, work in progress:
![cloudformation](screenshots/cloudformation_test1.png)
