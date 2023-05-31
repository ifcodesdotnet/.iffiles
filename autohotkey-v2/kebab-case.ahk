; https://www.autohotkey.com/docs/v2/lib/StrReplace.htm
; https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm



; keybab case the text that in my keyboard using Alt+-
; !-::
; {
;     A_Clipboard := StrReplace(A_Clipboard, A_SPACE, "-")
; }


; keybab case whatever text I write in my file explorer or on my desktop!

#HotIf WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
Space::-



; https://www.autohotkey.com/docs/v1/misc/Remap.htm
; How to remap my keys

; https://www.autohotkey.com/docs/v2/lib/_HotIf.htm
; how to check if a certain window is active....