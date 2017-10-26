Login-AzureRmAccount
New-AzureRmResourceGroupDeployment -Name "DeployAADsc" `
    -ResourceGroupName "RG-WCUS-ITDev" `
    -TemplateUri "https://raw.githubusercontent.com/martyncoup/ITDevConnections2017/master/Deep%20Dive%20into%20PowerShell%20Desired%20State%20Configuration%20with%20Microsoft%20Azure/JSON/AzureAutomationDsc.json" `
    -vmName "ITDEV002" `
    -registrationKey (ConvertTo-SecureString "3cyR8q2pb2AUgldggoqReP4bcnnkNvxICzPhL+/nWcpSQhdbeTCT+23ZQAWvNOQZjTNvJk+5B851uO64+mSpnQ==" -AsPlainText -Force) `
    -registrationUrl "https://wcus-agentservice-prod-1.azure-automation.net/accounts/a8b8ee9c-44ba-4c63-b414-db4deec92410" `
    -nodeConfigurationName "Software.InstallApplication" `
    -timestamp (Get-Date -Format "MM/dd/yyyy H:mm:ss tt")