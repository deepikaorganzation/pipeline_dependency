param serviceBusName string
param queues array
param location string = resourceGroup().location
param topics array
param subscriptions array

param tags object = {
  Application: 'API'
  Company: 'KMC'
}

// Create Service Bus Namespace
resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2024-01-01' = {
  name: serviceBusName
  location: location
  sku: {
    name: 'Premium'
    tier: 'Premium'
    capacity: 1
  }
  tags: tags
}

// Create Service Bus Queue
resource serviceBusQueue 'Microsoft.ServiceBus/namespaces/queues@2024-01-01' = [ for queue in queues: {
  parent: serviceBusNamespace
  name: queue
  properties: {
    lockDuration: 'PT5M'
    maxSizeInMegabytes: 1024
    requiresDuplicateDetection: false
    requiresSession: false
    defaultMessageTimeToLive: 'P10675199DT2H48M5.4775807S'
    deadLetteringOnMessageExpiration: true
    duplicateDetectionHistoryTimeWindow: 'PT10M'
    maxDeliveryCount: 3
    autoDeleteOnIdle: 'P10675199DT2H48M5.4775807S'
    enablePartitioning: false
    enableExpress: false
}
}]

// Create Topics
resource mytopicResource 'Microsoft.ServiceBus/namespaces/topics@2024-01-01' = [for topic in topics: {
  parent: serviceBusNamespace
  name: topic
  properties: {
    // Add topic-specific properties here if needed
  }
}]

// Create Subscriptions
resource subscriptionResource 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2024-01-01' = [for sub in subscriptions: {
  parent: mytopicResource[sub.topicName]
  name: '${sub.name}'
  properties: {
    // Add subscription-specific properties if needed
  }
}]
