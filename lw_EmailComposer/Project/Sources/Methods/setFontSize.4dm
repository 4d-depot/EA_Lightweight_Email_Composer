//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 02/27/19, 08:47:02
  // ----------------------------------------------------
  // Method: setFontSize
  // Description
  //    Generic method to set the font size of a selected
  //     text in the 4D Write Pro area
  //
  // Parameters
  //    $1    -    Size
  // ----------------------------------------------------

C_LONGINT:C283($1)
C_OBJECT:C1216($range_o)
$range_o:=WP Selection range:C1340(*;"WriteProArea")
WP SET ATTRIBUTES:C1342($range_o;wk font size:K81:66;$1)