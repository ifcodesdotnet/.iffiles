; Script Name: vscode.ahk
; Description: AutoHotkey hotkey for opening vscode in my .dotfiles directory with Windows+Shift+c
; GitHub Repository: https://github.com/ifcodesdotnet/.iffiles
; References:
;   https://stackoverflow.com/questions/30263459/visual-studio-code-install-location
;     Link to thread about what the default vscode installation path is on windows
;
;   https://www.autohotkey.com/docs/v2/Variables.htm#os
;     Link to documentation about operating system and user info variables
;
;   https://stackoverflow.com/questions/66432537/how-to-use-multiple-paramenter-in-run-command-in-autohotkey-v2
;      Link to post about how to use the run command in ahk v2

#Requires AutoHotkey v2.0
#SingleInstance

#+c::
{

    VscodePath := "C:\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"

    DotfilesPath := "C:\Users\" . A_UserName . "\.iffiles"

    Run VscodePath . " " . DotfilesPath
}