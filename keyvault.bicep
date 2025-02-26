@description('The name of the key vault')
param myKeyVault string

@description('SFTP key for PIM feed')
param secrets array 


resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: myKeyVault
}

resource keyVaultSecret 'Microsoft.KeyVault/vaults/secrets@2023-07-01' = [for secret in secrets: {
  parent: keyVault
  name: secret.name
  properties: {
    value: secret.value
  }
}]
