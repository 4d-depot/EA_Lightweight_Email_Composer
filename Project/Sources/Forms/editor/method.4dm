//Updated by Soukaina BACHIKH
var $l; $t; $r; $b : Integer

Case of 
	: (Form event code:C388=On Load:K2:1)
		Use (Storage:C1525.emailComposer)
			Storage:C1525.emailComposer.importance:=""
		End use 
		
		WP SET ATTRIBUTES:C1342(WriteProArea; wk margin:K81:10; 0.2)
		
		var $range_o : Object
		$range_o:=WP Selection range:C1340(*; "WriteProArea")
		WP SET ATTRIBUTES:C1342($range_o; wk font size:K81:66; 12)
		
		var $defaultFont_t : Text
		$defaultFont_t:="Helvetica Neue"
		
		OBJECT SET FONT:C164(*; "fontFamily"; $defaultFont_t)
		WP SET ATTRIBUTES:C1342($range_o; wk font family:K81:65; $defaultFont_t)
		
		var $ptr : Pointer
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "fontFamily")
		$ptr->:=$defaultFont_t
		
		OBJECT SET ACTION:C1259(*; "fontSize"; ak font size:K76:87)
		
		// Make sure specific form object appears 
		// properly when opening cross-platform
		If (Is Windows:C1573)
			OBJECT GET COORDINATES:C663(*; "fontSize"; $l; $t; $r; $b)
			OBJECT SET COORDINATES:C1248(*; "fontSize"; $l; $t-2; $r; $b-2)  // Move up 2 pixels
		End if 
End case 