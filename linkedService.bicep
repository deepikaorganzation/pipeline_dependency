param adfName string
param linkedServices array

resource adf 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: adfName
}

resource pipelinesDeploy 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = [for linkedService in linkedServices: {
  parent: adf
  name: linkedService.name
  properties: linkedService.definition.properties
}]
