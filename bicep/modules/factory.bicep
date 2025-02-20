param dataFactoryName string
param location string = resourceGroup().location

// Parameterize the identity type
param identityType string = 'SystemAssigned' // Default to 'SystemAssigned' if not specified

// Define parameters for global parameters
param httpsUrlForEmail string = 'https://api-dev.komatsu.com/sendemail'
param inboundAzureStorageContainer string = 'inbound'
param outboundAzureStorageBlobContainer string = 'outbound'
param errorAzureStorageBlobContainer string = 'error'
param retriggerAzureStorageBlobContainer string = 'retrigger'
param environment string = 'dev'
param httpUrlForToken string = 'https://login.microsoftonline.com/58be8688-6625-4e52-80d8-c17f3a9ae08a/oauth2/v2.0/token'
param fromEmailAddress string = 'pabitra.patra@global.komatsu'
param notificationEmailServiceClientId string = ''
param notificationEmailServiceScope string = ''

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: identityType // Use the parameterized identity type
  }
  properties: {
    globalParameters: {
      httpsUrlForEmail: {
        type: 'String'
        value: httpsUrlForEmail
      }
      inboundAzureStorageContainer: {
        type: 'String'
        value: inboundAzureStorageContainer
      }
      outboundAzureStorageBlobContainer: {
        type: 'String'
        value: outboundAzureStorageBlobContainer
      }
      errorAzureStorageBlobContainer: {
        type: 'String'
        value: errorAzureStorageBlobContainer
      }
      retriggerAzureStorageBlobContainer: {
        type: 'String'
        value: retriggerAzureStorageBlobContainer
      }
      environment: {
        type: 'String'
        value: environment
      }
      httpUrlForToken: {
        type: 'String'
        value: httpUrlForToken
      }
      fromEmailAddress: {
        type: 'String'
        value: fromEmailAddress
      }
      notificationEmailServiceClientId: {
        type: 'String'
        value: notificationEmailServiceClientId
      }
      notificationEmailServiceScope: {
        type: 'String'
        value: notificationEmailServiceScope
      }
    }
  }
}

output dataFactoryId string = dataFactory.id
