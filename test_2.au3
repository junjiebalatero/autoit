opt("GUIOnEventMode", 1)
#include <GUIConstantsEX.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>

;VLCPlaylistMode
Const $VLCPlayListInsert = 1
Const $VLCPlayListReplace = 2
Const $VLCPlayListAppend = 4
Const $VLCPlayListGo = 8
Const $VLCPlayListInsertAndGo = 9
Const $VLCPlayListReplaceAndGo = 10
Const $VLCPlayListAppendAndGo = 12
Const $VLCPlayListCheckInsert = 16

; Initialize error handler
$oMyError = ObjEvent("AutoIt.Error","MyErrFunc")

; ---------------------------------- Declare objects -------------------------------
$oVLC = ObjCreate("VideoLAN.VLCPlugin.1")

; -------------------------------------------- Main Gui ---------------------------------
$hGui = GuiCreate("VLC Viewer", 500, 390,-1, -1, Bitor($WS_OVERLAPPEDWINDOW,$WS_VISIBLE, $WS_CLIPSIBLINGS))
GUISetOnEvent($GUI_EVENT_CLOSE, "GUIeventClose")

$bSelect = GUICtrlCreateButton("Select ... ", 10, 20, 70)
         GUICtrlSetOnEvent(-1, "_SelectFile")

;$oVLC_Object = GUICtrlCreateObj ($hGui, 10, 70 , 700 , 460)
;GUICtrlSetStyle ( $oVLC_Object, $WS_VISIBLE )
;GUICtrlSetResizing ($oVLC_Object,$GUI_DOCKAUTO)        ; $GUI_DOCKAUTO Auto Resize Object

GuiSetState()
$size = WinGetPos("[active]")

While 1
    Sleep(100)
WEnd

Func _SelectFile ()
        $File = FileOpenDialog("Select a movie File ", @MyDocumentsDir & "", "Images (*.flv;*.swf;*.wmv;*.avi;*.*)", 1)
    If @error Then
        MsgBox(4096,"","No File chosen ...")
        Return
    Else
        Sleep(100)
        _StartPlay($File)
    EndIf
EndFunc

Func _StartPlay($hFile)
    With $oVLC
        ;.AddTarget ($hFile, Default, $VLCPlayListInsert, 0)
        .MRL = $hFile
        .AutoLoop = 0 ;False
        .AutoPlay = 0 ;False
        .Visible = 1 ;True
        .Play ()
        .Volume = 50
    EndWith
EndFunc


Func GUIeventClose()
    Exit
EndFunc ;==>GUIeventClose

;This is custom error handler
Func MyErrFunc()
$HexNumber=hex($oMyError.number,8)
Msgbox(0,"AutoItCOM Test","We intercepted a COM Error !" & @CRLF & @CRLF & _
             "err.description is: " & @TAB & $oMyError.description & @CRLF & _
             "err.windescription:" & @TAB & $oMyError.windescription & @CRLF & _
             "err.number is: " & @TAB & $HexNumber & @CRLF & _
             "err.lastdllerror is: " & @TAB & $oMyError.lastdllerror & @CRLF & _
             "err.scriptline is: " & @TAB & $oMyError.scriptline & @CRLF & _
             "err.source is: " & @TAB & $oMyError.source & @CRLF & _
             "err.helpfile is: " & @TAB & $oMyError.helpfile & @CRLF & _
             "err.helpcontext is: " & @TAB & $oMyError.helpcontext _
            )
SetError(1) ; to check for after this function returns
Endfunc