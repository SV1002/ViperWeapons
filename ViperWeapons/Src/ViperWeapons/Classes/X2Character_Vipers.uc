class X2Character_Vipers extends X2Character config(GameData_CharacterStats);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateViperSoldier());
	Templates.AddItem(CreateViperTemplarSoldier());
	Templates.AddItem(CreateViperFriendlyVIPCivilianTemplate('ViperSoldier_VIP'));
	Templates.AddItem(CreateViperFriendlyVIPCivilianTemplate('ViperCivilian_VIP'));
	Templates.AddItem(CreateViperHostileVIPCivilianTemplate());

	return Templates;
}


static function X2CharacterTemplate CreateViperSoldier()
{
	local X2CharacterTemplate CharTemplate;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'ViperSoldier');
	CharTemplate.UnitSize = 1;
	CharTemplate.DefaultSoldierClass = 'Rookie';
	CharTemplate.DefaultLoadout = 'RookieViperSoldier';
	CharTemplate.RequiredLoadout = 'RequiredSoldier';
	CharTemplate.strPawnArchetypes.AddItem("Viper_BasePawns.ARC_Viper_Soldier_F");
	CharTemplate.strPawnArchetypes.AddItem("Viper_BasePawns.ARC_Viper_Soldier_M");

	CharTemplate.BehaviorClass = class'XGAIBehavior';
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bCanBeCriticallyWounded = true;
	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bDiesWhenCaptured = false;
	CharTemplate.bAppearanceDefinesPawn = true;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsHumanoid = true;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = true;
	CharTemplate.bCanTakeCover = true;
	CharTemplate.bCanBeCarried = true;
	CharTemplate.bCanBeRevived = true;
	CharTemplate.bUsePoolSoldiers = true;
	CharTemplate.bIsTooBigForArmory = false;
	CharTemplate.bStaffingAllowed = true;
	CharTemplate.bAppearInBase = true;
	CharTemplate.bWearArmorInBase = true;
	CharTemplate.bUsesWillSystem = true;
	CharTemplate.bAllowRushCam = true;
	CharTemplate.strMatineePackages.AddItem("CIN_Viper");
	CharTemplate.strMatineePackages.AddItem("CIN_AdventMEC");
	CharTemplate.strMatineePackages.AddItem("CIN_Soldier");
	CharTemplate.strTargetingMatineePrefix = "CIN_AdventMEC_FF_StartPos";
	CharTemplate.strIntroMatineeSlotPrefix = "Viper";
	CharTemplate.strLoadingMatineeSlotPrefix = "Viper";
	CharTemplate.bHasCharacterExclusiveAppearance = true;
	
	CharTemplate.Abilities.AddItem('Loot');
	CharTemplate.Abilities.AddItem('Interact_PlantBomb');
	CharTemplate.Abilities.AddItem('Interact_TakeVial');
	CharTemplate.Abilities.AddItem('Interact_StasisTube');
	CharTemplate.Abilities.AddItem('Interact_ActivateSpark');
	CharTemplate.Abilities.AddItem('Interact_AtmosphereComputer');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	CharTemplate.Abilities.AddItem('Interact_MarkSupplyCrate');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('Panicked');
	CharTemplate.Abilities.AddItem('Berserk');
	CharTemplate.Abilities.AddItem('Obsessed');
	CharTemplate.Abilities.AddItem('Shattered');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.Abilities.AddItem('DisableConsumeAllPoints');
	CharTemplate.Abilities.AddItem('Revive');
	CharTemplate.Abilities.AddItem('VW_Bind');

	CharTemplate.ImmuneTypes.AddItem('Poison');
	CharTemplate.ImmuneTypes.AddItem('ViperCrush');

	// bondmate abilities
	//CharTemplate.Abilities.AddItem('BondmateResistantWill');
	CharTemplate.Abilities.AddItem('BondmateSolaceCleanse');
	CharTemplate.Abilities.AddItem('BondmateSolacePassive');
	CharTemplate.Abilities.AddItem('BondmateTeamwork');
	CharTemplate.Abilities.AddItem('BondmateTeamwork_Improved');
	CharTemplate.Abilities.AddItem('BondmateSpotter_Aim');
	CharTemplate.Abilities.AddItem('BondmateSpotter_Aim_Adjacency');
	//CharTemplate.Abilities.AddItem('BondmateSpotter_Crit');
	//CharTemplate.Abilities.AddItem('BondmateSpotter_Crit_Adjacency');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Passive');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Adjacency');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Improved_Passive');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Improved');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Improved_Adjacency');
	CharTemplate.Abilities.AddItem('BondmateDualStrike');

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_XCom;

	CharTemplate.CustomizationManagerClass = class'XComCharacterCustomization_Viper';
	if (!class'X2DownloadableContentInfo_ViperWeapons'.default.bUnrestrictedCustomizationInstalled)
	{
		CharTemplate.UICustomizationMenuClass = class'UICustomize_ViperMenu';
		CharTemplate.UICustomizationInfoClass = class'UICustomize_ViperInfo';
		CharTemplate.UICustomizationHeadClass = class'UICustomize_ViperHead';
		CharTemplate.UICustomizationBodyClass = class'UICustomize_ViperBody';
		CharTemplate.UICustomizationPropsClass = class'UICustomize_ViperProps';
	}
	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_Viper';
	CharTemplate.strAutoRunNonAIBT = "SoldierAutoRunTree";
	CharTemplate.PhotoboothPersonality = 'Personality_Normal';

	return CharTemplate;
}

static function X2CharacterTemplate CreateViperTemplarSoldier()
{
	local X2CharacterTemplate CharTemplate;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'ViperTemplarSoldier');
	CharTemplate.UnitSize = 1;
	CharTemplate.DefaultSoldierClass = 'Templar';
	CharTemplate.DefaultLoadout = 'SquaddieViperTemplar';
	CharTemplate.RequiredLoadout = 'RequiredSoldier';
	CharTemplate.strPawnArchetypes.AddItem("Viper_BasePawns.ARC_Viper_Soldier_F");
	CharTemplate.strPawnArchetypes.AddItem("Viper_BasePawns.ARC_Viper_Soldier_M");

	CharTemplate.BehaviorClass = class'XGAIBehavior';
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bCanBeCriticallyWounded = true;
	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bDiesWhenCaptured = false;
	CharTemplate.bAppearanceDefinesPawn = true;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsHumanoid = true;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = true;
	CharTemplate.bCanTakeCover = true;
	CharTemplate.bCanBeCarried = true;
	CharTemplate.bCanBeRevived = true;
	CharTemplate.bUsePoolSoldiers = true;
	CharTemplate.bIsTooBigForArmory = false;
	CharTemplate.bStaffingAllowed = true;
	CharTemplate.bAppearInBase = true;
	CharTemplate.bWearArmorInBase = true;
	CharTemplate.bUsesWillSystem = true;
	CharTemplate.bAllowRushCam = true;
	CharTemplate.strMatineePackages.AddItem("CIN_Viper");
	CharTemplate.strMatineePackages.AddItem("CIN_AdventMEC");
	CharTemplate.strMatineePackages.AddItem("CIN_Soldier");
	CharTemplate.strTargetingMatineePrefix = "CIN_AdventMEC_FF_StartPos";
	CharTemplate.strIntroMatineeSlotPrefix = "Viper";
	CharTemplate.strLoadingMatineeSlotPrefix = "Viper";
	CharTemplate.bHasCharacterExclusiveAppearance = true;

	CharTemplate.Abilities.AddItem('Loot');
	CharTemplate.Abilities.AddItem('Interact_PlantBomb');
	CharTemplate.Abilities.AddItem('Interact_TakeVial');
	CharTemplate.Abilities.AddItem('Interact_StasisTube');
	CharTemplate.Abilities.AddItem('Interact_ActivateSpark');
	CharTemplate.Abilities.AddItem('Interact_AtmosphereComputer');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	CharTemplate.Abilities.AddItem('Interact_MarkSupplyCrate');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('Panicked');
	CharTemplate.Abilities.AddItem('Berserk');
	CharTemplate.Abilities.AddItem('Obsessed');
	CharTemplate.Abilities.AddItem('Shattered');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.Abilities.AddItem('DisableConsumeAllPoints');
	CharTemplate.Abilities.AddItem('Revive');
	CharTemplate.Abilities.AddItem('VW_Bind');
	
	CharTemplate.ImmuneTypes.AddItem('Poison');
	CharTemplate.ImmuneTypes.AddItem('ViperCrush');

	// bondmate abilities
	//CharTemplate.Abilities.AddItem('BondmateResistantWill');
	CharTemplate.Abilities.AddItem('BondmateSolaceCleanse');
	CharTemplate.Abilities.AddItem('BondmateSolacePassive');
	CharTemplate.Abilities.AddItem('BondmateTeamwork');
	CharTemplate.Abilities.AddItem('BondmateTeamwork_Improved');
	CharTemplate.Abilities.AddItem('BondmateSpotter_Aim');
	CharTemplate.Abilities.AddItem('BondmateSpotter_Aim_Adjacency');
	//CharTemplate.Abilities.AddItem('BondmateSpotter_Crit');
	//CharTemplate.Abilities.AddItem('BondmateSpotter_Crit_Adjacency');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Passive');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Adjacency');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Improved_Passive');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Improved');
	//CharTemplate.Abilities.AddItem('BondmateReturnFire_Improved_Adjacency');
	CharTemplate.Abilities.AddItem('BondmateDualStrike');

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_XCom;

	CharTemplate.CustomizationManagerClass = class'XComCharacterCustomization_Viper';
	if (!class'X2DownloadableContentInfo_ViperWeapons'.default.bUnrestrictedCustomizationInstalled)
	{
		CharTemplate.UICustomizationMenuClass = class'UICustomize_ViperMenu';
		CharTemplate.UICustomizationInfoClass = class'UICustomize_ViperInfo';
		CharTemplate.UICustomizationHeadClass = class'UICustomize_ViperHead';
		CharTemplate.UICustomizationBodyClass = class'UICustomize_ViperBody';
		CharTemplate.UICustomizationPropsClass = class'UICustomize_ViperProps';
	}
	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_ViperTemplar';
	CharTemplate.strAutoRunNonAIBT = "SoldierAutoRunTree";
	CharTemplate.PhotoboothPersonality = 'Personality_Normal';

	return CharTemplate;
}

static function X2CharacterTemplate CreateViperFriendlyVIPCivilianTemplate(name TemplateName)
{
	local X2CharacterTemplate CharTemplate;
	
	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, TemplateName);
	CharTemplate.UnitSize = 1;
	CharTemplate.DefaultLoadout = 'ViperCivilian_Loadout';
	CharTemplate.strPawnArchetypes.AddItem("Viper_CivilianPawns.ARC_Viper_Soldier_F");
	CharTemplate.strPawnArchetypes.AddItem("Viper_CivilianPawns.ARC_Viper_Soldier_M");

	CharTemplate.CanFlankUnits = false;
	CharTemplate.BehaviorClass = class'XGAIBehavior_Civilian';
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bCanBeCarried = true;
	CharTemplate.bCanBeRevived = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bAppearanceDefinesPawn = true;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsHumanoid = true;
	CharTemplate.bIsCivilian = true;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bCanTakeCover = true;
	CharTemplate.bUsePoolVIPs = true;
	
	CharTemplate.strMatineePackages.AddItem("CIN_Viper");

	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	//CharTemplate.Abilities.AddItem('Panicked');
	CharTemplate.Abilities.AddItem('VW_CivilianBind');

	CharTemplate.ImmuneTypes.AddItem('Poison');
	CharTemplate.ImmuneTypes.AddItem('ViperCrush');

	CharTemplate.strBehaviorTree="VIPViperRoot";

	CharTemplate.strPanicBT="";

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_VIP;
	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_ViperVIP';

	return CharTemplate;

}

static function X2CharacterTemplate CreateViperHostileVIPCivilianTemplate()
{
	local X2CharacterTemplate CharTemplate;
	
	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'Viper_HostileCivilianVIP');
	CharTemplate.UnitSize = 1;
	CharTemplate.strPawnArchetypes.AddItem("Viper_CivilianPawns.ARC_Viper_Soldier_F");
	CharTemplate.strPawnArchetypes.AddItem("Viper_CivilianPawns.ARC_Viper_Soldier_M");

	CharTemplate.CanFlankUnits = false;
	CharTemplate.BehaviorClass = class'XGAIBehavior_Civilian';
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bCanBeCarried = true;
	CharTemplate.bCanBeRevived = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bAppearanceDefinesPawn = true;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsHumanoid = true;
	CharTemplate.bIsCivilian = true;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bCanTakeCover = true;
	CharTemplate.bUsePoolVIPs = true;
	
	CharTemplate.strMatineePackages.AddItem("CIN_Viper");

	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	//CharTemplate.Abilities.AddItem('Panicked');
	CharTemplate.Abilities.AddItem('VW_HostileCivilianBind');

	CharTemplate.ImmuneTypes.AddItem('Poison');
	CharTemplate.ImmuneTypes.AddItem('ViperCrush');

	CharTemplate.strBehaviorTree="VIPViperRoot";

	CharTemplate.strPanicBT="";

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_VIP;
	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_ViperDarkVIP';

	return CharTemplate;

}
