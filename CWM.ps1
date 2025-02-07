$targetDomain = Read-Host -Prompt "Enter Targeted Website"
$targetIP = Resolve-DnsName $targetDomain | ForEach-Object IP4Address | Select-Object -First 1
Invoke-RestMethod "https://ipinfo.io/$targetIP"