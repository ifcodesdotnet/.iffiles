; Script Name: kebab-case-clipboard.ahk
; Description: Convert highlighted text to kebab case.
; GitHub Repository: https://github.com/ifcodesdotnet/.iffiles
; References:
;   https://www.autohotkey.com/docs/v2/lib/StrReplace.htm
;     Documentation for how to use StrReplace
;   https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm
;     Documentation for how to use A_Clipboard to access the clipboard

#Requires AutoHotkey v2.0

#+k::
{
    ; Save the current clipboard to eventually restore it once this script is
    ;  done formatting text to kebab case.
    CurrentClipboard := A_Clipboard

    ; Emptying out the clipboard so that the eventual ClipWait call works
    ;   correctly.
    A_Clipboard := ""

    SendInput "^c"

    ClipWait(5, 0)

    A_Clipboard := Trim(A_Clipboard)
    A_Clipboard := StrReplace(A_Clipboard, A_SPACE, "-")
    A_Clipboard := StrLower(A_Clipboard)

    SendInput A_Clipboard

    A_Clipboard := CurrentClipboard
}