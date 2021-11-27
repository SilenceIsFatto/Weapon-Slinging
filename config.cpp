class CfgPatches
{
	class Silence_WS
	{
		units[] = {};
		weapons[] = {};
		author="Silence";
		requiredVersion=1.9400001;
		requiredAddons[]={};
		version=0.1;
	};
};

class CfgFunctions
{
	class Silence_WS
	{
		class WS_Fnc
		{
			file="\Silence_WS\functions";
			class weaponSlingInit
			{
				postInit=1;
			};
			class aceInit
			{
				postInit=1;
			};
			class cbaInit
			{
				postInit=1;
			};
		};
	};
};
