#include <GUIConstantsEx.au3>
   #Include <GuiComboBox.au3>
   #include <GuiComboBoxEx.au3>
   ; Create GUI
   $hGUI = GUICreate("Test", 500, 500)

   Global $hCombo = GUICtrlCreateCombo("", 10, 10, 250, 20)
   GUICtrlSetData($hCombo, "Atchu | Muthu | Ponreegan | Vijay | Vasu", "Vasu")

   $hGetButton = GUICtrlCreateButton("Get", 270, 10, 30, 20)

   Global $temp = " "
    GUISetState ( @SW_SHOW , $hGUI )
While 1

    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
           Exit
        Case $hGetButton
           $temp = GUICtrlRead($hCombo)
           MsgBox($MB_SYSTEMMODAL, "", "You chose: " & $temp)
           Exit
		   Run ("ZumasRevengeAdventure.exe")
			WinWaitActive ("Window title", "text")
    EndSwitch

WEnd