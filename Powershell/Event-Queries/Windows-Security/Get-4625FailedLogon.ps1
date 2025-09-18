
#This script designed to filter and show EventID 4625 logs with logon type 10 from the last 24 hours.
#Change the parameter DaysBack in the script with HoursBack if you are dealing with hours instead of days.
#You may alter the values to suit your need.

$DaysBack= -1
$HoursBack= -1
$LogonType= 10


Get-WinEvent -FilterHashtable @{
        LogName='Security'; 
        Id=4625; 
        StartTime=(Get-Date).AddDays($DaysBack)
        } | Where-Object {$_.Message -match "Logon Type:\s+$LogonType"}
        | Select-Object TimeCreated,
        @{Name='TargetUser';      Expression={[regex]::Match($_.Message,'Account Name:\s+([^\r\n]+)').Groups[1].Value}},
        @{Name='SourceIP';        Expression={[regex]::Match($_.Message,'Source Network Address:\s+([^\r\n]+)').Groups[1].Value}},
        @{Name='FailureReason';   Expression={[regex]::Match($_.Message,'Failure Reason:\s+([^\r\n]+)').Groups[1].Value}}
