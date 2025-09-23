#This script designed to filter EventID 4688 logs from the last 24 hours.
#Change the parameter DaysBack in the script with HoursBack if you are dealing with hours instead of days.
#You may alter the values to suit your need.
#You may change the comment block to filter for a specific process name and value of $Process.
#Output format will be table with TimeCreated, CreatorAccount, TargetAccount, ProcessName and CreatorProcess

$DaysBack= -1
$HoursBack= -1
$Process= <Process_Name>


Get-WinEvent -FilterHashtable @{
          LogName='Security';
          Id=4688;
          StartTime=(Get-Date).AddDays($DaysBack)
          } <#| Where-Object {$_.Message -match "New Process Name=\s+$Process"}#>| Select-Object TimeCreated,
                  @{Name='CreatorAccount';Expression={($_.Message -match "Creator Subject:\s*[\s\S]*?Account Name:\s+(\S+)") | Out-Null; $matches[1]}},
                  @{Name='TargetAccount';Expression={($_.Message -match "Target Subject:\s*[\s\S]*?Account Name:\s+(\S+)") | Out-Null; $matches[1]}},
                  @{Name='ProcessName';Expression={($_.Message -match "New Process Name:\s+(\S+)") | Out-Null; $matches[1]}},
                  @{Name='CreatorProcess';Expression={($_.Message -match "Creator Process Name:\s+(\S+)") | Out-Null; $matches[1]}}
