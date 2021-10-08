MS_varHolderWpn = "CBA_B_InvisibleTargetVehicle" createVehicle position player;
MS_varHolderWpn setPos [0,0,0];

// Variables (Defaults)
weaponSlinged = false;
MS_varHolderWpn setVariable ["weaponAngle",180,true]; // Set this to around 190 for a more tilted angle!
// ^ ^ - 180 means the barrel tilts towards the head, + 180 means the barrel is tilted towards the feet.

mst_fnc_slingWeapon = {
	_var = MS_varHolderWpn getVariable "weaponAngle";
	magArray = magazines player;
    MS_wh = "GroundWeaponHolder_Scripted" createVehicle position player;

    wpn = primaryWeapon player;
    MS_wh attachTo [player, [0,0.77,0.3], "Spine3", true]; MS_wh setDir _var; MS_wh setVectorUp [-0.1,1,0.5];

    player action ["DropWeapon", MS_wh, wpn];
	[] spawn {sleep 0.9,
		player switchMove "";
		clearItemCargoGlobal MS_wh;
		clearMagazineCargoGlobal MS_wh;
		clearMagazineCargoGlobal player;
		hint "Mags Cleared";
		{
			player addMagazines [_x, 1];
		} forEach magArray;
		weaponSlinged = true;
	};
	titleText ["Weapon Slinged, Ready","PLAIN"];
};

mst_fnc_slingWeaponBack = {
	currentMag = currentMagazine player;
	magArray = magazines player;
	MS_wh = "GroundWeaponHolder_Scripted" createVehicle position player; 
	
	wpn = primaryWeapon player; 
	MS_wh attachTo [player, [-0.13,0.45,0], "Spine3", true]; MS_wh setDir 15; MS_wh setVectorUp [-0.1,2,0.5]; 
	
	player action ["DropWeapon", MS_wh, wpn]; 
	[] spawn {sleep 0.9,
		player switchMove "";
		clearItemCargoGlobal MS_wh;
		clearMagazineCargoGlobal MS_wh;
		clearMagazineCargoGlobal player;
		hint "Mags Cleared";
		{
			player addMagazines [_x, 1];
		} forEach magArray;
		weaponSlinged = true;
	};
	titleText ["Weapon Slinged, Ready","PLAIN"];
};

_action = ['Sling','Sling Weapon - Front','',{
	call mst_fnc_slingWeapon;
},
{!weaponSlinged && primaryWeapon player != ""}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['Sling','Sling Weapon - Back','',{
	call mst_fnc_slingWeaponBack;
},
{!weaponSlinged && primaryWeapon player != ""}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['Sling','Retrieve Weapon','',{
	player action ["TakeWeapon", MS_wh, wpn];
	player action ["SwitchWeapon", player, player, 3];
	[] spawn {
		sleep 0.9;
		player switchMove "amovpercmstpsraswrfldnon";
	};
	weaponSlinged = false;
	titleText ["Weapon Retrieved, Ready","PLAIN"];
},
{weaponSlinged}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;