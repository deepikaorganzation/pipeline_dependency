targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param triggers array

param dataFactoryName string


resource triggerADF 'Microsoft.DataFactory/factories/triggers@2018-06-01' = [for trigger in triggers: {
  name: '${dataFactoryName}/${trigger.name}'
  properties: trigger.definition.properties
}]
