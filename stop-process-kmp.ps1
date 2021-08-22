$p = Get-Process -Name "KMPlayer64"
Stop-Process -InputObject $p
Get-Process | Where-Object {$_.HasExited}