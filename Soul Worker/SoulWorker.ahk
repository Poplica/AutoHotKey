#NoEnv
#IfWinActive, SoulWorker
#SingleInstance, Force

SendMode, Input

$CapsLock::
  While (GetKeyState("CapsLock","P")) {
    Send, {Space}
    Sleep, 1
  }
Return

NumpadSub::
Reload
Return
