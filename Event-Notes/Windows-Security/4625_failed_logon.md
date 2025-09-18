# Windows Security Event ID : 4625 -- Failed Logon 🚨
<!-- TODO: link to Splunk detection when folder ready -->
[PowerShell Script to filter and show 4625](../Powershell/Event-Queries/Windows-Security/Get-4625FailedLogon.ps1)

## Description ✍
Event ID 4625 is generated when a logon attempt fails. It helps analysts detect Brute Force attacks, unauthorized access attempts or misconfigure services.

## Key Field 🔐
- **TargetUserName** -> The account on which the attempt carried out.
- **LogonType** -> The channel (or method) on which the logon attempt carried out.


    | Logon Type   | Name             | Description                  |
    |:------------:|:---------------:|:----------------------------:| 
    | 2            | Interactive      | Attempt tried on console.     |
    | 3            | Network          | Attempt via network.          |
    | 4            | Batch            | Attempt by batch job triggered by schtask. |
    | 5            | Service          | Attempt by service account. |
    | 7            | Unlock           | Session unlock attempt. |
    | 8            | NetworkCleartext | Attempt by sending credentials in cleartext. |
    | 9            | NewCredentials   | Logon using `RunAs` with different credentials. |
    | 10           | RemoteInteractive| Attempt via RDP or terminal services. |
    | 11           | CachedInteractive| Logon with cached domain credentials. |

- **Source Network Address** -> IP address of the client.

    Note: Source Network Address may be empty for local/console logons or when traffic is proxied/NATed — correlate with agent/network logs.
- **Failure Reason** -> Why the logon attempt failed.

## Other Useful Fields
- **AuthenticationPackageName** -> Which authentication method used (e.g Kerberos, NTLM).
- **LogonProcessName** -> Which mechanisms triggered.
- **TargetDomainName** -> Domain Context

Please check the full list: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4625

## Detection Use Cases 🎯
Event ID 4625 may be triggered in different scenarios depending on how the attack is carried out. Here is some examples:
- Brute Force ([T1110](https://attack.mitre.org/techniques/T1110/))
- Password Spray ([T1110.003](https://attack.mitre.org/techniques/T1110/003/))
- Remote Services Access ([T1021](https://attack.mitre.org/techniques/T1021/))
- Valid account reconnaissance / targeted attempts ([T1087](https://attack.mitre.org/techniques/T1087/))
- Suspicious time-of-day logon attempts ([T1078](https://attack.mitre.org/techniques/T1078/))
- Service / scheduled task misconfiguration attempts ([T1053](https://attack.mitre.org/techniques/T1053/))


