param adfName string
param location string = 'East US'

resource adf 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: adfName
  location: location
  properties: {}
}
