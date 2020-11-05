#SingleInstance force
#MaxThreadsPerHotkey 3
SetControlDelay -1
SetMouseDelay -1

toggle = 0

+0::
	keywait shift
	toggle := !toggle

	while toggle
	{
		Send {shift down}
		sleep 50
		Send {shift up}
		sleep 50
    }
return

~Esc::
toggle := 0
;suspend permit
;   Exitapp 
return