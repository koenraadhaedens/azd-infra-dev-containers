#!/bin/bash

# Save environment values to .env
azd env get-values > .env

# Get environment variables
environmentName=$AZURE_ENV_NAME
location=$AZURE_LOCATION
containerUrl= $env:containerUrl

# comment the lines below if you do not want to send stats to a table
 webhookUrl="https://8116ebc5-9750-4a45-bb68-3623eef692f3.webhook.ne.azure-automation.net/webhooks?token=ZEwDwUSa225CZVgKPQ7ZDDe6K%2f8k9sMl2ou1FJlYpMA%3d"
 commitHash=$(git rev-parse HEAD)
 deploymentData=$(jq -n --arg deployment "azd-infra-dev-containers" --arg location "$location" --arg environmentName "$environmentName" --arg machine "$AZUREPS_HOST_ENVIRONMENT" --arg commitHash "$commitHash" '{Deployment: $deployment, location: $location, environmentName: $environmentName, Machine: $machine, CommitHash: $commitHash}')
 curl -X POST -H "Content-Type: application/json" -d "$deploymentData" "$webhookUrl"
 echo "Stats Tracked to Table"
 echo $containerUrl
