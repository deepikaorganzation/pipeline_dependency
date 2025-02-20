param factoryName string
param pipelines array

resource adf 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: factoryName
  location: 'East US'
}

resource pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = [for pipeline in pipelines: {
  name: '${pipeline.name}'
  parent: adf
  properties: pipeline.definition.properties
}]

