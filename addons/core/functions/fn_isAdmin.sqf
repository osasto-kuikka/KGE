/*
 * Author: nikolauska
 *
 * Checks if local unit is admin
 *
 * Argument:
 *
 * Return value:
 * Bool
 */

if(serverCommandAvailable "#kick" OR {isServer}) then {true} else {false}