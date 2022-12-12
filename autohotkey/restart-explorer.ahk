; Script name: restart-explorer.ahk
; Description: Shortcut to reload explorer as my quit shortcut sometimes causes explorer to 
;              crash.
; GitHub: https://github.com/ifcodesdotnet/.iffiles
; Contributors: Ismael Fernandez
; References:
;
;   https://www.howtogeek.com/198815/use-this-secret-trick-to-close-and-restart-explorer.exe-in-windows/
;     How to programatically kill explorer.exe and restart it.
;
;   https://stackoverflow.com/questions/4277963/how-to-call-cmd-without-opening-a-window
;     How to stop the console window from appearing when running commands.

#+r::

run, cmd.exe /c /q taskkill /f /im explorer.exe && start explorer.exe