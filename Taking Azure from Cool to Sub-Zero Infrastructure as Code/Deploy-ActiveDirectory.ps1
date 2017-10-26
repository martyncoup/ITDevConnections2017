# Login to Azure
Login-AzureRmAccount

##############################################################################################
##############################################################################################

New-AzureRmResourceGroupDeployment -Name "BuildActiveDirectory" `
-ResourceGroupName "" `
-TemplateUri "https://raw.githubusercontent.com/martyncoup/ITDevConnections2017/master/Taking%20Azure%20from%20Cool%20to%20Sub-Zero%20Infrastructure%20as%20Code/DomainController/azuredeploy.json" `
-adminUsername "" `
-adminPassword (ConvertTo-SecureString "" -AsPlainText -Force) `
-domainName "" `
-dnsPrefix "" `
-Verbose