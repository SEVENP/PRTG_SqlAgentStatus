This custom PRTG sensor can be used to monitor the status of enabled Microsoft SQL Server agent jobs. It ensures that the status of every job is available and that failed jobs impose a sensor failure.

## Requirements
1. Every probe that holds this server should have the [dbatools](https://dbatools.io/) PowerShell module installed.
2. The script connects to the SQL server under the user context that runs PRTG. The user needs to be assigned the SQLAgentReaderRole on the msdb database.