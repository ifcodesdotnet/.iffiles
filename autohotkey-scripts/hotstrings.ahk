#Requires AutoHotkey v2.0
#SingleInstance

; hotstrings for same word
:*:repo`n::repository
:*:repos`n::repositories

:*:dep`n::dependency
:*:deps`n::dependencies

:*:dir`n::directory
:*:dirs`n::directories

:*:eng`n::engineer
:*:engs`n::engineers
:*:enging`n::engineering

:*:bra`n::branch
:*:bras`n::branches

; hotstrings individual words
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

; hotstrings for git
:*:git c`n::
:*:git check`n::
{
  Send("git checkin `"`"")
  Send '{Left}'
}

:*:git rb`n::
{
  Send("git Read-Branch")
}

:*:git rbl`n::
{
  Send("git Read-BranchLocal")
}

:*:git rbr`n::
{
  Send("git Read-BranchRemote")
}

:*:git rba`n::
{
  Send("git Read-BranchAll")
}

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