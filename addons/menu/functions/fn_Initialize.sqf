/*
 * Author: 
 * 	Nikolauska
 *
 * Description:
 *	Creates KGE menu on KGE_UI and on ACE interact menu
 *
 */

// Main
/*********************************************************************************/
["KGE_Main", localize "STR_Core_InitUI_KGE_Main_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Main", (localize "STR_Core_InitUI_KGE_Main_Respawn" + " >") , {['KGE_Respawn'] call KGE_UI_fnc_OpenMenu}, false, "KGE_Respawn_InitializedPlayer", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Main", (localize "STR_Core_InitUI_KGE_Main_TeamRoster" + " >"), {['KGE_TeamRoster'] call KGE_UI_fnc_OpenMenu}, false, "KGE_TeamRoster_Initialized", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Main", (localize "STR_Core_InitUI_KGE_Main_Gear" + " >"), {['KGE_Gear'] call KGE_UI_fnc_OpenMenu}, false, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Main", (localize "STR_Core_InitUI_KGE_Main_Role" + " >"), {[] call KGE_Role_fnc_GetRole}, false, "KGE_Role_LocalRoleAdded", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Main", (localize "STR_Core_InitUI_KGE_Main_Admin" + " >"), {['KGE_Admin'] call KGE_UI_fnc_OpenMenu}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Main", localize "STR_Core_InitUI_KGE_Admin_UpdateLog", {[] spawn KGE_Debug_fnc_RequestLog}, false, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Respawn
/*********************************************************************************/
["KGE_Respawn", localize "STR_Core_InitUI_KGE_Respawn_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Respawn", localize "STR_Core_InitUI_KGE_Respawn_Left", {[] spawn KGE_Respawn_fnc_RespawnsLeft}, false, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// TeamRoster
/*********************************************************************************/
["KGE_TeamRoster", localize "STR_Core_InitUI_KGE_TeamRoster_Header"] call KGE_UI_fnc_AddMenu;
["KGE_TeamRoster", localize "STR_Core_InitUI_KGE_TeamRoster_Update", {[false] call KGE_TeamRoster_fnc_Update}, false, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_TeamRoster", localize "STR_Core_InitUI_KGE_TeamRoster_Hint", {[true] call KGE_TeamRoster_fnc_Update}, false, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Gear
/*********************************************************************************/
["KGE_Gear", localize "STR_Core_InitUI_KGE_Gear_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Gear", localize "STR_Core_InitUI_KGE_Gear_Update", {[] call KGE_Gear_fnc_CreateDiary}, false, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Gear", localize "STR_Core_InitUI_KGE_Gear_Magazines", {[] call KGE_Gear_fnc_GetMagazines}, false, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Admin
/*********************************************************************************/
["KGE_Admin", localize "STR_Core_InitUI_KGE_Admin_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Admin", (localize "STR_Core_InitUI_KGE_Admin_ReturnDead" + " >"), {['KGE_Admin_Respawn'] call KGE_UI_fnc_OpenMenu}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin", (localize "STR_Core_InitUI_KGE_Admin_Teleport" + " >"), {['KGE_Admin_Teleport'] call KGE_UI_fnc_OpenMenu}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin", localize "STR_Core_InitUI_KGE_Admin_Zeus", {[] call KGE_Zeus_fnc_ZeusClient}, true, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Admin Respawn
/*********************************************************************************/
["KGE_Admin_Respawn", localize "STR_Core_InitUI_KGE_AdminRespawn_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Admin_Respawn", localize "STR_Core_InitUI_KGE_AdminRespawn_All", {[[] call KGE_Core_fnc_GetDeadPlayers] call KGE_Respawn_fnc_ReturnAlive}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Respawn", (localize "STR_Core_InitUI_KGE_AdminRespawn_Side" + " >"), {["KGE_Admin_Respawn_Side"] call KGE_UI_fnc_OpenMenu}, true, ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Respawn", (localize "STR_Core_InitUI_KGE_AdminRespawn_Single" + " >"), {[] spawn KGE_Respawn_fnc_DeadUnitsMenu}, true, ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Admin Respawn Side
/*********************************************************************************/
["KGE_Admin_Respawn_Side", localize "STR_Core_InitUI_KGE_AdminRespawnSide_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Admin_Respawn_Side", localize "STR_Core_InitUI_KGE_AdminRespawnSide_Blufor", {[WEST] spawn KGE_Respawn_fnc_ReturnAlive}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Respawn_Side", localize "STR_Core_InitUI_KGE_AdminRespawnSide_Opfor", {[EAST] spawn KGE_Respawn_fnc_ReturnAlive}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Respawn_Side", localize "STR_Core_InitUI_KGE_AdminRespawnSide_Independent", {[INDEPENDENT] spawn KGE_Respawn_fnc_ReturnAlive}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Respawn_Side", localize "STR_Core_InitUI_KGE_AdminRespawnSide_Civilian", {[CIVILIAN] spawn KGE_Respawn_fnc_ReturnAlive}, true, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Admin Teleport
/*********************************************************************************/
["KGE_Admin_Teleport", localize "STR_Core_InitUI_KGE_AdminTeleport_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Admin_Teleport", localize "STR_Core_InitUI_KGE_AdminTeleport_All", {['KGE_Admin_Teleport_All'] call KGE_UI_fnc_OpenMenu}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Teleport", (localize "STR_Core_InitUI_KGE_AdminTeleport_Group" + " >"), {['KGE_Admin_Teleport_Group'] call KGE_UI_fnc_OpenMenu}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Teleport", (localize "STR_Core_InitUI_KGE_AdminTeleport_Single" + " >"), {['KGE_Admin_Teleport_Single'] call KGE_UI_fnc_OpenMenu}, true, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Admin Teleport All
/*********************************************************************************/
["KGE_Admin_Teleport_All", localize "STR_Core_InitUI_KGE_AdminTeleportAll_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Admin_Teleport_All", localize "STR_Core_InitUI_KGE_AdminTeleportAll_Map", {['MAPCLICK', 'ALL'] call KGE_Teleport_fnc_MenuHandler}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Teleport_All", localize "STR_Core_InitUI_KGE_AdminTeleportAll_Admin", {['ADMIN', 'ALL'] call KGE_Teleport_fnc_MenuHandler}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Teleport_All", localize "STR_Core_InitUI_KGE_AdminTeleportAll_Leader", {['LEADER', 'ALL'] call KGE_Teleport_fnc_MenuHandler}, true, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Admin Teleport Group
/*********************************************************************************/
["KGE_Admin_Teleport_Group", localize "STR_Core_InitUI_KGE_AdminTeleportGroup_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Admin_Teleport_Group", (localize "STR_Core_InitUI_KGE_AdminTeleportGroup_Map" + " >"), {['MAPCLICK', 'GROUP'] call KGE_Teleport_fnc_MenuHandler}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Teleport_Group", (localize "STR_Core_InitUI_KGE_AdminTeleportGroup_Admin" + " >"), {['ADMIN', 'GROUP'] call KGE_Teleport_fnc_MenuHandler}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Teleport_Group", (localize "STR_Core_InitUI_KGE_AdminTeleportGroup_Leader" + " >"), {['LEADER', 'GROUP'] call KGE_Teleport_fnc_MenuHandler}, true, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Admin Teleport Single
/*********************************************************************************/
["KGE_Admin_Teleport_Single", localize "STR_Core_InitUI_KGE_AdminTeleportSingle_Header"] call KGE_UI_fnc_AddMenu;
["KGE_Admin_Teleport_Single", (localize "STR_Core_InitUI_KGE_AdminTeleportSingle_Map" + " >"), {['MAPCLICK', 'SINGLE'] call KGE_Teleport_fnc_MenuHandler}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Teleport_Single", (localize "STR_Core_InitUI_KGE_AdminTeleportSingle_Admin" + " >"), {['ADMIN', 'SINGLE'] call KGE_Teleport_fnc_MenuHandler}, true, "", ""] call KGE_UI_fnc_AddInteraction;
["KGE_Admin_Teleport_Single", (localize "STR_Core_InitUI_KGE_AdminTeleportSingle_Leader" + " >"), {['LEADER', 'SINGLE'] call KGE_Teleport_fnc_MenuHandler}, true, "", ""] call KGE_UI_fnc_AddInteraction;
/*********************************************************************************/

// Generate this only if ace interact menu exists
if(["ace_interact_menu"] call KGE_Core_fnc_ClassExists) then {

private ["_adminActions", "_respawnActions", "_teleportActions", "_respawnActionsSide", "_teleportActionsAll", "_teleportActionsSingle"];

/*******************************************************************************/
// Equipment

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "ACE_Equipment"],
	(["KGE_Main_Gear","KGE Ammo Count","",{call KGE_Gear_fnc_GetMagazines},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

/*******************************************************************************/

/*******************************************************************************/
// Admin
[
	typeOf KGE_Player, 1, ["ACE_SelfActions"],
	(["KGE_Main_Admin","KGE Admin","",{},{call KGE_Core_fnc_isAdmin}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin"],
	(["KGE_Admin_Respawn","Return From Dead","",{},{!isNil "KGE_Respawn_InitializedPlayer"}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin"],
	(["KGE_Admin_Teleport","Teleport","",{},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin"],
	(["KGE_Admin_Zeus","Activate Zeus","",{call KGE_Zeus_fnc_ZeusClient},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;
/*******************************************************************************/

/*******************************************************************************/
// Respawn

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Respawn"],
	(["KGE_Admin_Respawn_All","All","",{[call KGE_Core_fnc_GetDeadPlayers] call KGE_Respawn_fnc_ReturnAlive},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Respawn"],
	(["KGE_Admin_Respawn_Side","Side","",{},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Respawn"],
	(["KGE_Admin_Respawn_Single","Single Player","",{call KGE_Respawn_fnc_DeadUnitsMenu},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

/*******************************************************************************/

/*******************************************************************************/
// Respawn Side

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Respawn", "KGE_Admin_Respawn_Side"],
	(["KGE_Admin_Respawn_Side_West","West","",{[West] call KGE_Respawn_fnc_ReturnAlive},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Respawn", "KGE_Admin_Respawn_Side"],
	(["KGE_Admin_Respawn_Side_West","East","",{[East] call KGE_Respawn_fnc_ReturnAlive},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Respawn", "KGE_Admin_Respawn_Side"],
	(["KGE_Admin_Respawn_Side_West","Independent","",{[Independent] call KGE_Respawn_fnc_ReturnAlive},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Respawn", "KGE_Admin_Respawn_Side"],
	(["KGE_Admin_Respawn_Side_West","Civilian","",{[Civilian] call KGE_Respawn_fnc_ReturnAlive},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

/*******************************************************************************/

/*******************************************************************************/
// Teleport
[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Teleport"],
	(["KGE_Admin_Teleport_All","All","",{},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Teleport"],
	(["KGE_Admin_Teleport_Single","Single Player","",{},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;
/*******************************************************************************/

/*******************************************************************************/
// Teleport All
[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Teleport", "KGE_Admin_Teleport_All"],
	(["KGE_Admin_Teleport_All_Map","To Map Position","",{[2] call KGE_Teleport_fnc_AllTeleport},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Teleport", "KGE_Admin_Teleport_All"],
	(["KGE_Admin_Teleport_All_Admin","To My Position","",{[1] call KGE_Teleport_fnc_AllTeleport},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Teleport", "KGE_Admin_Teleport_All"],
	(["KGE_Admin_Teleport_All_Group","To Group Leader","",{[0] call KGE_Teleport_fnc_AllTeleport},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;
/*******************************************************************************/

/*******************************************************************************/
// Teleport Single
[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Teleport", "KGE_Admin_Teleport_Single"],
	(["KGE_Admin_Teleport_All_Map","To Map Position","",{[2, 'SINGLE'] call KGE_Teleport_fnc_CreateMenuPlayerList},{true}, {}] call ace_interact_menu_fnc_createAction)	
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Teleport", "KGE_Admin_Teleport_Single"],
	(["KGE_Admin_Teleport_All_Admin","To My Position","",{[0, 'SINGLE'] call KGE_Teleport_fnc_CreateMenuPlayerList},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;

[
	typeOf KGE_Player, 1, ["ACE_SelfActions", "KGE_Main_Admin", "KGE_Admin_Teleport", "KGE_Admin_Teleport_Single"],
	(["KGE_Admin_Teleport_All_Group","To Group Leader","",{[1, 'SINGLE'] call KGE_Teleport_fnc_CreateMenuPlayerList},{true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;
/*******************************************************************************/

};