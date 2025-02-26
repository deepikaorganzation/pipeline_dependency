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
  name: queue.name
  properties: {}
}]




resource mytopicResource 'Microsoft.ServiceBus/namespaces/topics@2024-01-01' = [for topic in topics: {
  parent: serviceBusNamespace
  name: topic.name
  properties: {
    // Add topic-specific properties here if needed
  }
}]

resource subscriptionResource 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2024-01-01' = [for sub in subscriptions: {
  name: '${serviceBusNamespace.name}/${sub.topicName}/${sub.name}'
  properties: {
    // Add subscription-specific properties if needed
  }
}]


