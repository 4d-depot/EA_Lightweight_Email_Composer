//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 02/27/19, 08:44:03
  // ----------------------------------------------------
  // Method: resizeCcForm
  // Description
  //     This method places each email token in the the CC field
  //     resize the the token (button) and rectangle objects to fit
  //     the viewable area.
  //
  // ----------------------------------------------------

C_TEXT:C284($curObject_t;$objName_t)
C_LONGINT:C283($1;$i;$ll;$tt;$level;$bestW;$bestH)

OBJECT GET COORDINATES:C663(*;"ccRect";$l;$t;$r;$b)

If (Count parameters:C259>=1)
	$r:=$1-5
End if 

$ll:=$l
$tt:=$t
$level:=1

OBJECT SET VISIBLE:C603(*;"addrCcButton@";False:C215)

$curObject_t:="ccField"

ccAddress_t:=""
For ($i;1;Size of array:C274(ccAddress_at))
	
	If ($i>dupCcCount_l)
		dupCcCount_l:=dupCcCount_l+1
		$objName_t:="addrCcButton"+String:C10($i)
		OBJECT DUPLICATE:C1111(*;"addrCcButton0";$objName_t)
	Else 
		$objName_t:="addrCcButton"+String:C10($i)
	End if 
	
	OBJECT SET VISIBLE:C603(*;$objName_t;True:C214)
	OBJECT SET TITLE:C194(*;$objName_t;ccAddress_at{$i})
	OBJECT Get pointer:C1124(Object named:K67:5;$objName_t)->:=0
	OBJECT GET BEST SIZE:C717(*;$objName_t;$bestW;$bestH)
	
	If (($l+$bestW+8)>$r)
		$l:=$ll
		$t:=$t+30
		$level:=$level+1
		OBJECT SET COORDINATES:C1248(*;"ccRect";$l;$tt;$r;$tt+(30*$level))
	End if 
	
	OBJECT SET COORDINATES:C1248(*;$objName_t;$l+4;$t+4;$l+$bestW+4;$t+$bestH+4)
	
	$l:=$l+$bestW+4
	
	ccAddress_t:=ccAddress_t+ccAddress_at{$i}+";"
End for 

OBJECT GET COORDINATES:C663(*;$curObject_t;$l2;$t2;$r2;$b2)
OBJECT SET COORDINATES:C1248(*;$curObject_t;$l+4;$t+8;$r2;$t+24)
If (($t+$bestH+8)-$tt<30)
	OBJECT SET COORDINATES:C1248(*;"ccRect";$ll;$tt;$r;$tt+30)
Else 
	OBJECT SET COORDINATES:C1248(*;"ccRect";$ll;$tt;$r;$t+$bestH+8)
End if 

Form:C1466.height:=(30*$level)+($level*2)-$level+1
Form:C1466.cc:=""
GOTO OBJECT:C206(*;$curObject_t)

CALL FORM:C1391(Current form window:C827;"adjustUI")
