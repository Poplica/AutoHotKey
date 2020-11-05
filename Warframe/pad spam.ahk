#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force

SendMode, Input

$e::
  While (GetKeyState("e","P")) {
    Send, {v}{Numpad1}{Numpad2}{Numpad3}{Numpad9}
    Sleep, 10
  }
Return

^NumpadAdd::
  Send, /join koto.{Enter}
Return
^NumpadDiv::
  Send, qweqwe22{Enter}
Return

^+e::
  Suspend, Toggle
Return

^+NumpadSub::
  Reload
Return