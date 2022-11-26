; Script name: quit.ahk
; Description: Linux WM style window closing using Super / Windows key + Shift + q. Includes
;			   additional guard clauses to validate if active window is not desktop.
; GitHub: https://github.com/ifcodesdotnet/.iffiles
; Contributors: Ismael Fernandez
; References:
;   https://www.autohotkey.com/docs/commands/WinClose.htm
;     Documentation for WinClose
;
;   https://www.autohotkey.com/docs/misc/WinTitle.htm
;     Documentation for WinTitle
;
;   https://www.autohotkey.com/board/topic/65952-altf4-script/
;     Forum that inspired me to use WinClose instead of Send !{F4}
;
;   https://www.autohotkey.com/boards/viewtopic.php?t=95250
;     References known issue this script has where after the shortcut is executed alt key is
;     stuck.

#+q::

If WinActive("Program Manager Explorer.EXE")
	Send !{F4}
		
If !WinActive("Program Manager Explorer.EXE")
	WinClose, A