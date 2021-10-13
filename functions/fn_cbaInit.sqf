// Variables (Defaults)
weaponSlinged = false;
MS_varHolderWpn setVariable ["weaponAngle",180,true]; // Set this to around 190 for a more tilted angle!
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
// ^ ^ - 180 means the barrel tilts towards the head, + 180 means the barrel is tilted towards the feet.

mst_fnc_slingWeapon = {
	if (primaryWeapon player != "" && vehicle player == player) then {
		_var = MS_varHolderWpn getVariable "weaponAngle";
		magArray = magazines player;
		MS_wh = "GroundWeaponHolder_Scripted" createVehicle position player;

		wpn = primaryWeapon player;
		MS_wh attachTo [player, [0,0.77,0.3], "Spine3", true]; MS_wh setDir _var; MS_wh setVectorUp [-0.1,1,0.5];

		clearMagazineCargoGlobal player;

		player action ["DropWeapon", MS_wh, wpn];
		[] spawn {sleep 0.9,
			player switchMove "";
			clearItemCargoGlobal MS_wh;
			clearMagazineCargoGlobal MS_wh;
			hint "Mags Cleared";
			{
				player addMagazines [_x, 1];
			} forEach magArray;
			weaponSlinged = true;
		};
		titleText ["Weapon Slinged, Ready","PLAIN"];
	}; //else {
		//titleText ["You don't have a weapon!","PLAIN"];
	//};
};

mst_fnc_slingWeaponBack = {
	if (primaryWeapon player != "" && vehicle player == player) then {
	currentMag = currentMagazine player;
	magArray = magazines player;
	MS_wh = "GroundWeaponHolder_Scripted" createVehicle position player; 
	
	wpn = primaryWeapon player; 
	MS_wh attachTo [player, [-0.13,0.45,0], "Spine3", true]; MS_wh setDir 15; MS_wh setVectorUp [-0.1,2,0.5]; 

	clearMagazineCargoGlobal player;
	
	player action ["DropWeapon", MS_wh, wpn]; 
	[] spawn {sleep 0.9,
		player switchMove "";
		clearItemCargoGlobal MS_wh;
		clearMagazineCargoGlobal MS_wh;
		hint "Mags Cleared";
		{
			player addMagazines [_x, 1];
		} forEach magArray;
		weaponSlinged = true;
	};
	titleText ["Weapon Slinged, Ready","PLAIN"];
	}; //else {
		//titleText ["You don't have a weapon!","PLAIN"];
	//};
};


["[MS] Weapon Slinging", "SlingChest", ["Sling Weapon > Chest", "DO NOT put both keybinds to the same thing."], {
    call mst_fnc_slingWeapon;
}, {
    ""
}, [DIK_TAB, [false, false, false]]] call CBA_fnc_addKeybind;

["[MS] Weapon Slinging", "SlingBack", ["Sling Weapon > Back", "DO NOT put both keybinds to the same thing."], {
    call mst_fnc_slingWeaponBack;
}, {
    ""
}, [DIK_T, [false, false, false]]] call CBA_fnc_addKeybind;

["[MS] Weapon Slinging", "SlingRetrieve", ["Sling Weapon > Retrieve", "DO NOT put both keybinds to the same thing."], {
	if (primaryWeapon player == "" && vehicle player == player) then {
		player action ["TakeWeapon", MS_wh, wpn];
		player action ["SwitchWeapon", player, player, 3];
		[] spawn {
			sleep 0.9;
			player switchMove "amovpercmstpsraswrfldnon";
		};
		weaponSlinged = false;
	titleText ["Weapon Retrieved, Ready","PLAIN"];
	} else {
		titleText ["You already have a weapon or you're in a vehicle!","PLAIN"];
	};
}, {
    ""
}, [DIK_F, [false, false, false]]] call CBA_fnc_addKeybind;

