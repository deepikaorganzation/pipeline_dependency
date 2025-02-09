param factoryName string
param pipelineName string
param env string


resource pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${factoryName}/${pipelineName}-${env}-kx' 
  properties: {
    activities: []
  }
}

