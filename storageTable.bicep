

param tables array = ['mykxpoctable', 'uniquiepix', 'shivareddy']

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
// Loop through the tables array and create a table for each item
resource tableService 'Microsoft.Storage/storageAccounts/tableServices/tables@2023-05-01' = [for tableName in tables: {
  parent: storageTableService
  name: tableName
}]
