param environment string
param keyVaultName string = 'kx-poc-${environment}'
param location string = 'eastus'

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '58be8688-6625-4e52-80d8-c17f3a9ae08a'
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    accessPolicies: []
  }
}
