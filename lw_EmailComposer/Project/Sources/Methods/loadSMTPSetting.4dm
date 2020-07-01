//%attributes = {"invisible":true,"executedOnServer":true}

  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 05-15-20, 11:08:51
  // ----------------------------------------------------
  // Method: loadSMTPSetting
  // Description
  //    Load and return the SMTP Settings for the current user
  //
  // ----------------------------------------------------

C_OBJECT:C1216($0;$smtp_o)
C_TEXT:C284($path_t;$smtp_t)
C_LONGINT:C283($foundat_l)

$path_t:=Get 4D folder:C485(Database folder:K5:14;*)+"smtp"+Folder separator:K24:12
If (Test path name:C476($path_t)#Is a folder:K24:2)
	CREATE FOLDER:C475($path_t)
End if 

GET USER LIST:C609($unames_at;$unums_al)
$foundat_l:=Find in array:C230($unames_at;Current user:C182)
$path_t:=$path_t+String:C10($unums_al{$foundat_l})+".json"

If (Test path name:C476($path_t)=Is a document:K24:1)
	C_LONGINT:C283(Error)
	Error:=0
	$smtp_t:=Document to text:C1236($path_t)
	ON ERR CALL:C155("onSmtpErr")
	$smtp_o:=JSON Parse:C1218($smtp_t)
	ON ERR CALL:C155("")
	If (Error#0)
		$smtp_o:=New object:C1471("host";"";"port";25;"from";"";"user";"";"password";"";"log";False:C215)
	End if 
End if 

$0:=$smtp_o