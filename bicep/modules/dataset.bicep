targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param datasets array



resource dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = [for dataset in datasets: {
  name: '${dataFactoryName}/${dataset.name}'
  properties: dataset.definition.properties
}]
