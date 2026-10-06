param (

 [Parameter(Position = 0, Mandatory = $true)]
 [ValidatePattern('^\d{5}$')]
 [string]$code,

 [ValidateSet("small", "large", "xlarge")]
 [string]$size = "large"

)

# Usage:
#
# > .\NRDB-Fetch-Image.ps1 36005
#
#   Invoke-WebRequest -UseBasicParsing  -Uri "https://card-images.netrunnerdb.com/v2/large/36005.jpg"  -OutFile 36005.jpg
#
# > .\NRDB-Fetch-Image.ps1 36005 -size xlarge
#
#   Invoke-WebRequest -UseBasicParsing  -Uri "https://card-images.netrunnerdb.com/v2/xlarge/36005.webp"  -OutFile 36005.webp
#
# > $sets = 1..13 + 21,22,23 + 26,30 + 33..36
# 
# # Magnum Opus:
# > 23001,23011,23013,23027,23045,23054,23100  |  % {  .\nrdb-fetch-image.ps1 $_  ;  Start-Sleep -Seconds 10  }
#
# # Core:
# > $set = "01"  ;  1..113 | ForEach-Object { $card = "{0:d3}" -f $_  ;  .\NRDB-Fetch-Image.ps1 $set$card  ;  Start-Sleep -Seconds 10 }
#
# 

$ext = if ($size -eq "xlarge") { "webp" } else { "jpg" }

$url = "https://card-images.netrunnerdb.com/v2/$($size)/$($code).$($ext)"

$file = Join-Path $size ($url.Split('/')[-1])

# 

New-Item -Force  -ItemType Directory  -Path $size

Write-Host $file  -NoNewline -ForegroundColor yellow
Write-Host "  <-  " $url  -ForegroundColor white

Invoke-WebRequest -UseBasicParsing  -ErrorAction Stop  -Uri $url  -OutFile $file

if ($?  -and  $size -eq "xlarge") {

    magick $file $($file -replace '\.webp$', '.jpg')

}

# NB. this file is encoded in "UTF-8 with BOM", for Powershell 5.
