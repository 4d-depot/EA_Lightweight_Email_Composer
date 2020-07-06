C_LONGINT:C283(dupCcCount_l;$i;$lastValue_l)
C_TEXT:C284(clickedCcButton_t)

$lastValue_l:=OBJECT Get pointer:C1124(Object named:K67:5;OBJECT Get name:C1087(Object current:K67:2))->

For ($i;1;dupCcCount_l)
	OBJECT Get pointer:C1124(Object named:K67:5;"addrCcButton"+String:C10($i))->:=0
End for 

If ($lastValue_l=1)
	clickedCcButton_t:=OBJECT Get name:C1087(Object current:K67:2)
	OBJECT Get pointer:C1124(Object named:K67:5;clickedCcButton_t)->:=1
Else 
	clickedCcButton_t:=""
End if 

GOTO OBJECT:C206(*;"ccField")