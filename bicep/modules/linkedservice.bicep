targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param linkedServices array


resource linkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = [for linkedService in linkedServices: {
  name: '${dataFactoryName}/${linkedService.name}'  // Removed the ${dataFactory.name}/ part
  properties: {
    type: linkedService.definition.properties.type
    typeProperties: linkedService.definition.properties.typeProperties
  }
}]


