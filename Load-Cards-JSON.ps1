param (
  [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
  [ValidateScript({  (Test-Path $_  -PathType Leaf)  -and  ([System.IO.Path]::GetExtension($_)  -eq '.json') })]
  [System.IO.FileInfo]$File = '.\cards.json'
)
# Usage:
#
# [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
# [Console]::InputEncoding  = [System.Text.Encoding]::UTF8
# $OutputEncoding           = [System.Text.Encoding]::UTF8
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
# @(  $anr  |  ForEach-Object { $_.title.Trim() }  )  |  Sort-Object -Unique  |  Out-File  -Encoding UTF8  -FilePath .\card-names.txt   ;   Get-Content -Raw  -Encoding UTF8  .\card-names.txt  |  more
#
#   "Clones Are Not People"
#   …
#   15 Minutes
#   …
# 
# $anr  |  
# 
# $anr  |  
#

(Get-Content -Raw  -Encoding UTF8  -Path $File  |  ConvertFrom-Json)

