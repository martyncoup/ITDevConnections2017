$Uri = "https://s2events.azure-automation.net/webhooks?token=rPWRTfTWJSmgnJmNgYLdqXhoajUuxeEsmnKdzGWbA%3d"
$Header = @{
    Key = 'ITDev2017'
}
$Body = '{
    "webhookName": "Manage-VmPowerState",
    "myCustomParam": "blah",
    "RequestBody":
    [
        {
            "id": "/subscriptions/c469e3cc-dc46-467b-b046-3d1f3a643efd/resourceGroups/RG-EUW-Lab/providers/Microsoft.Compute/virtualMachines/EUW-2012R",
            "action": "stop",
            "order": "1"
        }
    ]
}'

Invoke-WebRequest -Method Post -Uri $Uri -Headers $Header -Body $Body -UseBasicParsing