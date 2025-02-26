

param strorageAccountName string
param tables array = ['mykxpoctable', 'uniquiepix', 'shivareddy']
param tags object = {
  Company: 'KAC'
  Environment: 'DEV'
  Project: 'Komatsu Experience (KX)'
}
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: strorageAccountName
  location: resourceGroup().location
  tags: tags
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
  }
  kind: 'StorageV2'
}

resource storageTableService 'Microsoft.Storage/storageAccounts/tableServices@2023-05-01' = {
  parent: storageAccount
  name: 'default'  // name of the table inside the storage account
}
// Loop through the tables array and create a table for each item
resource tableService 'Microsoft.Storage/storageAccounts/tableServices/tables@2023-05-01' = [for tableName in tables: {
  parent: storageTableService
  name: tableName
}]

@description('Array of container Names to create')
param containerNames array = [
  'container1'
  'container2'
]


@description('Create containers in existing storage account')
resource storageContainers 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = [for containerName in containerNames:{
  name: 'default/${containerName}'
  properties:{
    publicAccess : 'None'
  }
}]
