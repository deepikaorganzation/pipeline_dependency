param location string = resourceGroup().location
param storageAccounts array
param tables array
param containers array

// Iterate over storage accounts
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = [for storageAccountObj in storageAccounts: {
  name: storageAccountObj.name
  location: location
  sku: storageAccountObj.sku
  kind: storageAccountObj.kind
  tags: storageAccountObj.tags
  properties: {
    defaultToOAuthAuthentication: storageAccountObj.properties.defaultToOAuthAuthentication
    allowCrossTenantReplication: storageAccountObj.properties.allowCrossTenantReplication
    minimumTlsVersion: storageAccountObj.properties.minimumTlsVersion
    allowBlobPublicAccess: storageAccountObj.properties.allowBlobPublicAccess
    networkAcls: storageAccountObj.properties.networkAcls
    supportsHttpsTrafficOnly: storageAccountObj.properties.supportsHttpsTrafficOnly
    accessTier: storageAccountObj.properties.accessTier
  }
}]

// Define tables and containers for each storage account

resource storageAccountTables 'Microsoft.Storage/storageAccounts/tableServices/tables@2022-05-01' = [for table in tables: {
  
  name: '${table.storageaccountName}/default/${table.tableName}'
  
}]



resource storageAccountContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = [for container in containers: {
  
  name: '${container.storageaccountName}/default/${container.containerName}'
}]
