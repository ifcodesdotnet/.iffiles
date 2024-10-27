#Requires AutoHotkey v2.0
#SingleInstance

; hotstrings for words I hate spelling and their different forms and tenses
  ; d
:*:dep`n::dependency
:*:deps`n::dependencies

:*:dir`n::directory
:*:dirs`n::directories
  ; e
:*:eng`n::engineer
:*:engs`n::engineers
:*:enging`n::engineering
  ; r
:*:repo`n::repository
:*:repos`n::repositories
  ; s
:*:spec`n::specific
:*:specs`n::specifics
:*:specy`n::specifically

; hotstrings for words I hate spelling
  ; a
:*:ahk`n::autohotkey
:*:arch`n::architecture
:*:art`n::artifactory
  ; c
:*:cor`n::correspond
  ; d
:*:def`n::definitely
:*:des`n::destructuring
  ; e
:*:env`n::environment
:*:exp`n::explorer
  ; m
:*:maint`n::maintenance
  ; r
:*:rec`n::receive
:*:rel`n::relative
  ; s
:*:sch`n::schedule

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
:*:rr`n::
{
  Send(". $PROFILE")
}