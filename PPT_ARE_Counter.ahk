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

Gui, Font, cFFFFFF
Gui, Add, Text, x5   y0   w15 h20 vLeftRotate, ↺
Gui, Add, Edit, x20  y5   w50 h20 vZTxt, 0
Gui, Add, Text, x75  y0   w15 h20 vRightRotate, ↻
Gui, Add, Edit, x90  y5   w50 h20 vXTxt, 0
Gui, Add, Text, x145 y0   w15 h20 vHold, ⥮
Gui, Add, Edit, x160 y5   w50 h20 vCTxt, 0
Gui, Color, Black
Gui, Show, , PPT ARE

Gui, Font, s16

Gui, Color,, Black
GuiControl, Font, LeftRotate
GuiControl, Font, RightRotate
GuiControl, Font, Hold
GuiControl, Font, vZTxt
GuiControl, Font, vXTxt
GuiControl, Font, vCTxt


return

GuiClose:
 ExitApp
 return
 
SetTxtField(ByRef varName, ByRef value, ByRef check)
{   
    ARE_FRAMES := 6 ; for some reason can't put this at the top.
    if (check)
    {        
        GuiControl,, varName, %value%
        if (value <= ARE_FRAMES) 
        {
            Gui, Color,, Red            
        } 
    } else { ;they pressed space, set fields to blank.        
        GuiControl,, varName, 
        Gui, Color,, Black
    }
    
}

~Space::
DllCall("QueryPerformanceCounter", "Int64*", LastTimer)
SetTxtField(ZTxt, 0, false)
SetTxtField(XTxt, 0, false)
SetTxtField(CTxt, 0, false)
return 

~z::
DllCall("QueryPerformanceCounter", "Int64*", tempZ)
counts:= tempZ - LastTimer
frames:= (counts * ToFrames)
SetTxtField(ZTxt, frames, true)
return

~x::
DllCall("QueryPerformanceCounter", "Int64*", tempX)
counts:= tempX - LastTimer
frames:= (counts * ToFrames)
SetTxtField(XTxt, frames, true)
return

~c::
DllCall("QueryPerformanceCounter", "Int64*", tempC)
counts:= tempC - LastTimer
frames:= (counts * ToFrames)
SetTxtField(CTxt, frames, true)
return