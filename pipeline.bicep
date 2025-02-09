param factoryName string
param pipelineName string


resource pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${factoryName}/${pipelineName}'
  properties: {
    activities: []
  }
}

