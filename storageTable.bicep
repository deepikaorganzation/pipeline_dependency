resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'kxstoragepoc'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
resource storageTableService 'Microsoft.Storage/storageAccounts/tableServices@2023-05-01' = {
  parent: storageAccount
  name: 'default'  // name of the table inside the storage account
}
resource storageTable 'Microsoft.Storage/storageAccounts/tableServices/tables@2023-05-01' = {
  parent: storageTableService
  name: 'mykxpoctable'  // name of the table inside the storage account
}
