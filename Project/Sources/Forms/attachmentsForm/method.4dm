// Updated by Soukaina BACHIKH
Case of 
	: (Form event code:C388=On Load:K2:1)
		COLLECTION TO ARRAY:C1562(Storage:C1525.emailComposer.attachments; attachments_at)
		
		// Make sure specific form object appears 
		// properly when opening cross-platform
		If (Is Windows:C1573)
			OBJECT GET COORDINATES:C663(*; "attachments"; $l; $t; $r; $b)
			OBJECT SET COORDINATES:C1248(*; "attachments"; $l; $t-2; $r; $b-2)
		End if 
		
End case 