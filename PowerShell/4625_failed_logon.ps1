# Windows Security Event ID : 4625 -- Failed Logon 🚨

## Description ✍
Event ID 4625 is generated when a logon attempt is failed. It helps analysts detect Brute Force attacks, unauthorized access attempts or misconfigure services.

## Key Field 🔐
- **TargetUserName** -> The account on which the attempt carried out.
- **LogonType** -> The channel (or method) on which the logon attempt carried out.


    | Logon Type   | Name             | Description                  |
    |:------------:|:----------------:|:----------------------------:| 
    | 2            | Interactive      | Attempt tried on console.     |
    | 3            | Network          | Attempt via network.          |
    | 4            | Batch            | Attempt by batch job triggered by schtask. |
    | 5            | Service          | Attempt by service account. |
    | 7            | Unlock           | Session unlock attempt. |
    | 8            | NetworkCleartext | Attempt by sending credentials in cleartext. |
    | 9            | NewCredentials   | Logon using `RunAs` with different credentials. |
    | 10           | RemoteInteractive| Attempt via RDP or terminal services. |
    | 11           | CachedInteractive| Logon with cached domain credentials. |

  -
