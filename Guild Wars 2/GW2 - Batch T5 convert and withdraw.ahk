#NoEnv
#IfWinActive, Guild Wars 2
#SingleInstance, Force

SendMode, Input

; Forge first 4 slots
Insert::
  Loop 40 {
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

    Sleep, 300
  }
Return

dragAndDrop(sleepDuration, fromX, fromY, toX, toY) {
  MouseMove, fromX, fromY, 100
  Send, {LButton down}
  MouseMove, toX, toY, 100
  Sleep, sleepDuration
  Send, {LButton up}

  Return
}

; Line up bank row with inventory row
; Drags 2 bank rows into 4 inventory rows separated by 1 row
; NumpadDiv::
;   MouseGetPos, fromX, fromY

;   sleepDuration := 100
;   bankTabX := 830
;   bankTab2Y := 340
;   bankTab3Y := 370
;   inventoryX := 550
;   inventoryY := 340

;   Loop 4 {
;     ; first 4 items in row 1
;     dragAndDrop(sleepDuration, fromX, fromY, inventoryX, inventoryY)
;     Sleep, sleepDuration
;     dragAndDrop(sleepDuration, fromX, fromY + 60, inventoryX, inventoryY + 60*3)
;     Sleep, sleepDuration
;     dragAndDrop(sleepDuration, fromX + 60*4, fromY, inventoryX, inventoryY + 60)
;     Sleep, sleepDuration
;     dragAndDrop(sleepDuration, fromX + 60 *4, fromY + 60, inventoryX, inventoryY + 60*4)

;     fromX += 60
;     inventoryX += 60
;     Sleep, sleepDuration
;   }
; Return

NumpadMult::
  MouseGetPos, fromX, fromY

  sleepDuration := 100


  Click, 2 ; use recipe
  Sleep, sleepDuration
  MouseMove, 1100, 640 ; scroll to bottom
  Send, {LButton down}
  Sleep, 1000
  Send, {LButton up}
  Sleep, sleepDuration
  Click, 950, 555
  Sleep, sleepDuration
  Click, 950, 695
  Sleep, sleepDuration
  Click, 950, 590

  MouseMove, fromX, fromY

Return

; Hold home to auto click
Home::
  While (GetKeyState("Home","P")) {
    Click
    Sleep, 50
  }
Return

; Destroy moused item
Delete::
  MouseGetPos, currX, currY
  MouseClick, Right
  Sleep, 100
  MouseMove, currX+40, currY+30
  Sleep, 100
  Click
  MouseMove, 960, 590
  Sleep, 100
  Click
  MouseMove, currX, currY
Return

^NumpadSub::
  Reload
Return

^NumpadMult::
  Suspend, Toggle
Return