setObjectBestSize ("toField")

  // Make sure specific form object appears 
  // properly when opening cross-platform
If (Is Windows:C1573)
	OBJECT GET COORDINATES:C663(*;"toField";$l;$t;$r;$b)
	OBJECT SET COORDINATES:C1248(*;"toField";$l;$t-3;$r;$b-3)
	
	OBJECT SET FORMAT:C236(*;"addrToButton0";";;;;;;7;;;;;;")
	OBJECT SET FONT SIZE:C165(*;"addrToButton0";13)
	
End if 