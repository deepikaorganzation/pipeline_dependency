param appServicePlans array
param aseName string
param aseResourceGroup string

resource ase 'Microsoft.Web/hostingEnvironments@2021-02-01' existing = {
  name: appServicePlans[0].aseName
  scope: resourceGroup(appServicePlans[0].aseResourceGroup)
}

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = [for appServicePlan in appServicePlans: {
  name: appServicePlan.appServicePlanName
  location: appServicePlan.location
  tags: appServicePlan.tags
  
  sku: {
    name: appServicePlan.sku.name
    tier: appServicePlan.sku.tier
    family: appServicePlan.sku.family
    capacity: appServicePlan.sku.capacity
  }
  
  properties: {
    targetWorkerCount: appServicePlan.targetWorkerCount
    perSiteScaling: appServicePlan.perSiteScaling
    elasticScaleEnabled: appServicePlan.elasticScaleEnabled
    zoneRedundant: appServicePlan.zoneRedundant
    hostingEnvironmentProfile: ase
  }
}]
