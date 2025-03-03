param appServicePlanName string = 'kom-kx1-eus-dev-sp'
param location string = 'East US'
param capacity int = 1
param skuName string = 'S1'
param skuTier string = 'Standard'
param skuFamily string = 'S'
param targetWorkerCount int = 2
param perSiteScaling bool = false
param elasticScaleEnabled bool = false
param zoneRedundant bool = false
param tags object = {
  Company: 'KAC'
  Environment: 'DEV'
  Project: 'Komatsu Experience (KX)'
}

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanName
  location: location
  tags: tags
  sku: {
    name: skuName
    tier: skuTier
    family: skuFamily
    capacity: capacity
  }
  properties: {
    targetWorkerCount: targetWorkerCount
    perSiteScaling: perSiteScaling
    elasticScaleEnabled: elasticScaleEnabled
    zoneRedundant: zoneRedundant
  }
}
