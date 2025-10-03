# Windows Security Event ID 4720 -- User Creation 🧑


## Description ✍

Event ID 4720 is generated when a new user account is created on a Windows system. Monitoring this event is crucial for detecting unauthorized account creations, privilege escalation attempts, and attacker persistence techniques.

## Key Fileds 🗝

- **Subject-Account Name:** Indicates the account who created the new one.
- **Subject-Account Domain:** Indicates the domain of account created the new one.
- **New Account-Account Name:** Name of the new user.
- **New Account-Account Domain:** Domain name of the new user.
- **Attributes-User Account Control:** Gives the information about the new user (e.g. enabled/disabled, Password required/not required)

## Other Useful Fileds

- **Attributes-SAM Account Name:** Logon name for account used to support clients and servers.
- **Attributes-Display Name:** A name displayed in the address book for a particular account.

Please check the full list: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4720


## Detection Use Cases 🎯

- **Unauthorized account creation by non-administrative users** [T1078](https://attack.mitre.org/techniques/T1078/)
- **New account creation outside normal working hours** [T1078.004](https://attack.mitre.org/techniques/T1078/004/)
- **Multiple new accounts created in a short timeframe** [T1136](https://attack.mitre.org/techniques/T1136/)
- **Accounts with suspicious configurations** [T1136.001](https://attack.mitre.org/techniques/T1136/001/)
