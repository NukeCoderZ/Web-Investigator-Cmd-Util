$targetDomain = Read-Host -Prompt "Enter Targeted Website"
if ($targetDomain -match "[\/]") {
    Write-Host "Syntax error:Remove trailing data and HTTP(S) header" -ForegroundColor Red -BackgroundColor Black
    } else {

    if ($targetDomain -match "[a-zA-Z]") {
        $targetIP = Resolve-DnsName $targetDomain | ForEach-Object IP4Address | Select-Object -First 1
        Invoke-RestMethod "https://ipinfo.io/$targetIP"
        } else {
Invoke-RestMethod "https://ipinfo.io/$targetDomain" }}