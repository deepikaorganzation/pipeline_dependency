param serviceBusNamespaceName string
param serviceBusQueueName string
param serviceBusTopicName string
param serviceBusSubscriptionName string
param location string = resourceGroup().location

// Create Service Bus Namespace
resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2024-01-01' = {
  name: serviceBusNamespaceName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

// Create Service Bus Queue
resource serviceBusQueue 'Microsoft.ServiceBus/namespaces/queues@2024-01-01' = {
  parent: serviceBusNamespace
  name: serviceBusQueueName
  properties: {}
}

// Create Service Bus Topic
resource serviceBusTopic 'Microsoft.ServiceBus/namespaces/topics@2024-01-01' = {
  parent: serviceBusNamespace
  name: serviceBusTopicName
  properties: {}
}

// Create Service Bus Subscription
resource serviceBusSubscription 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2024-01-01' = {
  parent: serviceBusTopic
  name: serviceBusSubscriptionName
  properties: {}
}


