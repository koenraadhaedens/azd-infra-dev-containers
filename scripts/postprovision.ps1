azd env get-values > .env

$containerUrl = $env:containerUrl
$environmentName = $env:AZURE_ENV_NAME
$location = $env:AZURE_LOCATION

# sending stats to table please comment out if you do not want this
$webhookUrl = "https://8116ebc5-9750-4a45-bb68-3623eef692f3.webhooks?token=mkbmnnnhgDsL20iey6qRj9Vc0ylCVg%2bpeZ1Yym7rsZs%3d"

# Build deployment data object
$deploymentData = @{
    containerUrl     = $containerUrl
    environmentName  = $environmentName
    location         = $location
    timestamp        = (Get-Date).ToString("o")
}

# Convert to JSON if sending to webhook
$body = $deploymentData | ConvertTo-Json -Depth 5

# Example POST (uncomment if needed)
# Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $body -ContentType "application/json"
