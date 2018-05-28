params ["_box", "_arsenalType", "_arsenalRestrict", "_arsenalData"];
_arsenalData params [["_weapons", []], ["_magazines", []], ["_items", []], ["_backpacks", []]];

//BIS Arsenal
if (_arsenalType < 3) then {
    if (_arsenalRestrict isEqualTo 1) then {
        //add
        [_box, _weapons, false, false] call BIS_fnc_addVirtualWeaponCargo;
        [_box, _magazines, false, false] call BIS_fnc_addVirtualMagazineCargo;
        [_box, _items, false, false] call BIS_fnc_addVirtualItemCargo;
        [_box, _backpacks, false, false] call BIS_fnc_addVirtualBackpackCargo;
    };

    // DO NOT WORK FOR BIS ARSENAL
    if (_arsenalRestrict isEqualTo 2) then {
        //remove
        [_box, _weapons, false] call BIS_fnc_removeVirtualWeaponCargo;
        [_box, _magazines, false] call BIS_fnc_removeVirtualMagazineCargo;
        [_box, _items, false] call BIS_fnc_removeVirtualItemCargo;
        [_box, _backpacks, false] call BIS_fnc_removeVirtualBackpackCargo;
    };
};

//ACE Arsenal
if (_arsenalType > 0) then {
    //add
    if (_arsenalRestrict isEqualTo 1) then {
        private _aceAdd = [];
        {_aceAdd append _x;} forEach [_weapons, _magazines, _items, _backpacks];
        [_box, _aceAdd] call ace_arsenal_fnc_addVirtualItems;
    };

    //remove
    if (_arsenalRestrict isEqualTo 2) then {
        private _aceRemove = [];
        {_aceRemove append _x;} forEach [_weapons, _magazines, _items, _backpacks];
        [_box, _aceRemove] call ace_arsenal_fnc_removeVirtualItems;
    };
};