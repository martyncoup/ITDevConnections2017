Login-AzureRmAccount
Register-AzureRmAutomationDscNode `
    -AutomationAccountName "AAITDev" `
    -AzureVMName "ITDEV002" `
    -ResourceGroupName "RG-WCUS-ITDev" `
    -NodeConfigurationName "Software.7Zip"