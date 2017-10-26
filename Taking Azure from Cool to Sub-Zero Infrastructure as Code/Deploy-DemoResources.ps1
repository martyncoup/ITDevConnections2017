# Login to Azure
Login-AzureRmAccount

##############################################################################################
##############################################################################################

# Create a virtual network
New-AzureRmResourceGroupDeployment -Name "NewVirtualNetwork" `
-ResourceGroupName "ITDevConnections" `
-TemplateUri "https://raw.githubusercontent.com/martyncoup/ITDevConnections2017/master/Taking%20Azure%20from%20Cool%20to%20Sub-Zero%20Infrastructure%20as%20Code/JSON/network/azuredeploy.json" `
-virtualNetworkName "SomeVNetName" `
-Verbose

##############################################################################################
##############################################################################################

# Lock the resource
New-AzureRmResourceGroupDeployment -Name "LockVirtualNetwork" `
-ResourceGroupName "ITDevConnections" `
-TemplateFile "https://raw.githubusercontent.com/martyncoup/ITDevConnections2017/master/Taking%20Azure%20from%20Cool%20to%20Sub-Zero%20Infrastructure%20as%20Code/JSON/lock/azuredeploy.json" `
-lockedResource "SomeVNetName" `
-Verbose

##############################################################################################
##############################################################################################

# Policy to lock regions
$Region = New-AzureRmPolicyDefinition -Name RegionLockPolicy -Description "Policy to allow resource creation only in certain regions" -Policy `
'{  
    "if" : {
      "not" : {
        "field" : "location",
        "in" : ["westcentralus"]
      }
    },
    "then" : {
      "effect" : "deny"
    }
}'
New-AzureRmPolicyAssignment -Name RegionLockPolicy -PolicyDefinition $Region -Scope /subscriptions/56011a11-fa15-4218-8b23-57ee0f1f3f07/resourceGroups/ITDevConnections
New-AzureRmStorageAccount -Name "itdev3hk2hk23" -ResourceGroupName "ITDevConnections" -Type Standard_LRS -Location westeurope

##############################################################################################
##############################################################################################

# Apply missing tag
$Tag = New-AzureRmPolicyDefinition -Name CostCenterTag -Description "Policy to apply the cost center tag" -Policy `
'{
    "if": {
        "field": "tags.CostCenter",
        "exists": "false"
    },
    "then": {
        "effect": "append",
        "details": [
            {
                "field": "tags.CostCenter",
                "value": "HR"
            }
        ]
    }
}'
New-AzureRmPolicyAssignment -Name CostCenterTag -PolicyDefinition $Tag -Scope /subscriptions/56011a11-fa15-4218-8b23-57ee0f1f3f07/resourceGroups/ITDevConnections
New-AzureRmStorageAccount -Name "itdev3hk2hk24" -ResourceGroupName "ITDevConnections" -Type Standard_LRS -Location westcentralus

##############################################################################################
##############################################################################################

# Create VM with resources
New-AzureRmResourceGroupDeployment -Name "CreateVirtualMachine" `
-ResourceGroupName "ITDevConnections" `
-TemplateUri "https://raw.githubusercontent.com/martyncoup/ITDevConnections2017/master/Taking%20Azure%20from%20Cool%20to%20Sub-Zero%20Infrastructure%20as%20Code/JSON/vm/azuredeploy.json" `
-adminUsername "ITDev" `
-adminPassword (ConvertTo-SecureString "PaSSw0rd" -AsPlainText -Force) `
-dnsLabelPrefix "itdev001" `
-windowsOSVersion "2016-Datacenter" `
-Verbose

##############################################################################################
##############################################################################################