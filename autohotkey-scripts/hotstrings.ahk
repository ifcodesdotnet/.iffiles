#Requires AutoHotkey v2.0
#SingleInstance

; hotstrings for words

:*:arch`n::architecture

:*:maint`n::maintenance

:*:enging`n::engineering

:*:eng`n::engineer

:*:rel`n::relative

:*:spec`n::specific

:*:repo`n::repository

:*:repos`n::repositories

:*:dep`n::dependency

:*:deps`n::dependencies

:*:rec`n::receive

:*:sch`n::schedule

:*:dir`n::directory

:*:def`n::definitely

:*:specy`n::specifically

:*:exp`n::explorer

:*:env`n::environment

:*:cor`n::correspond

; hotstrings for git
:*:git check::
:*:g check::
{
  Send("git checkin `"`"")
  Send '{Left}'
}

:*:git list-b::
:*:g list-b::
{
  Send("git list-branches")
}

:*:git create-b::
:*:g create-b::
{
  Send("git create-branch")
}

:*:git update-b::
:*:g update-b::
{
  Send( "git update-branch")
}

:*:git delete-b::
:*:g delete-b::
{
  Send("git delete-branch")
}