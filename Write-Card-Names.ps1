[CmdletBinding()]
param(
  [Parameter(Position = 0)]
  [string]$Cards
)

# Usage:
#
# $anr | .\Write-Card-Names.ps1
#
# 


function Munge-Title {
    param([string]$title)

    return $title.Trim()  -replace '"([^"]*)"', '“$1”'
}

$Cards  |  ForEach-Object { Munge-Title $_.title }  |  Sort-Object -Unique  |  Out-File  -Encoding UTF8  -FilePath .\card-names.txt   ;   Get-Content -Raw  -Encoding UTF8  .\card-names.txt