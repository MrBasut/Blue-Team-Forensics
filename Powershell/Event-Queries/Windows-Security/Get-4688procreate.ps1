

$DaysBack= -1
$HoursBack= -1
$Process= 'powershell'


Get-WinEvent -FilterHashtable @{
          LogName='Security';
          Id=4688;
          StartTime=(Get-Date).AddDays($DaysBack)
          } | Select-Object TimeCreated,
                  Id,
                  @{Name='ProcessName';Expression={($_.Message -match "New Process Name:\s+(\S+)") | Out-Null; $matches[1]}},
                  @{Name='CreatorProcess';Expression={($_.Message -match "Creator Process Name:\s+(\S+)") | Out-Null; $matches[1]}}
