C_BOOLEAN:C305($update_b)
C_LONGINT:C283($bestW;$bestH;$l;$t;$r;$b;$delIndex_l;$level;dupCcCount_l)

Case of 
	: (Form event code:C388=On Load:K2:1)
		C_TEXT:C284(ccAddress_t)
		ARRAY TEXT:C222(ccAddress_at;0)
		dupCcCount_l:=0
		ccAddress_t:=""
		
	: (Form event code:C388=On Before Keystroke:K2:6)
		If (Character code:C91(Keystroke:C390)=Backspace key:K12:29)
			If (Get edited text:C655="")
				If (Size of array:C274(ccAddress_at)>0)
					If (clickedCcButton_t#"")
						$delIndex_l:=Num:C11(clickedCcButton_t)
					Else 
						$delIndex_l:=Size of array:C274(ccAddress_at)
					End if 
					DELETE FROM ARRAY:C228(ccAddress_at;$delIndex_l;1)
					$update_b:=True:C214
				End if 
			End if 
		End if 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		APPEND TO ARRAY:C911(ccAddress_at;Get edited text:C655)
		$update_b:=True:C214
		
End case 

If ($update_b)
	
	resizeCcForm 
	
End if 

clickedCcButton_t:=""