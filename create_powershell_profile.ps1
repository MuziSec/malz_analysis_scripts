New-Item -path $profile -type file –force

$Line1='function Invoke-Expression()'
$Line2='    {'
$Line3='        param('
$Line4='            [Parameter('
$Line5='                Mandatory=$True,'
$Line6='                Valuefrompipeline = $True)]'
$Line7='            [String]$Command'
$Line8='        )'
$Line9='        $scriptblock = [scriptblock]::Create("$Command");'
$Line10='        Invoke-Command -ScriptBlock $scriptblock'
$Line11='        $ts = Get-Date -Format o | foreach {$_ -replace ":", "."}'
$Line12='        $f = "${env:TMP}" + "\" + "ps_deob_" + "$ts" + ".txt"'
$Line13='        $scriptblock | Out-File -LiteralPath $f'
$Line14='   }'


$filepath="$env:USERPROFILE" + "\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

$Line1 | Out-File -LiteralPath $filepath
Add-Content $filepath $Line2
Add-Content $filepath $Line3
Add-Content $filepath $Line4
Add-Content $filepath $Line5
Add-Content $filepath $Line6
Add-Content $filepath $Line7
Add-Content $filepath $Line8
Add-Content $filepath $Line9
Add-Content $filepath $Line10
Add-Content $filepath $Line11
Add-Content $filepath $Line12
Add-Content $filepath $Line13
Add-Content $filepath $Line14
