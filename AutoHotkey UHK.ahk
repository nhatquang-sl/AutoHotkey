; HotKey: Win = #, Control = ^, Alt = !, Shift = +

SetCapsLockState AlwaysOff
;CapsLock::LWin

CapsLock & Esc::Send !{F4}

#Esc::WinMinimize, A  ;


; CapsLock+I/K/J/L to Up/Down/Left/Right
CapsLock & i:: up
CapsLock & k:: down
CapsLock & j:: left
CapsLock & l:: right

CapsLock & u:: Home
CapsLock & o:: End

CapsLock & y:: PgUp
CapsLock & h:: PgDn

;CapsLock + f to delete-char
;CapsLock + d to delete-backward-char
CapsLock & f::Send {Delete}
CapsLock & d::Send {Backspace}

; kill-word, backward-kill-word
CapsLock & r::Send ^{Delete}
CapsLock & e::Send ^{Backspace}


; kill-line, kill-line-backward
CapsLock & g::
	GetKeyState, state, Shift
	if state = D
		Send {Shift down}{right}{Home}{Shift up}{Delete}
	else
		Send {Shift down}{right}{End}{Shift up}{Delete}
return



CapsLock & p::
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
CapsLock & b:: ^b
CapsLock & z:: ^z
CapsLock & x:: ^x
CapsLock & c:: ^c
CapsLock & v:: ^v
CapsLock & t:: ^t

; Ctrl + Tab
CapsLock & Tab:: ^Tab

; Ctrl + Space
^Space:: Send {Ctrl down}{Space}{Ctrl up}

; Ctrl + '.' Ctrl + ',' Ctrl + '`' 
CapsLock & .:: ^.
CapsLock & ,:: ^,
CapsLock & `:: ^`

; Shift + '[' Shift + ']'
CapsLock & [:: +[
CapsLock & ]:: +]
CapsLock & ':: +'
CapsLock & `;:: +`;


; move line up/down
CapsLock & w::Send !{up}
CapsLock & s::Send !{down}

LAlt & -::
	SwitchOrStartApp("explorer.exe", "C:\Windows\explorer.exe")
return

LAlt & 1::
	SwitchOrStartApp("Code.exe", "C:\Program Files\Microsoft VS Code\Code.exe")
return

LAlt & 2:: 
	SwitchOrStartApp("Chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe")
return

LAlt & 3::
	SwitchOrStartApp("devenv.exe", "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe")
return

LAlt & 4::
	;SwitchOrStartApp("TablePlus.exe", "C:\Program Files\TablePlus\TablePlus.exe")
	SwitchOrStartApp("Ssms.exe", "C:\Program Files (x86)\Microsoft SQL Server Management Studio 20\Common7\IDE\Ssms.exe")
return

LAlt & 5::
	;SwitchOrStartApp("TablePlus.exe", "C:\Program Files\TablePlus\TablePlus.exe")
	SwitchOrStartApp("rider64.exe", "C:\Program Files\JetBrains\JetBrains Rider 2024.2.7\bin\rider64.exe")
return

LAlt & 6::
	SwitchOrStartApp("Telegram.exe", "C:\Users\LT\AppData\Roaming\Telegram Desktop\Telegram.exe")
return

LAlt & 7::
	SwitchOrStartApp("WindowsTerminal.exe", "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.21.2911.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe")
return

LAlt & 8::
	SwitchOrStartApp("notepad++.exe", "C:\Program Files\Notepad++\notepad++.exe")
return

LAlt & 9::
	SwitchOrStartApp("Acrobat.exe", "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe")
return

LAlt & 0::
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
	;MsgBox, 4, , pid = %this_pid%
	if idLast = ""
		Run %exePath%
	else {
		WinActivate, ahk_id %idLast%
		WinGet this_pid, PID, A
		WinActivate, ahk_pid %this_pid%
	}

}