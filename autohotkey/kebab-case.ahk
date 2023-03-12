; Script name: kebab-case.ahk
; Description: Convert highlighted space delimited words to hyphen delimited (kebab case)
;              with alt + -
; GitHub: https://github.com/ifcodesdotnet/.iffiles
; Contributors: Ismael Fernandez
; References:
;   https://superuser.com/questions/86392/how-to-replace-spaces-with-dashes
;     Link to where I found this script

!-::
save := ClipboardAll
Send ^c
clipwait
oldclip := Clipboard
StringReplace, clipboard, oldclip, %A_SPACE%, -, All
Send ^v
Clipboard := save
oldclip =
return