; Script name: open-iffiles.ahk
; Description: Open my .dotfiles repository is vscode using Super / Windows key + Shift + c.
; GitHub: https://github.com/ifcodesdotnet/.iffiles
; Contributors: Ismael Fernandez
; References:
;   https://www.autohotkey.com/boards/viewtopic.php?style=1&t=96638
;     Link where I found the command to open vscode from autohotkey

#+c::

If !FileExist(code := StrReplace(A_AppData, "Roaming", "Local\Programs\Microsoft VS Code\Code.exe"))
 MsgBox, 48, Error, File not found.`n`n%code%
^!h::Run, %code% "C:\Users\%A_UserName%\.iffiles"