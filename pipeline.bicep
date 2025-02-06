param adfName string
param pipelines array

resource adf 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: adfName
}

resource pipelinesDeploy 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = [for pipeline in pipelines: {
  parent: adf
  name: pipeline.name
  properties: pipeline.properties
}]
