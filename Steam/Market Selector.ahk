; unchecks 3 boxes from current mouse position. Goes down

#SingleInstance, Force
#MaxThreadsPerHotkey, 3

toggle := 0

`::
	MouseGetPos, xpos, ypos
	toggle := !toggle
	
	if toggle
		loop 3 {
			Click
			MouseMove, xpos, ypos:=ypos+65
		}
		toggle := 0
Return

~XButton1::
	toggle := 0
	KeyWait, XButton1, T1 ; wait # seconds for release key
	if ErrorLevel  ; more than # sec have passed
		Exitapp
Return

#SingleInstance, Force
#MaxThreadsPerHotkey, 3

toggle := 0

`::
	MouseGetPos, xpos, ypos
	
	loop 20 {
		Click
		MouseMove, 900, 600
		Click
		MouseMove, xpos, ypos:=ypos+65
		Click
		MouseMove, 900, 600
		Click
		MouseMove, xpos, ypos:=ypos-65
		Click
		MouseMove, 900, 600
		Click
		MouseMove, xpos, ypos:=ypos+65*3
		Click
		MouseMove, 900, 600
		Click
		MouseMove, xpos, ypos:=ypos-65*3
	}
Return

~XButton1::
	toggle := 0
	KeyWait, XButton1, T1 ; wait # seconds for release key
	if ErrorLevel  ; more than # sec have passed
		Exitapp
Return

