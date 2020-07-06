If (attachedPath_at>0) & (attachedPath_at<=Size of array:C274(attachedPath_at))
	DELETE FROM ARRAY:C228(attachedPath_at;attachedPath_at)
End if 
If (attachedPath_at>Size of array:C274(attachedPath_at))
	attachedPath_at:=Size of array:C274(attachedPath_at)
End if 
If (Size of array:C274(attachedPath_at)=0)
	OBJECT SET ENABLED:C1123(*;"delAttachment";False:C215)
End if 