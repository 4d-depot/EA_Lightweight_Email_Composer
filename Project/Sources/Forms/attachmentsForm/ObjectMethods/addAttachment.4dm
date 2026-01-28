ARRAY TEXT($selected_at; 0)
var $doc_t; $path : Text
var $i; $foundIndex : Integer
$doc_t:=Select document(System folder(Documents folder); "*"; "Select attachments"; \
Multiple files+Package open+Use sheet window; $selected_at)
If (OK=1)
	For ($i; 1; Size of array($selected_at))
		$path:=$selected_at{$i}
		Use (Storage.emailComposer)
			$foundIndex:=Storage.emailComposer.attachments.indexOf($path)
			If ($foundIndex=-1)
				Storage.emailComposer.attachments.push($path)
			End if
		End use
	End for

	// Sync collection to array for dropdown display
	COLLECTION TO ARRAY:C1562(Storage:C1525.emailComposer.attachments; attachments_at)
End if

If (Storage.emailComposer.attachments.length>0)
	OBJECT SET ENABLED(*; "delAttachment"; True)
End if 