
param location string = resourceGroup().location
param keyVaults array

resource mykeyVault 'Microsoft.KeyVault/vaults@2023-07-01' = [for keyVault in keyVaults: {
  name: keyVault.keyVaultName
  location: location
  properties: keyVault.properties
}]
