/*
weaponSlinged = false;
[] spawn {
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyDown","_this call keyspressed"];
	keyspressed = {
		_keyDik = _this select 1;
		_shift =_this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		_handled = false;
		switch (_this select 1) do {
			case 33: {//F key
				
			};
		};
		_handled;
	};
};
*/