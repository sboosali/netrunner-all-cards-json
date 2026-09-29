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

$ext = if ($size -eq "xlarge") { "webp" } else { "jpg" }

$url = "https://card-images.netrunnerdb.com/v2/$($size)/$($code).$($ext)"

$file = Join-Path $size ($url.Split('/')[-1])

# 

New-Item -Force  -ItemType Directory  -Path $size

Write-Host $file  -NoNewline -ForegroundColor yellow
Write-Host "  <-  " $url  -ForegroundColor white

Invoke-WebRequest -UseBasicParsing  -Uri $url  -OutFile $file

if ($?  -and  $size -eq "xlarge") {

    magick $file $($file -replace '\.webp$', '.jpg')

}

# 
