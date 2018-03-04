#InstallKeybdHook

LastTimer := 0
tempZ := 0
rate := 0
DllCall("QueryPerformanceFrequency", "Int64*", rate)
DllCall("QueryPerformanceCounter", "Int64*", LastTimer)


Gui, Add, Edit, w50 +ReadOnly vInfoTxt, sampleText
Gui, Show




return

GuiClose:
 ExitApp
 return
 
~Space::
DllCall("QueryPerformanceCounter", "Int64*", LastTimer)

~z::
DllCall("QueryPerformanceCounter", "Int64*", tempZ)
counts:= tempZ - LastTimer

return