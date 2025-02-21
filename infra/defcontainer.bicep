param location string
param containerImage string

@secure()
param winVMPassword string

resource containerInstance 'Microsoft.ContainerInstance/containerGroups@2021-03-01' = {
  name: 'myContainerGroup'
  location: location
  properties: {
    containers: [
      {
        name: 'myContainer'
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
              secureValue: winVMPassword
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
    }
  }
}

output containerUrl string = 'https://${containerInstance.properties.ipAddress.fqdn}:443'
