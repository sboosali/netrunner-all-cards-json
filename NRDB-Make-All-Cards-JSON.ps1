
# Usage:
#   > .\nrdb-make-all-cards-json.ps1
#
#   > [Math]::Round((Get-Item .\cards.json).Length / 1MB, 1)
#     2.3
#
#   > $Cards = (Get-Content -Raw -Path .\cards.json | ConvertFrom-Json).cards
#
#   > $Cards.Count
#     2054
#
#   > $Cards  |  ? { $_.stripped_title -eq "Bran 1.0" }
#     …
#
#   > $Cards  |  Get-Random  |  Select-Object title, cost, card_type_id, faction_id, strength, subtypes, text  |  Format-Table -AutoSize -Wrap
#     …
#
#   > $Cards | Out-GridView
#     …
#

<#
{
"card_type_id": "ice",
"cost": 6,
"deck_limit": 3,
"designed_by": "null_signal_games",
"faction_id": "haas_bioroid",
"id": "bran_1_0",
"influence_cost": 2,
"is_unique": false,
"side_id": "corp",
"strength": 6,
"stripped_text": "Lose click: Break 1 subroutine on this ice. Only the Runner can use this ability. Subroutine You may install 1 piece of ice from HQ or Archives directly inward from this ice, ignoring all costs. Subroutine End the run. Subroutine End the run.",
"stripped_title": "Bran 1.0",
"subtypes": ["barrier", "bioroid"],
"text": "<strong>Lose [click]:</strong> Break 1 subroutine on this ice. Only the Runner can use this ability.\n[subroutine] You may install 1 piece of ice from HQ or Archives directly inward from this ice, ignoring all costs.\n[subroutine] End the run.\n[subroutine] End the run.",
"title": "Brân 1.0"
}
#>

$Files = Get-ChildItem -File  -Path .\cards  -Filter "*.json"
#  |  Select-Object -First 100

$Cards = foreach ($File in $Files) {

    Get-Content -Path $File.FullName -Raw  |  ConvertFrom-Json

    #TODO or make each ID into a key, to store as an object and not an array?
}

@{ cards = $Cards }  |  ConvertTo-Json  -Depth 100  |  Set-Content -Path .\cards.json

Write-Host -ForegroundColor Green "$($Cards.Count)"
