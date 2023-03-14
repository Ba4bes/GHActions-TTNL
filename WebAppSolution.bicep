param location string = resourceGroup().location
param webappName string
param serverFarmName string

param workspaceResourceId string

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webappName
  location: location
  properties: {
    serverFarmId: serverFarm.id
    siteConfig: {

      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: insights.properties.InstrumentationKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: insights.properties.ConnectionString
        }
      ]
    }
  }
}

resource serverFarm 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: serverFarmName
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
  }
}

resource insights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'insights-${webappName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspaceResourceId
    IngestionMode: 'LogAnalytics'
  }
}
