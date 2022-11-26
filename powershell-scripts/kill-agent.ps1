$process = Get-Process -Name "ssh-agent"
Stop-Process -Id $process.Id -Force