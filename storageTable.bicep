resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'kxstoragepoc'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
resource storageTableService 'Microsoft.Storage/storageAccounts/tableServices@2021-04-01' = {
  parent: storageAccount
  name: 'Table'  // name of the table inside the storage account
}
resource storageTable 'Microsoft.Storage/storageAccounts/tableServices/tables@2021-04-01' = {
  parent: storageTableService
  name: 'myTableName'  // name of the table inside the storage account
}
