#NoEnv
#IfWinActive, Guild Wars 2
#SingleInstance, Force

SendMode, Input
SetKeyDelay, 0

; Forge first 4 slots
Insert::
  ; Loop 40 {
    sleepDuration := 25
    Click, 541, 265 ; slot 0
    Click, 541, 265
    Sleep, sleepDuration
    Click, 606, 265 ; slot 1
    Click, 606, 265
    Sleep, sleepDuration
    Click, 662, 265 ; slot 3
    Click, 662, 265
    Sleep, sleepDuration
    Click, 715, 265 ; slot 4
    Click, 715, 265

    Sleep, sleepDuration
    Click, 1111, 710 ; forge

    Send, f ; Open forge window again
    ; Click, 1640, 195
    ; Click, 1640, 195

  ;   Sleep, 300
  ; }
Return

Return

; Auto Draconis Mons
; ^Insert::
;   sleepDuration := 100
;   numScroll := 1

;   MouseGetPos, currX, currY
;   Click, 2
;   Sleep, 10000
;   Send, f ; loot
;   Sleep, 10000
;   Send, {F12}
;   Sleep, sleepDuration
;   Click, 950, 600 ; char select
;   Sleep, 5000
;   Click, numScroll, 1385, 985 ; char scroll bar 
;   Sleep, sleepDuration
;   MouseMove, currX, currY
; Return

; Destroy moused item
; Delete::
;   MouseGetPos, currX, currY
;   MouseClick, Right
;   Sleep, 100
;   MouseMove, currX+40, currY+30
;   Sleep, 100
;   Click
;   MouseMove, 960, 590
;   Sleep, 100
;   Click
;   MouseMove, currX, currY
; Return

; Dodge jump
; XButton1::
;   Send, {XButton1}{space}
; Return

; ; Double jump spam at 30 fps
; CapsLock::
;   Send, {space}
;   Sleep, 48
;   Send, {1}
;   Sleep, 28
;   Send, {``}
; Return

; Hold home to auto click
Home::
  While (GetKeyState("Home","P")) {
    Click
    Sleep, 50
  }
Return

; Feed Candy Corn Gobbler
PgUp::
  Loop 12 {
    Click, 2
    Sleep, 5100
  }
Return

; Deposit all and take all
PgDn::
  sleepDuration := 120

  Click, 1890, 60 ; inventory cog
  Sleep, sleepDuration
  Click, 1890, 80 ; deposit all
  Sleep, sleepDuration
  ; Click, 1060, 620 ; take all
  ; Sleep, sleepDuration

  ; Click, right, 1460, 135 ; right click copper kit
  Click, right, 1515, 135 ; right click runecrafter kit
  ; Click, right, 1570, 135 ; right click silver kit
  Sleep, sleepDuration + 50
  ; Click, 1520, 170 ; salvage blues
  Click, 1520, 200 ; salvage greens
  ; Click, 1600, 220 ; salvage yellows
  Sleep, sleepDuration
  Click, 900, 765 ; ok (with a lot of greens in inventory)
  Sleep, sleepDuration
Return

; ~F1::
;   Sleep, 10
;   Send, {F2}
; Return

; Give 250 exotic luck to Drooburt
; PgUp::
;   Loop 10000 {
;     Send, f
;     Sleep, 400
;     Click
;     Sleep, 300
;   }
; Return

^NumpadSub::
  Reload
Return

^NumpadMult::
  Suspend, Toggle
Return