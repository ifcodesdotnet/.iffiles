#Requires AutoHotkey v2.0
#SingleInstance

; hotstrings for words I hate spelling and their different forms and tenses
:*:repo`n::repository
:*:repos`n::repositories

:*:dep`n::dependency
:*:deps`n::dependencies

:*:dir`n::directory
:*:dirs`n::directories

:*:eng`n::engineer
:*:engs`n::engineers
:*:enging`n::engineering

; hotstrings for words I hate spelling
:*:arch`n::architecture
:*:maint`n::maintenance
:*:rel`n::relative
:*:spec`n::specific
:*:rec`n::receive
:*:sch`n::schedule
:*:def`n::definitely
:*:specy`n::specifically
:*:exp`n::explorer
:*:env`n::environment
:*:cor`n::correspond
:*:des`n::destructuring
:*:art`n::artifactory
:*:ahk`n::autohotkey

; hotstrings for words I misspell
:*:teh::the
:*:hte::the
:*:thw::the
:*:thd::the

; hotstrings for git
; using the ? option here so that I can trigger the hotstring
;  even when I'm inside another word. I'm using this hotstring
;  a lot when I'm working with my aliases for branches
; https://www.autohotkey.com/docs/v2/Hotstrings.htm#Options
:*?:b`n::branch
:*?:lo`n::local
:*?:re`n::remote
:*?:a`n::all

; hotstrings for powershell
:*:pp`n::
{
  Send("C:\Users\" . A_UserName . "\.iffiles\personal.json")
}

:*:ww`n::
{
  Send("C:\Users\" . A_UserName . "\.iffiles\work.json")
}

:*:tt`n::
{
  Send("C:\Users\" . A_UserName . "\.iffiles\test.json")
}

:*:rr`n::
{
  Send(". $PROFILE")
}