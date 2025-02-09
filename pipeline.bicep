param factoryName string
param pipelineName string
resource adf 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: factoryName
  location: 'East US'
}

resource pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${pipelineName}'
  parent: adf
  properties: {
    activities: []
  }
}

