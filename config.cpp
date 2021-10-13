class CfgPatches
{
	class MS_WS
	{
		units[] = {};
		weapons[] = {};
		author="Mercury Studios - Silence";
		requiredVersion=1.9400001;
		requiredAddons[]={};
		version=0.1;
	};
};
class CfgFunctions
{
	class MS_WS
	{
		class WS_Fnc
		{
			file="\MS_WS\functions";
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
