Login-AzureRmAccount
Register-AzureRmAutomationDscNode `
    -AutomationAccountName "AAITDev" `
    -AzureVMName "ITDEV001" `
    -ResourceGroupName "RG-WCUS-ITDev" `
    -NodeConfigurationName "Features.WebServer"