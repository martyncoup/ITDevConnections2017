Login-AzureRmAccount
New-AzureRmResourceGroupDeployment -Name "DeployAADsc" `
    -ResourceGroupName "RG-WCUS-ITDev" `
    -TemplateUri "https://raw.githubusercontent.com/martyncoup/ITDevConnections2017/master/Deep%20Dive%20into%20PowerShell%20Desired%20State%20Configuration%20with%20Microsoft%20Azure/JSON/AzureAutomationDsc.json" `
    -vmName "ITDEV002" `
    -registrationKey (ConvertTo-SecureString "E0VW6H9G/arqvJCX1wXaSWrbrHNyRT5R/vbjM4g2V7uggyY0rFlYK13JDYxMvHvrG15Y23rNrHK3Rw9NODsm6Q==" -AsPlainText -Force) `
    -registrationUrl "https://wcus-agentservice-prod-1.azure-automation.net/accounts/f64dda60-a7ca-4878-ab7a-41b103818498" `
    -nodeConfigurationName "Features.WebServer" `
    -timestamp (Get-Date -Format "MM/dd/yyyy H:mm:ss tt")