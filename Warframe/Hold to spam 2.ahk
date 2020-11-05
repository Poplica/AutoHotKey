#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force

$2::
  While (GetKeyState("2","P")) {
    Send, 2
    Sleep, 10
  }
Return

$CapsLock::
  While (GetKeyState("CapsLock","P")) {
    Send, {x}{y}
    Sleep, 1
  }
Return

$XButton2::
  While (GetKeyState("XButton2","P")) {
    Send, {x}{y}
    Sleep, 1
  }
Return

; $z::
;   SendInput x
;   Sleep, (140+290)
;   Send, {Space}
;   Sleep, 100
;   Send, {Space}
;   Sleep, 390
;   Send, {Space}
;   Sleep, 90
;   Send, {Space}
;   Sleep, 350
;   Send, {Space}
;   Sleep, 90
;   Send, {Space}
;   Sleep, 250
;   Send, {Space}
;   Sleep, 60
;   Send, {Space}
; Return

Insert::
  Suspend, Toggle
Return

NumpadSub::
Reload
Return
