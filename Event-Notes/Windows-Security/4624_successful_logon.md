# Windows Security Event ID 4624 -- Successful Logon 🔓

[PowerShell Script to filter 4624](../../Powershell/Get-4624SuccessfulLogon.ps1)

[Splunk Query to filter 4624](../../Splunk/SingleQueries/4624_successfullogons.spl)

## Description ✍
Event ID 4624 is generated when there is a successful logon. If the log is generated right after EventID 4625(failed logon) excessive amount (depending on threshold) logs, it helps investigators understand which user is compromised.

## Key Field 🔑

- **TargetUserName** -> The account that is logged on.
- **LogonType** -> The channel (or method) on which the logon carried out.


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

- **TargetLogonId** -> ID of logged session on.


## Other Useful Fields
- **AuthenticationPackageName** -> Which authentication method used (e.g Kerberos, NTLM).
- **LogonProcessName** -> Which mechanisms triggered.
- **TargetDomainName** -> Domain Context

Please check the full list: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4624

## Detection Use Cases 🎯
Event ID 4624 may be detected as suspicious depending on scenario and amount of Event ID 4625 generated. Here is some examples:
- Brute Force ([T1110](https://attack.mitre.org/techniques/T1110/))
- Password Spray ([T1110.003](https://attack.mitre.org/techniques/T1110/003/))
- Remote Services Access ([T1021](https://attack.mitre.org/techniques/T1021/))
- Valid account reconnaissance / targeted attempts ([T1087](https://attack.mitre.org/techniques/T1087/))
- Suspicious time-of-day logon attempts ([T1078](https://attack.mitre.org/techniques/T1078/))
- Service / scheduled task misconfiguration attempts ([T1053](https://attack.mitre.org/techniques/T1053/))
