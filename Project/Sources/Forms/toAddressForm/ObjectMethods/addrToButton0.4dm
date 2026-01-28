var $i; $lastValue_l : Integer

$lastValue_l:=OBJECT Get pointer(Object named; OBJECT Get name(Object current))->

For ($i; 1; Storage.emailComposer.dupToCount)
	OBJECT Get pointer(Object named; "addrToButton"+String($i))->:=0
End for

If ($lastValue_l=1)
	Use (Storage.emailComposer)
		Storage.emailComposer.clickedToButton:=OBJECT Get name(Object current)
	End use
	OBJECT Get pointer(Object named; Storage.emailComposer.clickedToButton)->:=1
Else
	Use (Storage.emailComposer)
		Storage.emailComposer.clickedToButton:=""
	End use
End if

GOTO OBJECT(*; "toField")