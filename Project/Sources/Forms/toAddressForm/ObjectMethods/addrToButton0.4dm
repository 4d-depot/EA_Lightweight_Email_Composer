C_LONGINT:C283(dupToCount_l;$i;$lastValue_l)
C_TEXT:C284(clickedToButton_t)

$lastValue_l:=OBJECT Get pointer:C1124(Object named:K67:5;OBJECT Get name:C1087(Object current:K67:2))->

For ($i;1;dupToCount_l)
	OBJECT Get pointer:C1124(Object named:K67:5;"addrToButton"+String:C10($i))->:=0
End for 

If ($lastValue_l=1)
	clickedToButton_t:=OBJECT Get name:C1087(Object current:K67:2)
	OBJECT Get pointer:C1124(Object named:K67:5;clickedToButton_t)->:=1
Else 
	clickedToButton_t:=""
End if 

GOTO OBJECT:C206(*;"toField")