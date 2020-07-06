  // Make sure specific form object appears 
  // properly when opening cross-platform
If (Is Windows:C1573)
	OBJECT GET COORDINATES:C663(*;"attachments";$l;$t;$r;$b)
	OBJECT SET COORDINATES:C1248(*;"attachments";$l;$t-2;$r;$b-2)
	
End if 