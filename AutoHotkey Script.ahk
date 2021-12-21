; HotKey: Win = #, Control = ^, Alt = !, Shift = +

SetCapsLockState AlwaysOff
CapsLock::LWin

Space::Send {Space}

Space & Esc::Send !{F4}

#Esc::WinMinimize, A  ;


; CapsLock+I/K/J/L to Up/Down/Left/Right
Space & i:: up
Space & k:: down
Space & j:: left
Space & l:: right

Space & u:: Home
Space & o:: End

Space & y:: PgUp
Space & h:: PgDn

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



Space & p::
	if GetKeyState("Shift", "P") && GetKeyState("Control", "P")
		Send ^+{End}
	else if GetKeyState("Shift", "P")
		Send +{End}
	else if GetKeyState("Control", "P")
		Send ^{End}
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

Space & -::
	SwitchOrStartApp("explorer.exe", "C:\Windows\explorer.exe")
return

Space & 1::
	SwitchOrStartApp("Code.exe", "C:\Program Files\Microsoft VS Code\Code.exe")
return

Space & 2:: 
	SwitchOrStartApp("Chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe")
return

Space & 3::
	SwitchOrStartApp("devenv.exe", "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\devenv.exe")
return

Space & 4::
	SwitchOrStartApp("Ssms.exe", "C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe")
return

Space & 5::
	SwitchOrStartApp("Slack.exe", "C:\Program Files\Slack\Slack.exe")
return

Space & 6::
	SwitchOrStartApp("Postman.exe", "C:\Users\HomePC\AppData\Local\Postman\Postman.exe")
return

Space & 7::
	SwitchOrStartApp("Authy Desktop.exe", "C:\Users\Home\AppData\Local\authy-electron\Authy Desktop.exe")
return

Space & 8::
	SwitchOrStartApp("notepad++.exe", "C:\Program Files\Notepad++\notepad++.exe")
return

Space & 9::
	SwitchOrStartApp("AcroRd32.exe", "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe")
return

Space & 0::
	SwitchOrStartApp("KMPlayer64.exe", "C:\Program Files\KMPlayer 64X\KMPlayer64.exe")
return

SwitchOrStartApp(processName, exePath){
	if GetKeyState("Shift", "P")
		Run %exePath%
	WinGet, id, List,,, Program Manager
	idLast = ""
	Loop, %id%
	{
		this_id := id%A_Index%
		WinGet this_processName, ProcessName, ahk_id %this_id%`
		WinGetTitle, this_title, ahk_id %this_id%
		this_len := StrLen(this_title)
		;MsgBox, 4, , this_processName = %this_processName%`nprocessName=%processName%
		;IfMsgBox, NO, break
		if this_len > 0
		if this_processName = %processName%
			idLast := id%A_Index%
	}
	
	;MsgBox, 4, , idLast = %idLast%
	if idLast = ""
		Run %exePath%
	else 
		WinActivate, ahk_id %idLast%
}


LWin::LAlt
LAlt::LWin