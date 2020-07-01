//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 02/27/19, 08:49:20
  // ----------------------------------------------------
  // Method: setInitialToEmail
  // Description
  //     This method is called from the email editor once during On Load event.
  //     From the given email addresses, they are broken up and each email is
  //     placed as a selectable token in the the TO field. It then 
  //     resizes the the token (button) and rectangle objects to fit
  //     the viewable area.
  //
  // Parameters
  //    $1    -    Email address(es)
  //
  //     Input email addresses must be separated by ";"
  // ----------------------------------------------------

C_TEXT:C284($1;$objName_t;$curObject_t;$objName_t)
C_LONGINT:C283(dupToCount_l;$l;$t;$r;$b;$l2;$t2;$r2;$b2;$bestW;$bestH;$i;$ll;$tt;$level)

C_COLLECTION:C1488($email_c)
$email_c:=Split string:C1554($1;";")
COLLECTION TO ARRAY:C1562($email_c;toAddress_at)

OBJECT GET COORDINATES:C663(*;"toRect";$l;$t;$r;$b)
$ll:=$l
$tt:=$t
$level:=1

OBJECT SET VISIBLE:C603(*;"addrToButton@";False:C215)

$curObject_t:="toField"

toAddress_t:=""
For ($i;1;Size of array:C274(toAddress_at))
	
	If ($i>dupToCount_l)
		dupToCount_l:=dupToCount_l+1
		$objName_t:="addrToButton"+String:C10($i)
		OBJECT DUPLICATE:C1111(*;"addrToButton0";$objName_t)
	Else 
		$objName_t:="addrToButton"+String:C10($i)
	End if 
	
	OBJECT SET VISIBLE:C603(*;$objName_t;True:C214)
	OBJECT SET TITLE:C194(*;$objName_t;toAddress_at{$i})
	OBJECT Get pointer:C1124(Object named:K67:5;$objName_t)->:=0
	OBJECT GET BEST SIZE:C717(*;$objName_t;$bestW;$bestH)
	
	If (($l+$bestW+4)>$r)
		$l:=$ll
		$t:=$t+30
		$level:=$level+1
		OBJECT SET COORDINATES:C1248(*;"toRect";$l;$tt;$r;$tt+(30*$level))
		
	End if 
	
	OBJECT SET COORDINATES:C1248(*;$objName_t;$l+4;$t+4;$l+$bestW+4;$t+$bestH+4)
	
	$l:=$l+$bestW+4
	
	toAddress_t:=toAddress_t+toAddress_at{$i}+";"
End for 

OBJECT GET COORDINATES:C663(*;$curObject_t;$l2;$t2;$r2;$b2)
OBJECT SET COORDINATES:C1248(*;$curObject_t;$l+4;$t+8;$r2;$t+24)
If (($t+$bestH+8)-$tt<30)
	OBJECT SET COORDINATES:C1248(*;"toRect";$ll;$tt;$r;$tt+30)
Else 
	OBJECT SET COORDINATES:C1248(*;"toRect";$ll;$tt;$r;$t+$bestH+8)
End if 

Form:C1466.to:=""
GOTO OBJECT:C206(*;$curObject_t)

OBJECT GET COORDINATES:C663(*;"toRect";$l;$t;$r;$b)
Form:C1466.height:=(30*$level)+($level*2)-$level+1

CALL FORM:C1391(Current form window:C827;"adjustUI")
