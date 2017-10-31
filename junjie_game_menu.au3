#include <GuiConstants.au3>

; GUI Creation
GuiCreate("Junjie Game Menu",250, 80)
; Combo Box Creation
$combobox = GUICtrlCreateCombo("Notepad", 10,10,120,20)
GUICtrlSetData(-1, "Paint|Command Prompt|HANGAROO|MARIO|PAC-MAN|RED ALERT 2")

;Button Creation
$buttom = GUICtrlCreateButton("Go", 10,40,60,20)
GUISetState(@SW_SHOW)

; Continous Loop to check for GUI Events
While 1
	$guimsg = GUIGetMsg()
	Select
		Case $guimsg = $buttom
			MsgBox(0,"", "You chose " & GUICtrlRead($combobox) & ".")
			Select
				Case GUICtrlRead($combobox) = "Notepad"
					Run("notepad.exe")
					Exit
				Case GUICtrlRead($combobox) = "Paint"
					Run("mspaint.exe")
					Exit
				Case GUICtrlRead($combobox) = "Command Prompt"
					Run("cmd.exe")
					Exit
				Case GUICtrlRead($combobox) = "HANGAROO"
					Run("D:/Mini Games/HangARoo/HANGAROO.exe")
					Exit
				Case GUICtrlRead($combobox) = "MARIO"
					Run("D:/Mini Games/Super,Mario/MarioForever V4.4.exe")
					Exit
				Case GUICtrlRead($combobox) = "PAC-MAN"
					Run("D:/Mini Games/Pac-Man World Rally/PMR.exe")
					Exit
				Case GUICtrlRead($combobox) = "RED ALERT 2"
					Run("D:/Lan Games/g/Red Alert 2 Yuri's Revenge/RA2MD.exe")
					Exit
			    EndSelect
		Case $guimsg = $GUI_EVENT_CLOSE
			Exit
	EndSelect
WEnd
