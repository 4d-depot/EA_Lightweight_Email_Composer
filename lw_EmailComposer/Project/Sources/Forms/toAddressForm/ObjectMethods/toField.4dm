C_BOOLEAN:C305($update_b)
C_LONGINT:C283($bestW;$bestH;$l;$t;$r;$b;$delIndex_l;$level;dupToCount_l)
C_TEXT:C284($address_t)

Case of 
	: (Form event code:C388=On Load:K2:1)
		C_TEXT:C284(toAddress_t)
		ARRAY TEXT:C222(toAddress_at;0)
		dupToCount_l:=0
		toAddress_t:=""
		
	: (Form event code:C388=On Before Keystroke:K2:6)
		If (Character code:C91(Keystroke:C390)=Backspace key:K12:29)
			If (Get edited text:C655="")
				If (Size of array:C274(toAddress_at)>0)
					If (clickedToButton_t#"")
						$delIndex_l:=Num:C11(clickedToButton_t)
					Else 
						$delIndex_l:=Size of array:C274(toAddress_at)
					End if 
					DELETE FROM ARRAY:C228(toAddress_at;$delIndex_l;1)
					$update_b:=True:C214
				End if 
			End if 
		End if 
		
		
	: (Form event code:C388=On Data Change:K2:15)
		
		$address_t:=Get edited text:C655
		If ($address_t#"")
			APPEND TO ARRAY:C911(toAddress_at;$address_t)
		End if 
		$update_b:=True:C214
		
End case 

If ($update_b)
	
	resizeToForm 
	
End if 

clickedToButton_t:=""