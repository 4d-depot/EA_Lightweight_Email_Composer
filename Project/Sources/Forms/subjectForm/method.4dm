setObjectBestSize ("subjectField")

  // Make sure specific form object appears 
  // properly when opening cross-platform
If (Is Windows:C1573)
	OBJECT GET COORDINATES:C663(*;"subjectField";$l;$t;$r;$b)
	OBJECT SET COORDINATES:C1248(*;"subjectField";$l;$t-3;$r;$b-3)
	
End if 