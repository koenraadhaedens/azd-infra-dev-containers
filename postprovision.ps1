$resourceGroupName = $env:AZURE_RESOURCE_GROUP
$containerUrl= $env:containerUrl
$location = $env:location

# Example: Output the resource group name and location
Write-Output "Resource Group: $resourceGroupName"
Write-Output "Location: $location"
Write-Output "To access please use browser to go to https://$containerUrl Please click advanced on the SSL warning to conitnue"


# Set environment variable (optional)
azd env set RESOURCE_GROUP_NAME $resourceGroupName
azd env set RESOURCE_GROUP_NAME $containerUrl