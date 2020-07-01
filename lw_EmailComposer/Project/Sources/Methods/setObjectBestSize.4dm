//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 02/27/19, 08:54:52
  // ----------------------------------------------------
  // Method: setObjectBestSize
  // Description
  //     For a given form object name, make sure it is being
  //     displayed with the best size (no cut off from the bottom)
  //
  // Parameters
  //    $1    -    Object name
  // ----------------------------------------------------

C_LONGINT:C283($l;$t;$r;$b;$bw;$bh)
C_TEXT:C284($1)
If (Count parameters:C259>=1)
	OBJECT GET COORDINATES:C663(*;$1;$l;$t;$r;$b)
	OBJECT GET BEST SIZE:C717(*;$1;$bw;$bh;$r-$l)
	OBJECT SET COORDINATES:C1248(*;$1;$l;$t;$r;$t+$bh)
End if 