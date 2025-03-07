param applicationInsights array
resource appInsights 'microsoft.insights/components@2020-02-02' = [for ai in applicationInsights: {
  name: ai.applicationInsightsName
  location: ai.region
  kind: ai.kind
  tags: ai.tags
  properties: {
    Application_Type: ai.Application_Type
    Flow_Type: ai.Flow_Type
    Request_Source: ai.Request_Source
    RetentionInDays: ai.retentionInDays
    WorkspaceResourceId: ai.workspaceResourceId
    IngestionMode: ai.IngestionMode
    publicNetworkAccessForIngestion: ai.publicNetworkAccessForIngestion
    publicNetworkAccessForQuery: ai.publicNetworkAccessForQuery
  }
}]

