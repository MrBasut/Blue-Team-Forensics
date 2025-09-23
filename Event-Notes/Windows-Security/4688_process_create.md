# Windows Security Event ID 4688 -- Process Create 🛠

[Powershell Script to filter 4688](../../Powershell/EventQueries/Windows-Security/Get-4688procreate.ps1)

## Description ✍
Event ID 4688 is generated when a process is created. It helps analysts track down process creations, parent-child process relations, overall user activity and potential malicious activities.

## Key Fields 💡
- **New Process ID** -> A semi-uniqe numbar that identifies the process.
- **New Process Name** -> The full path of the executable.
- **Creator Process Name** -> The name of the program that started this new process.
- **Target Subject-Account Name** -> The account under which the process created.
- **Creator Subject-Account Name** -> The account that initiated the new process.

## Other Useful Fields
- **Creator Subject-Account Domain** -> The domain name for the account created the process.
- **Target Subject-Account Domain** -> The domain name for the account that the process created under.

  Please check the full list: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4688

## Detection Use Cases 🎯
Event ID 4688 may be triggered in different scenarios depending on how the attack is carried out. Here are some examples:
- Suspicious PowerShell or CMD usage ([T1059.001](https://attack.mitre.org/techniques/T1059/001/))
- Scripting engines (wscript, cscript) execution ([T1059.005](https://attack.mitre.org/techniques/T1059/005/))
- Rundll32 execution of malicious DLLs ([T1218.011](https://attack.mitre.org/techniques/T1218/011/))
- LOLBins / Living off the Land Binaries abuse ([T1218](https://attack.mitre.org/techniques/T1218/))
- Execution of tools dropped by attacker ([T1003](https://attack.mitre.org/techniques/T1003/))
- Suspicious parent-child process relationship ([T1204.002](https://attack.mitre.org/techniques/T1204/002/))
- Persistence via scheduled tasks or services creation ([T1053](https://attack.mitre.org/techniques/T1053/))

  
