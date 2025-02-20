param dataFactoryName string
param dataflows array

resource dataflow 'Microsoft.DataFactory/factories/dataflows@2018-06-01' = [for dataflow in dataflows: {
  
  name: '${dataFactoryName}/${dataflow.name}'
  properties: dataflow.definition.properties
}]
