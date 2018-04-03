# malz_analysis_scripts

# Random scripts I've made while doing malware analysis.


Garbage, hacked together scripts that I've written to help do malware analysis. I make no guarantees these will work on your system! Use at your own risk! Feel free to use these however you see fit!




## Scripts and Usages

rewritten_iex.ps1

This is a little rewrite of the native PowerShell cmdlet Invoke-Expression. This will override IEX to not only run the scriptblock, but also log the deobfuscated scriptblock that is executed to the users TMP folder. Filename format is: ps_deob_ + currenttimestamp + .txt

This comes in handy when PowerShell logging is not enabled. It *may* also help if the malware attempts to evade ScriptBlock logging. **Please note, this claim is NOT tested. It MAY or MAY NOT actually help in that situation.**

I created a Cuckoo module for this functionality, but noticed a pull request was submitted that used native PowerShell ScriptBlock Logging. For more information on the module, please see: https://github.com/cuckoosandbox/cuckoo/pull/2042 

Sources:
https://www.fireeye.com/blog/threat-research/2016/02/greater_visibilityt.html
https://cobbr.io/ScriptBlock-Logging-Bypass.html


create_powershell_profile.ps1

This script will write rewritten_iex.ps1 to the USERPROFILE so that the IEX cmdlet is permanently overwritten. Just run the script and PowerShell will use the overwritten IEX by default.
