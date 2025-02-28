param environment string = 'DEV' // Environment parameter
param region string = 'eastus' // Region parameter
param applicationInsightsName string // Application Insights Name
param workspaceResourceId string // Log Analytics Workspace Resource ID
param retentionInDays int = 90 // Retention in days, default to 90

resource appInsights 'microsoft.insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: region
  kind: 'web'
  tags: {
    Company: 'KAC'
    Environment: environment
    Project: 'Komatsu Experience (KX)'
  }
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaAIExtension'

    RetentionInDays: retentionInDays
    WorkspaceResourceId: workspaceResourceId
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

output appInsightsNameOutput string = appInsights.name
output appInsightsUri string = 'https://${appInsights.name}.dev.azuresynapse.net'
