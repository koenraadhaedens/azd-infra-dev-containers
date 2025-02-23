
$containerUrl= $env:containerUrl


# Example: Output the resource group name and location
Write-Output "To access please use browser to go to $containerUrl Please click advanced on the SSL warning to conitnue and use password you setup to login"

$webhookUrl = "https://8116ebc5-9750-4a45-bb68-3623eef692f3.webhook.ne.azure-automation.net/webhooks?token=I0rOVuUgvzy17%2fBW%2f%2baIfz%2f6w9C9jUAH6F8sCYbjEUs%3d"

$deploymentData = @{
    User = $env:USERNAME
    Machine = $env:COMPUTERNAME
    CommitHash = (git rev-parse HEAD)
    AzureUser = $(az account show --query user.name -o tsv)
} | ConvertTo-Json -Depth 10

Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $deploymentData -ContentType "application/json"