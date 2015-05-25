/*
 * Author: nikolauska
 *
 * Turns safety on or off
 *
 * Argument:
 * 0: Sides (Array, Side)
 *
 * Return value:
 *
 */

switch (_this select 0) do
{
	//Turn safety on
	case true:
	{
		//Delete bullets from fired weapons
		KGE_SafeStart_SafetyEH = KGE_Player addEventHandler["Fired", {
			deletevehicle (_this select 6);

    		KGE_Player setAmmo [(currentWeapon KGE_Player), (KGE_Player ammo (currentWeapon KGE_Player)) + 1];

			hint parseText "<t align='center'>HUOM!</t><br/><br/><t align='center'>SafeStartissa ampuminen ei ole sallittu!</t>"
		}];

		//Make playable units invincible, clientside
		{
			_x allowDamage false;
		} foreach ([] call KGE_Core_fnc_GetAlivePlayers);
	};

	//Turn safety off
	case false:
	{
		//Allow player to fire weapons
		if(!isNil "KGE_SafeStart_SafetyEH") then {
			KGE_Player removeEventHandler ["Fired", KGE_SafeStart_SafetyEH];
		};

		//Make playable units vulnerable, clientside
		{
			_x allowDamage true;
		} foreach ([] call KGE_Core_fnc_GetAlivePlayers);
	};
};
