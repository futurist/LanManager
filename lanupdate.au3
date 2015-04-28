#Include <File.au3>
#Include <Array.au3>

Func CopyAllFiles($fromDir, $toDir)
   Local $files = _FileListToArray($fromDir, "*")
   for $i=1 to $files[0]
	  If $files[$i]="update1.exe" Then ContinueLoop
	  $ret=FileCopy(  $fromDir & "\" & $files[$i] ,  $toDir & "\" & $files[$i], 9)
	  ; Msgbox(0, $fromDir & "\" & $files[$i] ,  $ret & $toDir & "\" & $files[$i] )
   Next
EndFunc

$Dest = "D:\LANS"
$PATH = IniRead($Dest & "\system.ini", "Update", "Path", "\\pc33\system")

If @ScriptName<>"update1.exe" Then
   $ret = FileCopy( @ScriptFullPath,  @ScriptDir & "\" & "update1.exe", 9 )
   if $ret=1 Then
	  ShellExecute( @ScriptDir & "\update1.exe" )
	  Exit
   EndIf
EndIf

$curVer = Number(IniRead($Dest & "\system.ini", "Update", "Ver", 1.0))
$ver = Number(IniRead($PATH & "\system.ini", "Update", "Ver", 0.1))

If $curVer<=$ver Then
   Sleep(100)
   CopyAllFiles($PATH, $Dest)
   ;MsgBox(0,"","已升级")
EndIf

FileCreateShortcut($Dest & "\lanupdate.exe", @StartupCommonDir & "\lanupdate.lnk", $Dest)
FileCreateShortcut($Dest & "\lanstart.exe", @DesktopDir & "\查看局域网.lnk", $Dest)

Exit

