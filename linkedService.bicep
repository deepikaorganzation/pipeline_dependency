param adfName string
param linkedServices array

resource adf 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: adfName
}

resource adfLinkedServices 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = [for linkedService in linkedServices: {
  name: linkedService.name
  parent: adf
  properties: linkedService.definition.properties
}]
