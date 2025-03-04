param location string = resourceGroup().location
param storageAccounts array

// Iterate over storage accounts
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = [for storageAccountObj in storageAccounts: {
  name: storageAccountObj.name
  location: location
  sku: {
    name: storageAccountObj.sku
  }
  kind: storageAccountObj.kind
  tags: storageAccountObj.tags
  properties: {
    defaultToOAuthAuthentication: storageAccountObj.properties.defaultToOAuthAuthentication
    allowCrossTenantReplication: storageAccountObj.properties.allowCrossTenantReplication
    minimumTlsVersion: storageAccountObj.properties.minimumTlsVersion
    allowBlobPublicAccess: storageAccountObj.properties.allowBlobPublicAccess
    networkAcls: storageAccountObj.properties.networkAcls
    supportsHttpsTrafficOnly: storageAccountObj.properties.supportsHttpsTrafficOnly
    encryption: storageAccountObj.properties.encryption
    accessTier: storageAccountObj.properties.accessTier
  }
}]

// Define tables and containers for each storage account
resource storageAccountTableService 'Microsoft.Storage/storageAccounts/tableServices@2022-05-01' = [for (storageAccountObj, index) in storageAccounts: {
  parent: storageAccount[index]
  name: 'default'
  properties: {
  }
}]

resource storageAccountTables 'Microsoft.Storage/storageAccounts/tableServices/tables@2022-05-01' = [for (storageAccountObj, index) in storageAccounts: {
  parent: storageAccountTableService[index]
  name: storageAccountObj.tables
  
}]

resource storageAccountBlobService 'Microsoft.Storage/storageAccounts/blobServices@2022-05-01' = [for (storageAccountObj, index) in storageAccounts: {
  parent: storageAccount[index]
  name: 'default'
  properties: {
  }
}]

resource storageAccountContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = [for (storageAccountObj, index) in storageAccounts: {
  parent: storageAccountBlobService[index]
  name: storageAccountObj.containers
  
}]
