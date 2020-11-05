#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force

SendMode, Input

slideAttackActive := false

$XButton2::
  slideAttackActive := !slideAttackActive
  Send, {w down}
  while (slideAttackActive) {
    Sleep, 90
    Send, {LCtrl down}
    Send, e
    ; Sleep, 100 ; for moving
    Send, {LCtrl up}
    
    ; main
    Sleep, 220 ; resource
    ; Sleep, 180 ; loctidra - 91%
    ; Sleep, 240 ; berserker
    ; Sleep, 270 ; fury

    ; alt
    ; Sleep, 250 ; berserker
    ; Sleep, 280 ; fury
  }
Return

~XButton1::
  slideAttackActive := false
Return

Pause::
Suspend, Toggle
Return

!Pause::
Reload
Return