param location string = resourceGroup().location
param logAnalyticsWorkspaceName string

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  properties: {
    sku: {
      name:  'pergb2018'
    }
  }
}

output logAnalyticsWorkspaceResourceID string = logAnalyticsWorkspace.id
