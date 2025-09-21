


Get-WinEvent -FilterHashtable @{
          LogName='Security';
          Id=4688;
          StartTime=(Get-Date).AddDays()
          }
