#SingleInstance force
#MaxThreadsPerHotkey 3
SetControlDelay -1
SetMouseDelay -1

global title := "BlueStacks App Player"
WinActivate %title%
toggle = 0
; 110 pixel blocks in the x direction

xgap1 := 736
xgap2 := 846
ygap := 518

yblock := 490
xblock1 = 702
xblock2 := 812
xblock3 = 922

colorgap1 := 0x60623D
colorgap2 := 0x226244
colorgap3 := 0x164F6F
colorblock1 := 0x4B6C6F
colorblock2 := 0x546E6F
colorblock3 := 0x546E6F

~XButton2::
	if WinActive(title) {
		toggle := !toggle
		t := 1
		
		while toggle {
		x:	
			clickPos(900, 220) ; goddess activation
			getColor(xblock3, yblock)
			while (color != colorblock3) {
				clickPos(xblock3, yblock)
				goto, x
			}
			clickPos(900, 220) ; goddess activation
			getColor(xblock2, yblock)
			while (color != colorblock2) {
				clickPos(xblock2, yblock)
				goto, x
			}
			clickPos(900, 220) ; goddess activation
			getColor(xblock1, yblock)
			while (color != colorblock1) {
				clickPos(xblock1, yblock)
				goto, x
			}
			clickPos(xgap1, ygap)
			
			
			;if t >= 1350 { toggle = 0 } ; # * .1 = # of secs the script will run
			;t++
		}
		

	}
return

clickPos(x, y) {
 	global
	ControlClick, x%x% y%y%, %title%,,,, NA
	sleep 200
}

getColor(x, y) {
	global
	sleep 200
	PixelGetColor, color, %x%, %y%
}

~Esc::
	Reload
return

!MButton::
	MouseGetPos, xpos, ypos 
	Msgbox, The cursor is at X%xpos% Y%ypos%
return
