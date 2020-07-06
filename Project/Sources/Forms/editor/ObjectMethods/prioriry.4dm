C_LONGINT:C283($selected_l)
C_TEXT:C284($choice_t)
$choice_t:="High priority;No prioriry;Low priority"
$selected_l:=Pop up menu:C542($choice_t)
Case of 
	: ($selected_l=1)
		OBJECT SET TITLE:C194(*;"priorityLabel";"High priority")
		OBJECT SET VISIBLE:C603(*;"noPriority";False:C215)
		OBJECT SET VISIBLE:C603(*;"highPArr@";True:C214)
		OBJECT SET VISIBLE:C603(*;"lowPArr@";False:C215)
		importance_t:="High"
		
	: ($selected_l=2)
		OBJECT SET TITLE:C194(*;"priorityLabel";"No priority")
		OBJECT SET VISIBLE:C603(*;"noPriority";True:C214)
		OBJECT SET VISIBLE:C603(*;"highPArr@";False:C215)
		OBJECT SET VISIBLE:C603(*;"lowPArr@";False:C215)
		importance_t:=""
		
	: ($selected_l=3)
		OBJECT SET TITLE:C194(*;"priorityLabel";"Low priority")
		OBJECT SET VISIBLE:C603(*;"noPriority";False:C215)
		OBJECT SET VISIBLE:C603(*;"highPArr@";False:C215)
		OBJECT SET VISIBLE:C603(*;"lowPArr@";True:C214)
		importance_t:="Low"
		
End case 