#Requires AutoHotkey v2.0
#SingleInstance

; Key Remaps

; CapsLock:
; Remap to hyphen (-).
;  https://www.autohotkey.com/docs/v2/misc/Remap.htm#other-useful-remappings
CapsLock::-

; Shift + CapsLock:
; Use CapsLock's original behavior.
+CapsLock::CapsLock

; Context-Sensitive Remaps
;  https://www.autohotkey.com/docs/v2/lib/_HotIf.htm

; File Explorer/Desktop:
; Replace Space with hyphen (-).
#HotIf WinActive("ahk_exe explorer.exe")
Space::-

; Save As dialog:
; Replace Space with hyphen (-).
#HotIf WinActive("Save As")
Space::-