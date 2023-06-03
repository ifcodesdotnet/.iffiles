; Script Name: vscode.ahk
; Description: AutoHotkey hotkey for opening vscode in my .dotfiles directory with Windows+Shift+c
; GitHub Repository: https://github.com/ifcodesdotnet/.iffiles
; References:
;   https://stackoverflow.com/questions/30263459/visual-studio-code-install-location
;     Link to thread about what the default vscode installation path is on windows
;
;   https://www.autohotkey.com/docs/v2/Variables.htm#os
;     Link to documentation about operating system and user info variables

#+c::
{
    vscode_absolute_path := StrReplace(A_AppData, "Roaming", "Local\Programs\Microsoft VS Code\Code.exe")

    Run, %vscode_absolute_path% "C:\Users\%A_UserName%\.iffiles"
}