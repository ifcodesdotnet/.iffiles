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
:*:ex`n::example
:*:exs`n::examples
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
  ;b
:*:br`n::branch
  ; c
:*:cor`n::correspond
  ; d
:*:def`n::definitely
:*:des`n::destructuring
  ; e
:*:env`n::environment
:*:exp`n::explorer
  ;l
:*:lo`n::local
  ; m
:*:maint`n::maintenance
  ; r
:*:rec`n::receive
:*:rel`n::relative
:*:re`n::remote
  ; s
:*:sch`n::schedule
:*:stra`n::strategy
:*:stru`n::structure

; hotstrings for words I misspell
  ; the
:*:teh::the
:*:hte::the
:*:thw::the
:*:thd::the
  ; this
:*:htis::this
:*:thsi::this
  ; how
:*:hwo::how

; hotstrings for powershell
:*:rr`n::
{
  Send(". $PROFILE")
}