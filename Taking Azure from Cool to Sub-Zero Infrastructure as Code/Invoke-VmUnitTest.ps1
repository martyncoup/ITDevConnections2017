$Uri = "https://s2events.azure-automation.net/webhooks?token=rPWRTfTWJSmgnJmNgYLdqXhoajUuxeEsmnKdzGWbA%3d"
$Header = @{
    Key = 'ITDev2017'
}
$Body = '{
    "webhookName": "Do-VmUnitTest",
    "myCustomParam": "blah",
    "RequestBody":
    [
        {
            "order": "1"
        }
    ]
}'

Invoke-WebRequest -Method Post -Uri $Uri -Headers $Header -Body $Body -UseBasicParsing