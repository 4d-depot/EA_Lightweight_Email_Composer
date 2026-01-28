var $wpObjParams : Object
var $attachments_c : Collection
var $path : Text

$wpObjParams:=New object
$wpObjParams.host:=Form.host
$wpObjParams.port:=Form.port
$wpObjParams.from:=Form.from
$wpObjParams.user:=Form.user
$wpObjParams.password:=Form.password
$wpObjParams.log:=Form.log
$wpObjParams.to:=Storage.emailComposer.toAddressText
$wpObjParams.cc:=Storage.emailComposer.ccAddressText
$wpObjParams.subject:=Form.subject

If (Storage.emailComposer.importance#"")
	$wpObjParams.importance:=Storage.emailComposer.importance
End if

// Convert shared collection to regular collection for email sending
$attachments_c:=New collection
For each ($path; Storage.emailComposer.attachments)
	$attachments_c.push($path)
End for each
$wpObjParams.attachments:=$attachments_c

If (wp_SendMail(WriteProArea; $wpObjParams)=1)
	CANCEL
Else

End if 
