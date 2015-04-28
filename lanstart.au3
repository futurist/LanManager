#Include "Include\MsgBoxConstants.au3"
#Include "Include\GUIConstantsEx.au3"
#Include "Include\ButtonConstants.au3"
#Include "Include\StaticConstants.au3"

Opt("GUIOnEventMode", 1) ; Change to OnEvent mode
Opt("GUIResizeMode", 1)


$CompList = IniRead("system.ini", "CompList", "List", "")
Global $dict = ObjCreate("Scripting.Dictionary")


GUICreate("联润局域网管理", 430, 500)
GUICtrlCreateLabel("本机电脑名称: " & @ComputerName & " , IP地址: " & @IPAddress1, 20, 10, 400, 20)
GUICtrlCreateLabel("局域网列表，点击打开", 20, 35, 400, 20)
GUICtrlSetFont(-1, 12, 700, 0, "SimHei")
GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")


Func SpecialEvents()
    Select
        Case @GUI_CtrlId = $GUI_EVENT_CLOSE
            ; MsgBox($MB_SYSTEMMODAL, "Close Pressed", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle)
            Exit

    EndSelect
EndFunc   ;==>SpecialEvents


$ROW=7

$CompA = StringSplit($CompList, ",")
For $i=1 to $CompA[0]
   Local $Line = Int( $i / $ROW)
   Local $Mod = Mod($i ,$ROW)-1
   Local $nameA=StringSplit($CompA[$i], "|")
   Local $okBtn = GUICtrlCreateButton( $nameA[0]=1? $nameA[1] : $nameA[2], 10+70*$Mod, 70+45*$Line, 60)
   GUICtrlSetTip(-1, $nameA[1])
   GUICtrlSetColor(-1, 0x000099)
   GUICtrlSetStyle(-1, $BS_FLAT)
   GUICtrlSetFont(-1, 10, 400, 0, "SimHei")

   $dict.Add($okBtn, $nameA[1])
   GUICtrlSetOnEvent($okBtn, "OKButton")
Next

GUISetState(@SW_SHOW)



While 1
   Sleep(200)
WEnd

Func OKButton()
    Run("Explorer.exe ""\\" & $dict.Item(@GUI_CtrlId) & """" )
    Exit
EndFunc   ;==>CLOSEButton

