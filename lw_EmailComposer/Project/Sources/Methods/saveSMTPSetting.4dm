//%attributes = {"invisible":true,"executedOnServer":true}
C_OBJECT:C1216($1;$smtp_o)
C_TEXT:C284($path_t;$smtp_t)
C_LONGINT:C283($foundat_l)

If (Count parameters:C259>=1)
	$smtp_o:=$1
	$path_t:=Get 4D folder:C485(Database folder:K5:14;*)+"smtp"+Folder separator:K24:12
	If (Test path name:C476($path_t)#Is a folder:K24:2)
		CREATE FOLDER:C475($path_t)
	End if 
	
	GET USER LIST:C609($unames_at;$unums_al)
	$foundat_l:=Find in array:C230($unames_at;Current user:C182)
	$path_t:=$path_t+String:C10($unums_al{$foundat_l})+".json"
	
	If (Value type:C1509($smtp_o.port)=Is text:K8:3)
		$smtp_o.port:=Num:C11($smtp_o.port)
	End if 
	
	TEXT TO DOCUMENT:C1237($path_t;JSON Stringify:C1217($smtp_o;*);"UTF-8")
End if 