# Troubleshooting: https://docs.microsoft.com/en-us/powershell/dsc/troubleshooting
# Force update
Update-DscConfiguration -Wait -Verbose

# Get status
$Status = Get-DscConfigurationStatus
$Status.ResourcesNotInDesiredState

# Get logs
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Operational"