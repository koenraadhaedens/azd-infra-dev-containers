param location string
param containerImage string

var containerName = 'container${uniqueString(resourceGroup().id)}'
var dnsLabel = 'mydevcontainer${uniqueString(resourceGroup().id)}'

@secure()
param VSCodeWebPassword string

resource containerInstance 'Microsoft.ContainerInstance/containerGroups@2021-03-01' = {
  name: 'myContainerGroup'
  location: location
  properties: {
    containers: [
      {
        name: containerName
        properties: {
          image: containerImage
          ports: [
            {
              port: 443
              protocol: 'TCP'
            }
          ]
          environmentVariables: [
            {
              name: 'PASSWORD'
              secureValue: VSCodeWebPassword
            }
          ]
          resources: {
            requests: {
              cpu: 1
              memoryInGB: 2
            }
          }
        }
      }
    ]
    osType: 'Linux'
    ipAddress: {
      type: 'Public'
      ports: [
        {
          port: 443
          protocol: 'TCP'
        }
      ]
      dnsNameLabel: dnsLabel
    }
  }
}

output containerUrl string = 'https://${dnsLabel}.${location}.azurecontainer.io:443'
