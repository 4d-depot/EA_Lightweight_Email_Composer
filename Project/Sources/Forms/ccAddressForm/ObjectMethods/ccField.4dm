var $update_b : Boolean
var $bestW; $bestH; $l; $t; $r; $b; $delIndex_l; $level : Integer
var $address_t : Text

Case of 
	: (Form event code:C388=On Before Keystroke:K2:6)
		If (Character code:C91(Keystroke:C390)=Backspace key:K12:29)
			If (Get edited text:C655="")
				If (Storage:C1525.emailComposer.cc.length>0)
					Use (Storage:C1525.emailComposer)
						If (Storage:C1525.emailComposer.clickedCcButton#"")
							$delIndex_l:=Num:C11(Storage:C1525.emailComposer.clickedCcButton)
						Else 
							$delIndex_l:=Storage:C1525.emailComposer.cc.length
						End if 
						Storage:C1525.emailComposer.cc.remove($delIndex_l-1)
					End use 
					$update_b:=True:C214
				End if 
			End if 
		End if 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		$address_t:=Get edited text:C655
		If ($address_t#"")
			Use (Storage:C1525.emailComposer)
				Storage:C1525.emailComposer.cc.push($address_t)
			End use 
		End if 
		$update_b:=True:C214
		
End case 

If ($update_b)
	
	resizeCcForm
	
End if 

Use (Storage:C1525.emailComposer)
	Storage:C1525.emailComposer.clickedCcButton:=""
End use 