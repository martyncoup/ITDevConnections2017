workflow Do-VmUnitTest
{
    param(
        [Parameter(Mandatory = $true)]
        [Object]$WebhookData
    )

    if ($WebhookData -ne $null)
    {
        function Get-StringHash([String]$String, $HashName = "MD5") { 
            $StringBuilder = New-Object System.Text.StringBuilder 
            [System.Security.Cryptography.HashAlgorithm]::Create($HashName).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($String))| ForEach-Object { 
                [Void]$StringBuilder.Append($_.ToString("x2")) 
            } 
            $StringBuilder.ToString() 
        }

        # Get the properties of the Webhookdata input
        $RawHeader = $WebhookData.RequestHeader
        $RawBody = $WebhookData.RequestBody

        # Generate hash for comparison
        $Key = Get-StringHash -String $RawHeader.Key
        $Value = Get-AutomationVariable -Name "SecurityKey"

        # Convert to JSON
        $Body = ConvertFrom-Json $RawBody

        # Validate the key
        if ($Key -eq $Value)
        {
            # Perform actions
        } else {
            Write-Error "$Key does not match the stored secure value."
        }
    } else {
        throw "Runbook must be started from Webhook. WebhookData cannot be null."
    }
}