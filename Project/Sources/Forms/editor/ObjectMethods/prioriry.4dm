var $selected_l : Integer
var $choice_t : Text
$choice_t:="High priority;No prioriry;Low priority"
$selected_l:=Pop up menu($choice_t)
Case of
	: ($selected_l=1)
		OBJECT SET TITLE(*; "priorityLabel"; "High priority")
		OBJECT SET VISIBLE(*; "noPriority"; False)
		OBJECT SET VISIBLE(*; "highPArr@"; True)
		OBJECT SET VISIBLE(*; "lowPArr@"; False)
		Use (Storage.emailComposer)
			Storage.emailComposer.importance:="High"
		End use

	: ($selected_l=2)
		OBJECT SET TITLE(*; "priorityLabel"; "No priority")
		OBJECT SET VISIBLE(*; "noPriority"; True)
		OBJECT SET VISIBLE(*; "highPArr@"; False)
		OBJECT SET VISIBLE(*; "lowPArr@"; False)
		Use (Storage.emailComposer)
			Storage.emailComposer.importance:=""
		End use

	: ($selected_l=3)
		OBJECT SET TITLE(*; "priorityLabel"; "Low priority")
		OBJECT SET VISIBLE(*; "noPriority"; False)
		OBJECT SET VISIBLE(*; "highPArr@"; False)
		OBJECT SET VISIBLE(*; "lowPArr@"; True)
		Use (Storage.emailComposer)
			Storage.emailComposer.importance:="Low"
		End use

End case 