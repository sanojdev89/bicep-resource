// Resource Group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'MyResourceGroup'
  location: 'East US'
}

// Virtual Network
resource vnet 'Microsoft.Network/virtualNetworks@2021-03-01' = {
  name: 'MyVNet'
  location: rg.location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}

// Subnet
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-03-01' = {
  name: 'MySubnet'
  parent: vnet
  properties: {
    addressPrefix: '10.0.1.0/24'
  }
}

// Route Table
resource routeTable 'Microsoft.Network/routeTables@2021-03-01' = {
  name: 'MyRouteTable'
  location: rg.location
  properties: {}
}

// Associate Route Table with Subnet
resource routeTableAssociation 'Microsoft.Network/virtualNetworks/subnets@2021-03-01' = {
  name: 'MySubnet'
  parent: vnet
  properties: {
    routeTable: {
      id: routeTable.id
    }
  }
}
