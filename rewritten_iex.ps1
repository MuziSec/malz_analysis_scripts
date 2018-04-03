function Invoke-Expression()
    {

        param(
            [Parameter(
                Mandatory=$True,
                Valuefrompipeline = $True)]
            [String]$Command
        )
        $scriptblock = [scriptblock]::Create("$Command");
        Invoke-Command -ScriptBlock $scriptblock
        $ts = Get-Date -Format o | foreach {$_ -replace ":", "."}
        $f = "${env:TMP}" + "\" + "ps_deob_" + "$ts" + ".txt" 
        $scriptblock | Out-File -LiteralPath $f
        
    }
