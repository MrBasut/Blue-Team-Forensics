#This script designed to filter EventID 4688 logs from the last 24 hours.
#Change the parameter DaysBack in the script with HoursBack if you are dealing with hours instead of days.
#You may alter the values to suit your need.
#You may change the comment block to filter for a specific process name and value of $Process.

$DaysBack= -1
$HoursBack= -1
$Process= <Process_Name>


Get-WinEvent -FilterHashtable @{
          LogName='Security';
          Id=4688;
          StartTime=(Get-Date).AddDays($DaysBack)
          } <#| Where-Object {$_Message -matches "Process Name=\s+$Process"#>| Select-Object TimeCreated,
                  @{Name='ProcessName';Expression={($_.Message -match "New Process Name:\s+(\S+)") | Out-Null; $matches[1]}},
                  @{Name='CreatorProcess';Expression={($_.Message -match "Creator Process Name:\s+(\S+)") | Out-Null; $matches[1]}}
