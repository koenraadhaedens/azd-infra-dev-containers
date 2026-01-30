# Load AZD environment variables into PowerShell
azd env get-values > .env

$containerUrl     = $env:containerUrl
$environmentName  = $env:AZURE_ENV_NAME
$location         = $env:AZURE_LOCATION
$commitHash       = $env:GIT_COMMIT
$machine          = "cloud-shell/1.0"

# Your Azure Automation webhook URL
$webhookUrl = 'https://8116ebc5-9750-4a45-bb68-3623eef692f3.webhooks?token=mkbmnnnhgDsL20iey6qRj9Vc0ylCVg%2bpeZ1Yym7rsZs%3d'

# Build the payload as a PowerShell object
$deploymentData = @{
    Deployment      = $containerUrl
    location        = $location
    environmentName = $environmentName
    Machine         = $machine
    CommitHash      = $commitHash
    Timestamp       = (Get-Date).ToString("o")
}

# Convert to JSON (this becomes the actual webhook body)
$body = $deploymentData | ConvertTo-Json -Depth 5

# Send to Azure Automation as proper JSON
Invoke-RestMethod `
    -Uri $webhookUrl `
    -Method Post `
    -Body $body `
    -ContentType "application/json"
