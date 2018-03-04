#InstallKeybdHook
SetFormat, FloatFast, 1.0
LastTimer := 0
tempZ := 0
tempX := 0
tempC := 0
rate := 0
DllCall("QueryPerformanceFrequency", "Int64*", rate)
ToFrames := 1.0/rate * 60

DllCall("QueryPerformanceCounter", "Int64*", LastTimer)

;               xpos ypos width        varName  text value
Gui, Add, Edit, x0   y0   w50   +ReadOnly vZTxt, 0
Gui, Add, Edit, x55  y0   w50   +ReadOnly vXTxt, 0
Gui, Add, Edit, x110 y0   w50   +ReadOnly vCTxt, 0
Gui, Show, , Main Window ; Create and display the GUI
return

GuiClose:
 ExitApp
 return
 
SetTxtField(ByRef varName, ByRef value)
{   
    GuiControl,, varName, %value%
}

~Space::
DllCall("QueryPerformanceCounter", "Int64*", LastTimer)
SetTxtField(ZTxt, 0)
SetTxtField(XTxt, 0)
SetTxtField(CTxt, 0)
return 

~z::
DllCall("QueryPerformanceCounter", "Int64*", tempZ)
counts:= tempZ - LastTimer
frames:= (counts * ToFrames)
SetTxtField(ZTxt, frames)
return

~x::
DllCall("QueryPerformanceCounter", "Int64*", tempX)
counts:= tempX - LastTimer
frames:= (counts * ToFrames)
SetTxtField(XTxt, frames)
return

~c::
DllCall("QueryPerformanceCounter", "Int64*", tempC)
counts:= tempC - LastTimer
frames:= (counts * ToFrames)
SetTxtField(CTxt, frames)
return