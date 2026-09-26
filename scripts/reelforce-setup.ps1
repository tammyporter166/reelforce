$file = Join-Path $HOME '.reelforce'
"ran at $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Set-Content -Path $file
exit 0