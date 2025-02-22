

param tables array = ['mykxpoctable', 'uniquiepix', 'shivareddy']

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'kxstoragepoc'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

// Loop through the tables array and create a table for each item
resource tableService 'Microsoft.Storage/storageAccounts/tableServices@2021-04-01' = [for tableName in tables: {
  parent: storageAccount
  name: tableName
}]
