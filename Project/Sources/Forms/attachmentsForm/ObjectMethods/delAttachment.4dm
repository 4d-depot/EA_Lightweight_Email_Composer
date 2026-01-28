var $selectedIndex : Integer
var $ptr : Pointer

// Get pointer to the dropdown/listbox selection
$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "attachments")
$selectedIndex:=$ptr->

If ($selectedIndex>0) & ($selectedIndex<=Storage:C1525.emailComposer.attachments.length)
	Use (Storage:C1525.emailComposer)
		Storage:C1525.emailComposer.attachments.remove($selectedIndex-1)  // collection 0 based 
	End use 
	
	// Sync collection to array for dropdown display
	COLLECTION TO ARRAY:C1562(Storage:C1525.emailComposer.attachments; attachments_at)
End if 

If ($selectedIndex>Storage:C1525.emailComposer.attachments.length)
	$ptr->:=Storage:C1525.emailComposer.attachments.length
End if 

If (Storage:C1525.emailComposer.attachments.length=0)
	OBJECT SET ENABLED:C1123(*; "delAttachment"; False:C215)
End if 