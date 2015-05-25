_control = _this select 0;
_button = _this select 1;
switch (_button) do {
    case 0: { // Toggle AI BUTTON
        if (KGE_Spectator_AllowAI) then {
        	KGE_Spectator_playersOnly = !KGE_Spectator_playersOnly;

        	if(KGE_Spectator_playersOnly) then { _control ctrlSetText "Show AI";}
        	else { _control ctrlSetText "Hide AI";};
        } else {
            Hint localize "STR_Spectator_NotAllowed_ShowAI";
        };
    };
    case 2: {
        if (KGE_Spectator_AllowTags) then {
            KGE_Spectator_toggleTags = !KGE_Spectator_toggleTags;

            if(KGE_Spectator_toggleTags) then {_control ctrlSetText "Hide Tags"}
            else {_control ctrlSetText "Show Tags"};
        } else {
            Hint localize "STR_Spectator_NotAllowed_ShowTags";
        };
    };
};