param serviceBusName string
param queues array
param location string = resourceGroup().location
param topics array
param subscriptions array
param supportOrdering bool = false

param tags object = {
  Application: 'API'
  Company: 'KMC'
}

// Create Service Bus Namespace
// resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2024-01-01' = {
//   name: serviceBusName
//   location: location
//   sku: {
//     name: 'Premium'
//     tier: 'Premium'
//     capacity: 1
//   }
//   tags: tags
// }

// Create Service Bus Queue
resource serviceBusQueue 'Microsoft.ServiceBus/namespaces/queues@2024-01-01' = [ for queue in queues: {
  name: '${serviceBusName}/${queue}'
  properties: {
    lockDuration: 'PT5M'
    maxSizeInMegabytes: 1024
    requiresDuplicateDetection: false
    requiresSession: false
    defaultMessageTimeToLive: 'P10675199DT2H48M5.4775807S'
    deadLetteringOnMessageExpiration: true
    duplicateDetectionHistoryTimeWindow: 'PT10M'
    maxDeliveryCount: 3
    //autoDeleteOnIdle: 'P10675199DT2H48M5.4775807S'
    enablePartitioning: false
    enableExpress: false
}
}]

// Create Topics
// resource topicResource 'Microsoft.ServiceBus/namespaces/topics@2024-01-01' =  {

//   name: '${serviceBusName}/${topics}'
//   properties: {
//     defaultMessageTimeToLive: 'P14D'
//     maxMessageSizeInKilobytes: 1024
//     maxSizeInMegabytes: 1024
//     duplicateDetectionHistoryTimeWindow: 'PT10M'
//     supportOrdering: supportOrdering
//     enableBatchedOperations: true
//     autoDeleteOnIdle: 'P10675199DT2H48M5.4775807S'
//     // Add any topic-specific properties if needed
//   }
// }
resource topicResources 'Microsoft.ServiceBus/namespaces/topics@2021-11-01' = [for topic in topics: {
  name: '${serviceBusName}/${topic}'
    properties: {
    defaultMessageTimeToLive: 'P14D'
    maxMessageSizeInKilobytes: 256
    maxSizeInMegabytes: 1024
    duplicateDetectionHistoryTimeWindow: 'PT10M'
    supportOrdering: supportOrdering
    enableBatchedOperations: true
    autoDeleteOnIdle: 'P10675199DT2H48M5.4775807S'
    // Add any topic-specific properties if needed
  }
}]

// Create Subscriptions for each Topic
resource subscriptionResources 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2021-11-01' = [for (topic,idx) in topics:  {
  name: '${serviceBusName}/${topic}/${subscriptions[idx]}'
  dependsOn: [
    topicResources
  ]
}]
