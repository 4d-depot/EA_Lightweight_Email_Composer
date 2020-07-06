C_OBJECT:C1216($wpObjParams)

$wpObjParams:=New object:C1471
$wpObjParams.host:=Form:C1466.host
$wpObjParams.port:=Form:C1466.port
$wpObjParams.from:=Form:C1466.from
$wpObjParams.user:=Form:C1466.user
$wpObjParams.password:=Form:C1466.password
$wpObjParams.log:=Form:C1466.log
$wpObjParams.to:=toAddress_t
$wpObjParams.cc:=ccAddress_t
$wpObjParams.subject:=Form:C1466.subject

If (importance_t#"")
	$wpObjParams.importance:=importance_t
End if 

OB SET ARRAY:C1227($wpObjParams;"attachments";attachedPath_at)

If (wp_SendMail (WriteProArea;$wpObjParams)=1)
	CANCEL:C270
Else 
	
End if 
