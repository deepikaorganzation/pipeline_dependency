param serviceBusName string
param queues array
param location string = resourceGroup().location
param topics object
param tags object = {
  Application: 'API'
  Company: 'KMC'
}

// Create Service Bus Namespace (if required, uncomment the block below)
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
resource serviceBusQueue 'Microsoft.ServiceBus/namespaces/queues@2024-01-01' = [for queue in queues: {
  name: '${serviceBusName}/${queue.name}'
  properties: queue.properties
}]

var filteredTopics = [for topic in items(topics): topic.value]
var flattenedSubscriptions = [for sub in filteredTopics: sub.subscriptions]
// Create Topics
resource topicResources 'Microsoft.ServiceBus/namespaces/topics@2021-11-01' = [for topic in filteredTopics: {
  name: '${serviceBusName}/${topic.name}'
  properties: topic.properties
}]

// Create Subscriptions for each Topic
resource subscriptionResources 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2021-11-01' = [for sub in flattenedSubscriptions :{
  name: '${serviceBusName}/${sub.topic.name}/${sub.subscriptionName}'
  dependsOn: [
    topicResources
  ]
}]
