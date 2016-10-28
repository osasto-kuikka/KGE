#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"kge_common"};
        author = "Osasto Kuikka";
        authors[] = {"nikolauska"};
        url = "https://github.com/osasto-kuikka/KGE";
        VERSION_CONFIG;
    };
};

class CfgCloudlets
{
	class Blood;
	class BloodMist: Blood
	{
		particleShape = "\A3\data_f\ParticleEffects\Universal\Universal_02";
		particleFSNtieth = 8;
		particleFSIndex = 4;
		particleFSFrameCount = 1;
		particleFSLoop = 0;
		lifeTime = "0.3";
		size[] = {"(hit/50 + 0.5)","2*(hit/50 + 0.5)"};
		color[] = {{ 1,0,0,0.1 },{ 1,0,0,0.05 }};
		randomDirectionPeriod = 0.3;
		randomDirectionIntensity = 0.3;
		weight = 0.127;
	};
};

class ImpactEffectsBlood
{
	class BloodMist
	{
		simulation = "particles";
		type = "BloodMist";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
		MoveVelocityVar[] = {0,0,0};
	};
	class Blood
	{
		simulation = "particles";
		type = "Blood";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.2;
		MoveVelocityVar[] = {2,2,2};
	};
	class Blood1
	{
		simulation = "particles";
		type = "Blood1";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.65;
	};
	class Blood2
	{
		simulation = "particles";
		type = "Blood2";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.4;
	};
	class Blood3
	{
		simulation = "particles";
		type = "Blood3";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.4;
	};
	class BloodUnderwater1
	{
		simulation = "particles";
		type = "BloodUnderwater1";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.4;
	};
};
