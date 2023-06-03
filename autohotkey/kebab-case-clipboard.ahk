; Script Name: kebab-case-clipboard.ahk
; Description: Replaces spaces in text copied to clipboard with a hyphen when
;              keyboard button combination Windows+Shift+k is clicked
; GitHub Repository: https://github.com/ifcodesdotnet/.iffiles
; References:
;   https://www.autohotkey.com/docs/v2/lib/StrReplace.htm
;     Documentation for how to use StrReplace
;   https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm
;     Documentation for how to use A_Clipboard to access the clipboard

#+k::
{
    A_Clipboard := StrReplace(A_Clipboard, A_SPACE, "-")
}