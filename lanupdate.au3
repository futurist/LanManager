#Include "Include\File.au3"
#Include "Include\Array.au3"

Func CopyAllFiles($fromDir, $toDir)
   Local $files = _FileListToArray($fromDir, "*")
   for $i=1 to $files[0]
	  $ret=FileCopy(  $fromDir & "\" & $files[$i] ,  $toDir & "\" & $files[$i], 9)
	  ; Msgbox(0, $fromDir & "\" & $files[$i] ,  $ret & $toDir & "\" & $files[$i] )
   Next
EndFunc

$Dest = "D:\LANS"
$PATH = IniRead($Dest & "\system.ini", "Update", "Path", "\\pc33\system")

$curVer = Number(IniRead($Dest & "\system.ini", "Update", "Ver", 1.0))
$ver = Number(IniRead($PATH & "\system.ini", "Update", "Ver", 0.1))

If $curVer<=$ver Then
   Sleep(100)
   DirCopy($PATH, $Dest, 1)
   ;CopyAllFiles($PATH, $Dest)
   ;MsgBox(0,"","������")
EndIf

FileCreateShortcut($Dest & "\exec.exe", @StartupCommonDir & "\lanupdate.lnk", $Dest, "lanupdate.au3", "�鿴����������", $Dest & "\" & "lans.ico")
FileCreateShortcut($Dest & "\exec.exe", @DesktopDir & "\�鿴������.lnk", $Dest, "lanstart.au3", "�鿴������", $Dest & "\" & "lans.ico")

Exit

