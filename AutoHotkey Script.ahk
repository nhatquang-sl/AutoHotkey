; HotKey: Win = #, Control = ^, Alt = !, Shift = +

SetCapsLockState AlwaysOff

Space::Send {Space}

; Window + Up/Down/Left/Right
Space & Up::Send #{Up}
Space & Down::Send #{Down}
Space & Left::Send #{Left}
Space & Right::Send #{Right}

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

; Ctrl + z, Ctrl + x, Ctrl + c, Ctrl + v, Ctrl + b
Space & b:: ^b
Space & z:: ^z
Space & x:: ^x
Space & c:: ^c
Space & v:: ^v
Space & t:: ^t

; Ctrl + Tab
Space & Tab:: ^Tab

; Ctrl + Space
^Space:: Send {Ctrl down}{Space}{Ctrl up}

; Ctrl + '.' Ctrl + ',' Ctrl + '`' 
Space & .:: ^.
Space & ,:: ^,
Space & `:: ^`

; Shift + '[' Shift + ']'
Space & [:: +[
Space & ]:: +]
Space & ':: +'
Space & `;:: +`;


; move line up/down
Space & w::Send !{up}       
Space & s::Send !{down}

Space & 1::
	if GetKeyState("Shift", "P")
		Run "C:\Program Files\Microsoft VS Code\Code.exe"
	else
		SwitchOrStartApp("Code.exe", "C:\Program Files\Microsoft VS Code\Code.exe")
return

Space & 2:: 
	if GetKeyState("Shift", "P")
		Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
	else
		SwitchOrStartApp("Chrome.exe", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
return

Space & 3::
	if GetKeyState("Shift", "P")
		Run "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe"
	else
		SwitchOrStartApp("devenv.exe", "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe")
return

Space & F4::
	SwitchOrStartApp("powershell.exe", "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe")
return

Space & F5::
	if GetKeyState("Shift", "P")
		Run "C:\Program Files\Mozilla Firefox\firefox.exe"
	else 
		SwitchOrStartApp("firefox.exe", "C:\Program Files\Mozilla Firefox\firefox.exe")
return

SwitchOrStartApp(processName, exePath){
	WinGet, id, List,,, Program Manager
	idLast = ""
	Loop, %id%
	{
		this_id := id%A_Index%
		WinGet this_processName, ProcessName, ahk_id %this_id%`
		
		;MsgBox, 4, , this_processName = %this_processName%`nprocessName=%processName%
		;IfMsgBox, NO, break
		if this_processName = %processName%
			idLast := id%A_Index%
	}
	
	;MsgBox, 4, , idLast = %idLast%
	if idLast = ""
		Run %exePath%
	else 
		WinActivate, ahk_id %idLast%
}


;LWin::LAlt
;LAlt::LWin