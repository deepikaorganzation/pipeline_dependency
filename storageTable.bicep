param storageAccountName1 string
param storageAccountName2 string
param location string = 'eastus'
param tags object = {
  Company: 'KAC'
  Environment: 'DEV'
  Project: 'Komatsu Experience (KX)'
}
param sku object = {
  name: 'Standard_LRS'
  tier: 'Standard'
}
param kind string = 'StorageV2'
param encryption1 object = {
  services: {
    file: {
      keyType: 'Account'
      enabled: true
      lastEnabledTime: '2024-11-13T06:32:31.0996132Z'
    }
    blob: {
      keyType: 'Account'
      enabled: true
      lastEnabledTime: '2024-11-13T06:32:31.0996132Z'
    }
  }
  keySource: 'Microsoft.Storage'
}
param encryption2 object = {
  services: {
    file: {
      keyType: 'Account'
      enabled: true
      lastEnabledTime: '2024-11-05T12:18:31.3842744Z'
    }
    blob: {
      keyType: 'Account'
      enabled: true
      lastEnabledTime: '2024-11-05T12:18:31.3842744Z'
    }
  }
  keySource: 'Microsoft.Storage'
}
param networkAcls1 object = {
  bypass: 'AzureServices'
  virtualNetworkRules: []
  ipRules: []
  defaultAction: 'Allow'
}
param networkAcls2 object = {
  bypass: 'AzureServices'
  virtualNetworkRules: []
  ipRules: [
    { value: '136.226.244.97', action: 'Allow' }
    { value: '136.226.232.184', action: 'Allow' }
  ]
  defaultAction: 'Allow'
}
param minimumTlsVersion string = 'TLS1_2'
param allowBlobPublicAccess bool = false
param supportsHttpsTrafficOnly bool = true
param accessTier string = 'Hot'

resource storageAccount1 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccountName1
  location: location
  sku: sku
  kind: kind
  tags: tags
  properties: {
    defaultToOAuthAuthentication: true
    allowCrossTenantReplication: false
    minimumTlsVersion: minimumTlsVersion
    allowBlobPublicAccess: allowBlobPublicAccess
    networkAcls: networkAcls1
    supportsHttpsTrafficOnly: supportsHttpsTrafficOnly
    encryption: encryption1
    accessTier: accessTier
  }
}

resource storageAccount2 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccountName2
  location: location
  sku: sku
  kind: kind
  tags: tags
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    isLocalUserEnabled: true
    isSftpEnabled: false
    minimumTlsVersion: minimumTlsVersion
    allowBlobPublicAccess: allowBlobPublicAccess
    allowSharedKeyAccess: true
    largeFileSharesState: 'Enabled'
    isHnsEnabled: true
    networkAcls: networkAcls2
    supportsHttpsTrafficOnly: supportsHttpsTrafficOnly
    encryption: encryption2
    accessTier: accessTier
  }
}

param tables1 array = ['mykxpoctable', 'uniquiepix', 'shivareddy']
resource storageTableService1 'Microsoft.Storage/storageAccounts/tableServices@2023-05-01' = {
  parent: storageAccount1
  name: 'default'  // name of the table inside the storage account
}
// Loop through the tables array and create a table for each item
resource tableService1 'Microsoft.Storage/storageAccounts/tableServices/tables@2023-05-01' = [for tableName in tables1: {
  parent: storageTableService1
  name: tableName
}]

@description('Array of container Names to create')
param containers1 array = [
  'container1'
  'container2'
]

resource blobStorage1 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' = {
  parent: storageAccount1
  name: 'default'
}
@description('Create containers in existing storage account')
resource storageContainers1 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = [for containerName in containers1:{
  parent: blobStorage1
  name: containerName
  properties:{
    publicAccess : 'None'
  }
}]

param tables2 array = []
resource storageTableService2 'Microsoft.Storage/storageAccounts/tableServices@2023-05-01' = {
  parent: storageAccount2
  name: 'default'  // name of the table inside the storage account
}
// Loop through the tables array and create a table for each item
resource tableService2 'Microsoft.Storage/storageAccounts/tableServices/tables@2023-05-01' = [for tableName in tables2: {
  parent: storageTableService2
  name: tableName
}]

@description('Array of container Names to create')
param containers2 array = [
]

resource blobStorage2 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' = {
  parent: storageAccount2
  name: 'default'
}
@description('Create containers in existing storage account')
resource storageContainers2 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = [for containerName in containers2:{
  parent: blobStorage2
  name: containerName
  properties:{
    publicAccess : 'None'
  }
}]

output storageAccount1Endpoints object = {
  dfs: storageAccount1.properties.primaryEndpoints.dfs
  web: storageAccount1.properties.primaryEndpoints.web
  blob: storageAccount1.properties.primaryEndpoints.blob
  queue: storageAccount1.properties.primaryEndpoints.queue
  table: storageAccount1.properties.primaryEndpoints.table
  file: storageAccount1.properties.primaryEndpoints.file
}

output storageAccount2Endpoints object = {
  dfs: storageAccount2.properties.primaryEndpoints.dfs
  web: storageAccount2.properties.primaryEndpoints.web
  blob: storageAccount2.properties.primaryEndpoints.blob
  queue: storageAccount2.properties.primaryEndpoints.queue
  table: storageAccount2.properties.primaryEndpoints.table
  file: storageAccount2.properties.primaryEndpoints.file
}
