
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_dismantle_s

Description:
    Fill me when you edit me !

Parameters:
    _flag - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_fob_dismantle_s;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_flag", objNull, [objNull]]
];

private _FOBname = _flag getVariable "btc_fob";
private _element = (btc_fobs select 0) find _FOBname;
private _pos = getPosASL _flag;

deleteVehicle _flag;
deleteVehicle ((btc_fobs select 1) deleteAt _element);

[btc_fob_mat, _pos, surfaceNormal _pos] call btc_fnc_log_create_s;

deleteMarker ((btc_fobs select 0) deleteAt _element);
