SetCapsLockState AlwaysOff
     
Space::Send {Space}

; CapsLock+I/K/J/L to Up/Down/Left/Right
Space & i::
	GetKeyState, state, Shift
	if state = D
		Send {Shift down}{up}{Shift up}
	else
		Send {up}
return

Space & k::
	GetKeyState, state, Shift
	if state = D
		Send {Shift down}{down}{Shift up}
	else
		Send {down}
return

Space & j::
	if GetKeyState("CapsLock", "P") && GetKeyState("Shift", "P")
		Send {Shift down}{left down}{Home}{Shift up}{left up}
	else if GetKeyState("Shift", "P")
		Send {Shift down}{left}{Shift up}
	else if GetKeyState("CapsLock", "P")
		Send {left down}{Home}{left up}
	else  
		Send {left}
return

Space & l::
	if GetKeyState("CapsLock", "P") && if GetKeyState("Shift", "P")
		Send {Shift down}{right down}{End}{Shift up}{right up}
	else if GetKeyState("Shift", "P")
		Send {Shift down}{right}{Shift up}
	else if GetKeyState("CapsLock", "P")
		Send {right down}{End}{right up}
	else
		Send {right}
return

; forward-word, backward-word
Space & o::
	GetKeyState, state, Shift
	if state = D
		Send {Shift down}^{right}{Shift up}
	else
		Send ^{right}
return
	
Space & u::
	GetKeyState, state, Shift
	if state = D
		Send {Shift down}^{left}{Shift up}
	else
		Send ^{left}
return


;CapsLock + f to delete-char
;CapsLock + d to delete-backward-char
Space & f::Send {Delete}
Space & d::Send {Backspace}

; kill-word, backward-kill-word
Space & r::Send ^{Delete}
Space & e::Send ^{Backspace}


; kill-line, kill-line-backward
Space & g::
	GetKeyState, state, Shift
	if state = D
		Send {Shift down}{right}{Home}{Shift up}{Delete}
	else
		Send {Shift down}{right}{End}{Shift up}{Delete}
return

; move-begining-of-line, move-end-of-line
Space & y::
	if GetKeyState("Shift", "P")
		Send {Shift down}{left down}{Home}{Shift up}{left up}
	else
		Send {Home}
return 

Space & p::
	if GetKeyState("Shift", "P")
		Send {Shift down}{right down}{End}{Shift up}{right up}
	else
		Send {End}
return

Space & b:: ^b
Space & z:: ^z
Space & x:: ^x
Space & c:: ^c
Space & v:: ^v

^Space:: Send {Ctrl down}{Space}{Ctrl up}

; move line up/down
Space & w::Send !{up}       
Space & s::Send !{down}

Space & F1::
WinGet, id, List,,, Program Manager
CMDCode = 0
Loop, %id%
{
    this_id := id%A_Index%
	WinGet this_processName, ProcessName, ahk_id %this_id%`

	WinGet active_id, ID, A
	WinGet active_processName, ProcessName, A
    
	if (this_processName = "Code.exe") {
		if (CMDCode = 1 or this_processName != active_processName) {
			MsgBox, 4, , this_id = %this_id%`nactive_id=%active_id%`nthis_processName = %this_processName%`nactive_processName = %active_processName%`nCMDCode = %CMDCode%
    	    IfMsgBox, NO, break
			WinActivate, ahk_id %this_id%
			return
		}
		else if (this_processName = active_processName) {
			CMDCode = 1
		}
	}

	;StringGetPos, pos, this_processName, Code
}	 
return
;    WinActivate, ahk_exe C:\Program Files\Microsoft VS Code\Code.exe

LWin::LAlt
LAlt::LWin