#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)

MainGUI()

Func MainGUI()
  Local $Button1, $Button2, $msg
  GUICreate("My GUI Window Title")

  Opt("GUICoordMode", 2)
  $Button1 = GUICtrlCreateButton("Button 1", 10, 30, 100)
  $Button2 = GUICtrlCreateButton("Button 2", 0, -1)

  GUISetState()

  ; Run the GUI until the window is closed
  While 1
    $msg = GUIGetMsg()
    Select
     Case $msg = $GUI_EVENT_CLOSE
       ExitLoop
     Case $msg = $Button1
       MsgBox(0, 'Button 1', 'Button 1 was pressed')
     Case $msg = $Button2
       MsgBox(0, 'Button 2', 'Button 2 was pressed')
    EndSelect
  WEnd
EndFunc