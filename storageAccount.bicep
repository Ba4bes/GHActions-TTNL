param location string = resourceGroup().location

@maxLength(10)
param storageAccountPrefix string

var storageAccountName = toLower('${storageAccountPrefix}${uniqueString(subscription().id)}')

resource sta 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
