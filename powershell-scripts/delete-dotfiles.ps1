Get-ChildItem -Path "$env:USERPROFILE\.iffiles\autohotkey-library\" | foreach { Remove-Item "$env:USERPROFILE\Documents\AutoHotKey\Lib\$($_.Name)" }
Get-ChildItem -Path "$env:USERPROFILE\.iffiles\autohotkey-scripts\" | foreach { Remove-Item "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\$($_.Name)" }
Get-ChildItem -Path "$env:USERPROFILE\.iffiles\gitbash\*" | foreach { Remove-Item "$env:USERPROFILE\$($_.Name)" }
Get-ChildItem -Path "$env:USERPROFILE\.iffiles\personal-git\*" | foreach {  Remove-Item "$env:USERPROFILE\$($_.Name)" }
Get-ChildItem -Path "$env:USERPROFILE\.iffiles\powershell-profile\*" | foreach { Remove-Item "$env:USERPROFILE\Documents\WindowsPowerShell\$($_.Name)" }
Get-ChildItem -Path "$env:USERPROFILE\.iffiles\vscode\" | foreach { Remove-Item "$env:USERPROFILE\AppData\Roaming\Code\User\$($_.Name)" }