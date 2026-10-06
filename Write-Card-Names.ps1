

# Usage:
#
# .\Write-Card-Names.ps1
#
# 

# "..." -> “...”

function Munge-Title {
    param([string]$title)

    return $title.Trim().ToLower()  -replace '"([^"]*)"', '`u{201C}$1`u{201D}'
}

$anr  |  ForEach-Object { Munge-Title $_.title }  |  Sort-Object -Unique  |  Out-File  -Encoding UTF8  -FilePath .\card-names.txt

Get-Content -Encoding UTF8  .\card-names.txt

