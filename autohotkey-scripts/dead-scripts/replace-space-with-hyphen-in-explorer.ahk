; Script Name: kebab-case-explorer.ahk
; Description: Remap spacebar to hyphen when file explorer or Desktop is the
;              active window
; GitHub Repository: https://github.com/ifcodesdotnet/.iffiles
; References:
;   https://www.autohotkey.com/docs/v2/misc/Remap.htm
;     Link to remapping keys documentation
;   https://www.autohotkey.com/docs/v2/lib/_HotIf.htm
;     Link to #HotIf documentation
#Requires AutoHotkey v2.0
#SingleInstance

#HotIf WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
Space::-