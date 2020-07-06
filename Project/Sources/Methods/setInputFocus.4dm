//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1;$obj_t;$targetObj_t)
C_LONGINT:C283($i)

If (Count parameters:C259>=1)
	$targetObj_t:=$1
	For ($i;1;5)
		$obj_t:="r"+String:C10($i)
		If ($targetObj_t=$obj_t)
			OBJECT SET RGB COLORS:C628(*;$obj_t;0x004A74B0;0x00EAF5FF)
		Else 
			OBJECT SET RGB COLORS:C628(*;$obj_t;0x00C0C0C0;0x00FFFFFF)
		End if 
	End for 
End if 