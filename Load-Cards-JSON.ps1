param (
  [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
  [ValidateScript({  (Test-Path $_  -PathType Leaf)  -and  ([System.IO.Path]::GetExtension($_)  -eq '.json') })]
  [System.IO.FileInfo]$File = '.\cards.json'
)
# Usage:
#
# $anr = (.\Load-Cards-JSON.ps1 .\cards.json).cards
# $onr = (.\Load-Cards-JSON.ps1 .\onr-cards.json)
#
# $onr | ? kind -eq "resource"
# $onr | ? name -like "*Mole*"
# $onr | Where-Object {  ($_.subtypes -contains "Hidden")  -and  ($_.text -match '\[trash\]:')  }
#
# [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
# $anr  |  Where-Object {  $_.card_type_id -cne "runner_identity"  -and  $_.card_type_id -cne "corp_identity"  -and  (New-Object System.Globalization.StringInfo($_.title)).LengthInTextElements -ge 25  }  |  Sort-Object -Descending  -Property { $_.title }, title
# 
#   Janaína “JK” Dumont Kindelán
#   …
# 
# $anr  |  
# 
# $anr  |  
# 
# $anr  |  
#

(Get-Content -Raw  -Path $File  |  ConvertFrom-Json)

