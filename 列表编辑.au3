#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <StaticConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>

#include <Array.au3>

Opt("GUIOnEventMode", 1) ; Change to OnEvent mode
Opt("GUIResizeMode", 1)


$CompList = IniRead("system\system.ini", "CompList", "List", "")

GUICreate("联润局域网管理", 500, 300)
GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")
Func SpecialEvents()
    Select
        Case @GUI_CtrlId = $GUI_EVENT_CLOSE
            ; MsgBox($MB_SYSTEMMODAL, "Close Pressed", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle)
            Exit

    EndSelect
EndFunc   ;==>SpecialEvents

HotKeySet("^s", "OKButton") ; Ctrl+s

Global $CompStr = StringReplace($CompList, ",", @CRLF)

GUICtrlCreateLabel("电脑列表编辑", 20, 10, 400, 20)
GUICtrlSetFont(-1, 12, 700, 0, "SimHei")

Local $edit = GUICtrlCreateEdit($CompStr, 10, 30, 450, 200)

Local $okBtn = GUICtrlCreateButton("确定", 10,260 , 60)
GUICtrlSetOnEvent($okBtn, "OKButton")


GUISetState(@SW_SHOW)

Func OKButton()
   Local $str = GUICtrlRead($edit)
   $str = StringRegExpReplace($str,"^$", "")
   $str = StringRegExpReplace($str,"(?m)\n+$", @CRLF)
   $str = StringRegExpReplace($str,"(?m)^\s+|\\+", "")
   $str = StringReplace($str, @CRLF, ",")
   IniWrite("system\system.ini", "CompList", "List", $str   )
   Exit
EndFunc   ;==>CLOSEButton



While 1
   Sleep(200)
WEnd

