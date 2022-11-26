; Script Name: quit.ahk
; Description: AutoHotkey hotkey for closing an active window by remapping
;              Alt+F4 to Windows+Shift+q
; GitHub Repository: https://github.com/ifcodesdotnet/.iffiles
; References:
;   https://www.autohotkey.com/docs/v2/Hotkeys.htm
;     Link to hotkey documentation

#Requires AutoHotkey v2.0
#SingleInstance

#+q::
{
    Send "!{F4}"
}