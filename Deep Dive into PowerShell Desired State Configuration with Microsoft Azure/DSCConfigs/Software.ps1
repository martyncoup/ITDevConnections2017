Configuration Software
{
    param(
        [Parameter(Mandatory=$true)]
        [string] $NodeName
    )

    Node $NodeName
    {
        Package Install7Zip
        {
            Ensure = 'Present'
            Name = '7-Zip 17.01 (x64 edition)'
            Path = 'C:\7z1701-x64.msi'
            ProductId = '23170F69-40C1-2702-1701-000001000000'
        }
    }
 }