ARRAY TEXT:C222($selected_at;0)
C_TEXT:C284($doc_t)
C_LONGINT:C283($i;$foundat_l)
$doc_t:=Select document:C905(System folder:C487(Documents folder:K41:18);"*";"Select attachments";\
Multiple files:K24:7+Package open:K24:8+Use sheet window:K24:11;$selected_at)
If (OK=1)
	For ($i;1;Size of array:C274($selected_at))
		$foundat_l:=Find in array:C230(attachedPath_at;$selected_at{$i})
		If ($foundat_l=-1)
			APPEND TO ARRAY:C911(attachedPath_at;$selected_at{$i})
			attachedPath_at:=Size of array:C274(attachedPath_at)
		End if 
	End for 
End if 

If (Size of array:C274(attachedPath_at)>0)
	OBJECT SET ENABLED:C1123(*;"delAttachment";True:C214)
End if 