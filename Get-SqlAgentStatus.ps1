[CmdletBinding()]
Param (
	[Parameter(Mandatory)]
	[String]$SqlInstance
)
try
{
	Import-Module DbaTools
	$Jobs = Get-DbaAgentJob -SqlInstance $SqlInstance -ExcludeDisabledJobs -EnableException
	$result = $jobs | ForEach-Object {
		@{
			channel     = $_.Name;
			value       = [Int32]$_.LastRunOutcome;
			valuelookup = 'SqlAgentJob.ExecutionResult';
		}
	}
	$prtg = @{ prtg = @{ result = $result; }; }
}
catch
{
	$prtg = @{
		prtg = @{
			error   = 1;
			message = $_.Exception.Message;
		};
	}
}
$prtg | ConvertTo-Json -Depth 3 | Write-Output