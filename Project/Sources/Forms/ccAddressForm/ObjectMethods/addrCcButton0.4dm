var $i; $lastValue_l : Integer

$lastValue_l:=OBJECT Get pointer(Object named; OBJECT Get name(Object current))->

For ($i; 1; Storage.emailComposer.dupCcCount)
	OBJECT Get pointer(Object named; "addrCcButton"+String($i))->:=0
End for

If ($lastValue_l=1)
	Use (Storage.emailComposer)
		Storage.emailComposer.clickedCcButton:=OBJECT Get name(Object current)
	End use
	OBJECT Get pointer(Object named; Storage.emailComposer.clickedCcButton)->:=1
Else
	Use (Storage.emailComposer)
		Storage.emailComposer.clickedCcButton:=""
	End use
End if

GOTO OBJECT(*; "ccField")