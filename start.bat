REM Task Scheduler
REM 1. Create a Task.
REM 2. General: Enable Run with highest privileges.
REM 3. Triggers: New a trigger At log on.
REM 4. Actions: New an action Start a program.

start "C:\Program Files\AutoHotkey\AutoHotkey.exe" "D:\AutoHotkey\AutoHotkey UHK.ahk"

exit 0

@REM "/c/Program Files/AutoHotkey/AutoHotkey.exe" "/d/AutoHotkey/AutoHotkey UHK.ahk" &
