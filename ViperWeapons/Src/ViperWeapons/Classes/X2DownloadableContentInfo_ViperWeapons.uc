//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_ViperAnims.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_ViperWeapons extends X2DownloadableContentInfo;

var config(WeaponAnimations) bool ENABLE_LOGGING;
// Reverts the customistion class of Vipers to Default, to allow full customization with UC
var config(ViperAbilities) bool bUnrestrictedCustomizationInstalled;

// Decides if Psi-Amp weapons should use Psi-amp animatons or psion animations
var config(WeaponAnimations) bool bUseNonPsiAmpAnimsForPsiAmps;

// Decides what 'idle' animations play for Akimbo Vipers
var config(WeaponAnimations) bool bUseGunUpDownAkimboAnims;
var config(WeaponAnimations) bool bUseGunMidAkimboAnims;
var config(WeaponAnimations) bool bUseGunDownAkimboAnims;
var config(WeaponAnimations) bool bUseGunUpAkimboAnims;

// Decides what catergories count as 'Pistols' for Akimbo
var config(WeaponAnimations) array<name> AkimboPistolCategories;

// Default Viper Weapon Config
var config(WeaponAnimations) array<name> ViperBoltcasterTemplates;
var config(WeaponAnimations) array<name> ViperWeaponTemplates;
var config(WeaponAnimations) array<name> ArmoredViperWeaponTemplates;

// Bolt Caster Config
var config(WeaponAnimations) array<name> BoltCasterTemplates;

// Rifle Config
var config(WeaponAnimations) array<name> RifleTemplates;
var config(WeaponAnimations) array<name> ConventionalRifleTemplates;
var config(WeaponAnimations) array<name> MagneticRifleTemplates;
var config(WeaponAnimations) array<name> BeamRifleTemplates;
var config(WeaponAnimations) array<name> RifleBlacklist;

// SMG/Bullpup Config
var config(WeaponAnimations) array<name> SMGTemplates;
var config(WeaponAnimations) array<name> ConventionalSMGTemplates;
var config(WeaponAnimations) array<name> MagneticSMGTemplates;
var config(WeaponAnimations) array<name> BeamSMGTemplates;
var config(WeaponAnimations) array<name> SMGBlacklist;

// DMR/Vektor Rifle Config
var config(WeaponAnimations) array<name> DMRTemplates;
var config(WeaponAnimations) array<name> BallisticDMRTemplates;
var config(WeaponAnimations) array<name> BeamDMRTemplates;
var config(WeaponAnimations) array<name> DMRBlacklist;

// Shotgun Config
var config(WeaponAnimations) array<name> ShotgunTemplates;
var config(WeaponAnimations) array<name> PumpShotgunTemplates;
var config(WeaponAnimations) array<name> SemiShotgunTemplates;
var config(WeaponAnimations) array<name> BeamShotgunTemplates;
var config(WeaponAnimations) array<name> ShotgunBlacklist;

// Sniper Config
var config(WeaponAnimations) array<name> SniperTemplates;
var config(WeaponAnimations) array<name> BoltSniperTemplates;
var config(WeaponAnimations) array<name> SemiSniperTemplates;
var config(WeaponAnimations) array<name> BeamSniperTemplates;
var config(WeaponAnimations) array<name> SniperBlacklist;

// LMG Config
var config(WeaponAnimations) array<name> LMGTemplates;
var config(WeaponAnimations) array<name> ConventionalLMGTemplates;
var config(WeaponAnimations) array<name> MagneticLMGTemplates;
var config(WeaponAnimations) array<name> BeamLMGTemplates;

// Cannon Config
var config(WeaponAnimations) array<name> CannonTemplates;
var config(WeaponAnimations) array<name> ConventionalCannonTemplates;
var config(WeaponAnimations) array<name> MagneticCannonTemplates;
var config(WeaponAnimations) array<name> BeamCannonTemplates;
var config(WeaponAnimations) array<name> CannonBlacklist;

// Pistol Config
var config(WeaponAnimations) array<name> PistolTemplates;
var config(WeaponAnimations) array<name> SinglePistolTemplates;
var config(WeaponAnimations) array<name> SemiPistolTemplates;
var config(WeaponAnimations) array<name> BeamPistolTemplates;
var config(WeaponAnimations) array<name> PistolBlacklist;

// Sidearm Config
var config(WeaponAnimations) array<name> SidearmTemplates;
var config(WeaponAnimations) array<name> AutoSidearmTemplates;
var config(WeaponAnimations) array<name> BeamSidearmTemplates;
var config(WeaponAnimations) array<name> SidearmBlacklist;

// Gauntlet/Unarmed Weapon Config
var config(WeaponAnimations) array<name> UnarmedWeaponTemplates;
var config(WeaponAnimations) array<name> GauntletWeaponTemplates;

// Axe/Two-Handed Melee Config
var config(WeaponAnimations) array<name> TwoHandedMeleeTemplates;

// Knife Config
var config(WeaponAnimations) array<name> KnifeTemplates;
var config(WeaponAnimations) array<name> ConventionalKnifeTemplates;
var config(WeaponAnimations) array<name> MagneticKnifeTemplates;
var config(WeaponAnimations) array<name> BeamKnifeTemplates;

// Ripjack/Wrist Melee Config
var config(WeaponAnimations) array<name> WristBladeTemplates;
var config(WeaponAnimations) array<name> ConventionalWristBladeTemplates;
var config(WeaponAnimations) array<name> MagneticWristBladeTemplates;
var config(WeaponAnimations) array<name> BeamWristBladeTemplates;
var config(WeaponAnimations) array<name> WristBladeBlacklist;

// Combat Knife Config
var config(WeaponAnimations) array<name> CombatKnifeTemplates;
var config(WeaponAnimations) array<name> CombatKnifeBlacklist;

// Sword Config
var config(WeaponAnimations) array<name> SwordTemplates;
var config(WeaponAnimations) array<name> SwordBlacklist;

// Grenade Launcher Config
var config(WeaponAnimations) array<name> GrenadeLauncherTemplates;
var config(WeaponAnimations) array<name> GrenadeLauncherBlacklist;

// Psi-Amp Config
var config(WeaponAnimations) array<name> PsiAmpTemplates;
var config(WeaponAnimations) array<name> PsiAmpBlacklist;

// Arc Thrower Config
var config(WeaponAnimations) array<name> ArcThrowerTemplates;
var config(WeaponAnimations) array<name> ArcThrowerBlacklist;

// Holo Targeter Config
var config(WeaponAnimations) array<name> HoloTargeterTemplates;
var config(WeaponAnimations) array<name> HoloTargeterBlacklist;

// Sawed Off Config
var config(WeaponAnimations) array<name> SawedOffTemplates;
var config(WeaponAnimations) array<name> BuckshotSawedOffTemplates;
var config(WeaponAnimations) array<name> BeamSawedOffTemplates;
var config(WeaponAnimations) array<name> SawedOffBlacklist;

// M.A.W/Spit/Pull item Config
var config(WeaponAnimations) array<name> MAWTemplates;
var config(WeaponAnimations) array<name> MAWBlacklist;

// Disposable Rocket Launcher Config
var config(WeaponAnimations) array<name> ConventionalDRLTemplates;
var config(WeaponAnimations) array<name> MagneticDRLTemplates;
var config(WeaponAnimations) array<name> BeamDRLTemplates;

// Rocket Launcher Config
var config(WeaponAnimations) array<name> RocketLauncherTemplates;
var config(WeaponAnimations) array<name> RocketLauncherBlacklist;

// Rocket Config
var config(WeaponAnimations) array<name> RocketTemplates;

// Heavy Weapon Config
var config(WeaponAnimations) array<name> HeavyWeaponTemplates;
var config(WeaponAnimations) array<name> HeavyWeaponBlacklist;

// Medkit Config
var config(WeaponAnimations) array<name> MedkitTemplates;
var config(WeaponAnimations) array<name> MedkitBlacklist;

// Grenade Config
var config(WeaponAnimations) array<name> GrenadeTemplates;
var config(WeaponAnimations) array<name> GrenadeBlacklist;


var config(CharacterAnimations) array<name> MutonCharacterTemplates;
var config(CharacterAnimations) array<name> MutonCharacterGroups;

var config(CharacterAnimations) array<name> SectoidCharacterTemplates;
var config(CharacterAnimations) array<name> SectoidCharacterGroups;

var config(CharacterAnimations) array<name> ViperCharacterTemplates;
var config(CharacterAnimations) array<name> ViperSoldierCharacterTemplates;
var config(CharacterAnimations) array<name> ViperCivilianCharacterTemplates;
var config(CharacterAnimations) array<name> ViperCharacterGroups;

var config(CharacterAnimations) array<name> ViperKingCharacterTemplates;
var config(CharacterAnimations) array<name> ViperKingCharacterGroups;
var config(CharacterAnimations) array<name> TorqueCharacterTemplate;

var config(CharacterAnimations) array<name> AllowedRoboticHumanoidTemplates;


var config(CharacterAnimationBlacklists) array<name> BlacklistedSectoidTemplates;
var config(CharacterAnimationBlacklists) array<name> BlacklistedMutonTemplates;
var config(CharacterAnimationBlacklists) array<name> BlacklistedViperTemplates;
var config(CharacterAnimationBlacklists) array<name> BlacklistedHumanoidTemplates;

static event OnLoadedSavedGame()
{

	UpdateStorage();

}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}


static event OnLoadedSavedGameToStrategy()
{

	UpdateStorage();

}

// ******** HANDLE UPDATING STORAGE ************* //
// This handles updating storage in order to create variations of various SMGs based on techs unlocked
static function UpdateStorage()
{
	local XComGameState NewGameState;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local X2ItemTemplateManager ItemTemplateMgr;
	local X2ItemTemplate ItemTemplate;
	//local X2SchematicTemplate SchematicTemplate_MG, SchematicTemplate_BM;
	local XComGameState_Item NewItemState;
	local bool CleanupGameState;

	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating HQ Storage to add SMGs");
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	NewGameState.AddStateObject(XComHQ);
	ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	CleanupGameState = true;
	//add Conventional SMG always
	//`Log("LW SMGPack : Updated Conventional SMG");
	ItemTemplate = ItemTemplateMgr.FindItemTemplate('MAW_Neutral');
	if(ItemTemplate != none)
	{
		//`Log("LW SMGPack : Found SMG_CV item template");
		if (!XComHQ.HasItem(ItemTemplate))
		{
			//`Log("LW SMGPack : SMG_CV not found, adding to inventory");
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 

	}
	//schematics should be handled already, as the BuildItem UI draws from ItemTemplates, which are automatically loaded

	if(CleanUpGameState)
		History.CleanupPendingGameState(NewGameState);
			
	if(!CleanupGameState)
		History.AddGameStateToHistory(NewGameState);

}

static event OnPostTemplatesCreated()
{    
    AlienCharacterEdits();
    AlienWeaponEdits();
    PCPTCompatibility('WOTC_APA_Conduit');
    AVCompatibility('PsiSpit');
    ReaperCompatibility('Shadow');
    ReaperCompatibility('DistractionShadow');
    ReaperCompatibility('ShadowPassive');
}

static function PCPTCompatibility (name AbilityName)
{
	local X2AbilityTemplateManager      AbilityManager;
    local X2AbilityTemplate             Template;
    local X2Effect                      AnimSetsEffect;
	local X2Condition_ViperCondition	ViperCondition;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	Template = AbilityManager.FindAbilityTemplate(AbilityName);
    if (Template == none) return;

	ViperCondition = new class'X2Condition_ViperCondition';
	ViperCondition.ExcludeTypes = default.ViperCharacterTemplates;

    foreach Template.AbilityTargetEffects(AnimSetsEffect)
    {
        if (X2Effect_AdditionalAnimSets(AnimSetsEffect) != none)
        {
            AnimSetsEffect.TargetConditions.AddItem(ViperCondition);
			`LOG("Adding Condition to" @ AbilityName);
        }
    }
}

static function AVCompatibility (name AbilityName)
{
	local X2AbilityTemplateManager      AbilityManager;
    local X2AbilityTemplate             Template;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	Template = AbilityManager.FindAbilityTemplate(AbilityName);
    if (Template == none) return;

    Template.CustomFireAnim = 'HL_Psi_MindControl';
	`LOG("Adding Animation to" @ AbilityName);
}

static function ReaperCompatibility (name AbilityName)
{
	local X2AbilityTemplateManager      AbilityManager;
    local X2AbilityTemplate             Template;
    local X2Effect                      ShadowAnimEffect;
	local X2Condition_ViperCondition	ViperCondition;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	Template = AbilityManager.FindAbilityTemplate(AbilityName);
    if (Template == none) return;

	ViperCondition = new class'X2Condition_ViperCondition';
	ViperCondition.ExcludeTypes = default.ViperCharacterTemplates;

    foreach Template.AbilityTargetEffects(ShadowAnimEffect)
    {
        if (X2Effect_AdditionalAnimSets(ShadowAnimEffect) != none)
        {
            ShadowAnimEffect.TargetConditions.AddItem(ViperCondition);
			`LOG("Adding Condition to" @ AbilityName);
        }
    }
}

static function AlienCharacterEdits()
{
	local X2CharacterTemplateManager	CharacterTemplateManager;
    local X2CharacterTemplate			CharTemplate;
    local array<X2DataTemplate>			DataTemplates;
    local X2DataTemplate				Template, DiffTemplate;

    CharacterTemplateManager = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

    foreach CharacterTemplateManager.IterateTemplates(Template, None)
    {
        CharacterTemplateManager.FindDataTemplateAllDifficulties(Template.DataName, DataTemplates);
        foreach DataTemplates(DiffTemplate)
        {
            CharTemplate = X2CharacterTemplate(DiffTemplate);
            if ( (default.ViperCharacterGroups.Find(CharTemplate.CharacterGroupName) != INDEX_NONE || default.ViperCharacterTemplates.Find(CharTemplate.DataName) != INDEX_NONE) && default.BlacklistedViperTemplates.Find(CharTemplate.DataName) == INDEX_NONE)
            {
                CharTemplate.bIsHumanoid = true;
	            CharTemplate.ImmuneTypes.AddItem('ViperCrush');
			}
            if (CharTemplate.CharacterGroupName == 'ViperNeonate')
            {
	            CharTemplate.strBehaviorTree = "ViperNeonate_VW::CharacterRoot";
	            CharTemplate.Abilities.AddItem('NeonateBind');
			}
            if (CharTemplate.DataName == 'ViperMamba')
            {
	            CharTemplate.strBehaviorTree = "Viper_Mamba_VW::CharacterRoot";
	            CharTemplate.Abilities.AddItem('Bind');
			}
            if (CharTemplate.DataName == 'Wyvern')
            {
	            CharTemplate.strBehaviorTree = "Wyvern_VW::CharacterRoot";
			}
            if (CharTemplate.DataName == 'FrostAdder_M1' || CharTemplate.DataName == 'FrostAdder_M2' || CharTemplate.DataName == 'FrostAdder_M3')
            {
	            CharTemplate.strBehaviorTree = "FrostAdder_VW::CharacterRoot";
                CharTemplate.Abilities.RemoveItem('MZ_FDAdderRushAndBind');
                CharTemplate.Abilities.RemoveItem('MZ_FDAdderRushAndBind_Bind');
                CharTemplate.Abilities.RemoveItem('MZ_FDAdderRushAndBind_Crush');
	            CharTemplate.Abilities.AddItem('AdderRushAndBind');
	            CharTemplate.Abilities.AddItem('Bind');
			}
            if (CharTemplate.DataName == 'Viper' || CharTemplate.DataName == 'ViperMP' || CharTemplate.DataName == 'ViperM2_LW' || CharTemplate.DataName == 'ViperM3_LW')
            {
	            CharTemplate.strBehaviorTree = "Viper_VW::CharacterRoot";
			}
            if (CharTemplate.DataName == 'ViperElite')
            {
	            CharTemplate.strBehaviorTree = "Viper_Elite_VW::CharacterRoot";
	            CharTemplate.Abilities.RemoveItem('EliteBind');
	            CharTemplate.Abilities.RemoveItem('BindEliteSustained');
	            CharTemplate.Abilities.RemoveItem('EndBind');
	            CharTemplate.Abilities.AddItem('EliteGetOverHere_VW');
	            CharTemplate.Abilities.AddItem('Bind');
			}
            if (CharTemplate.DataName == 'ViperBoa')
            {
	            CharTemplate.strBehaviorTree = "ViperBoa_VW::CharacterRoot";
	            CharTemplate.strScamperBT = "ScamperRoot_ViperBoa";
	            CharTemplate.bIsMeleeOnly = true;
	            CharTemplate.bCanTakeCover = false;
	            CharTemplate.Abilities.RemoveItem('BoaBind');
	            CharTemplate.Abilities.RemoveItem('BoaBindSustained');
	            CharTemplate.Abilities.RemoveItem('EndBind');
	            CharTemplate.Abilities.AddItem('BoaGetOverHere_VW');
	            CharTemplate.Abilities.AddItem('Bind');
			}
            if (CharTemplate.DataName == 'ViperM4')
            {
	            CharTemplate.strBehaviorTree = "Viper_Prime_VW::CharacterRoot";
	            CharTemplate.Abilities.RemoveItem('PrimeBind');
	            CharTemplate.Abilities.RemoveItem('BindSustained');
	            CharTemplate.Abilities.RemoveItem('EndPrimeBind');
	            CharTemplate.Abilities.AddItem('PrimeGetOverHere_VW');
	            CharTemplate.Abilities.AddItem('Bind');
			}
            if (CharTemplate.DataName == 'BioViperSilver')
            {
	            CharTemplate.strBehaviorTree = "BioViper_VW::CharacterRoot";
			}
            if (CharTemplate.DataName == 'BioViperGold')
            {
	            CharTemplate.strBehaviorTree = "BioViper_Elite_VW::CharacterRoot";
	            CharTemplate.Abilities.AddItem('EliteGetOverHere_VW');
			}
            if (CharTemplate.DataName == 'ValentinesViperM1' || CharTemplate.DataName == 'ValentinesViperM2' || CharTemplate.DataName == 'ValentinesViperM3')
            {
	            CharTemplate.strBehaviorTree = "ValentinesViper_VW::CharacterRoot";
			}
            if (CharTemplate.DataName == 'ArmoredViper')
            {
	            CharTemplate.strBehaviorTree = "ArmoredViper_VW::CharacterRoot";
			}
            if (CharTemplate.DataName == 'ArmoredPsiViper')
            {
	            CharTemplate.strBehaviorTree = "ArmoredPsiViper_VW::CharacterRoot";
	            CharTemplate.Abilities.RemoveItem('BindSustained');
	            CharTemplate.Abilities.RemoveItem('BindSustainedCrush');
	            CharTemplate.Abilities.RemoveItem('BindSustainedSubdue');
	            CharTemplate.Abilities.RemoveItem('MindShield');
	            CharTemplate.Abilities.AddItem('EliteGetOverHere_VW');
	            CharTemplate.ImmuneTypes.AddItem('Mental');
	            CharTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.DisorientDamageType);
			}
            if (CharTemplate.CharacterGroupName == 'ViperKing')
            {
	            CharTemplate.strPawnArchetypes.Length = 0;
	            CharTemplate.strPawnArchetypes.AddItem("Viper_BaseAnims_ViperKing.ARC_GameUnit_ViperKing");
			}
            if ( (default.MutonCharacterGroups.Find(CharTemplate.CharacterGroupName) != INDEX_NONE || default.MutonCharacterTemplates.Find(CharTemplate.DataName) != INDEX_NONE) && default.BlacklistedMutonTemplates.Find(CharTemplate.DataName) == INDEX_NONE)
            {
                CharTemplate.bIsHumanoid = true;
            }
            if ( (default.SectoidCharacterGroups.Find(CharTemplate.CharacterGroupName) != INDEX_NONE || default.SectoidCharacterTemplates.Find(CharTemplate.DataName) != INDEX_NONE) && default.BlacklistedSectoidTemplates.Find(CharTemplate.DataName) == INDEX_NONE)
            {
                CharTemplate.bIsHumanoid = true;
            }
		}	
	}	
}

static function AlienWeaponEdits()
{
	local X2ItemTemplateManager	        ItemTemplateManager;
    local X2WeaponTemplate			    WeaponTemplate;
    local array<X2DataTemplate>			DataTemplates;
    local X2DataTemplate				Template, DiffTemplate;

    ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

    foreach ItemTemplateManager.IterateTemplates(Template, None)
    {
        ItemTemplateManager.FindDataTemplateAllDifficulties(Template.DataName, DataTemplates);
        foreach DataTemplates(DiffTemplate)
        {
            WeaponTemplate = X2WeaponTemplate(DiffTemplate);
            if (WeaponTemplate.DataName == 'FrostAdder_M1_Shotgun' || WeaponTemplate.DataName == 'FrostAdder_M2_Shotgun' || WeaponTemplate.DataName == 'FrostAdder_M3_Shotgun')
            {
                WeaponTemplate.Abilities.RemoveItem('MZ_FDAdderRushAndBind');
                WeaponTemplate.Abilities.RemoveItem('MZ_FDAdderRushAndBind_Bind');
                WeaponTemplate.Abilities.RemoveItem('MZ_FDAdderRushAndBind_Crush');
                WeaponTemplate.Abilities.RemoveItem('EndBind');
            }
            if (WeaponTemplate.DataName == 'ArmoredPsiViper_WPN')
            {
                WeaponTemplate.Abilities.AddItem('Soulfire');
            }
		}	
	}	
}

static function string DLCAppendSockets(XComUnitPawn Pawn)
{
	local XComGameState_Unit UnitState;

	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(Pawn.ObjectID));

	if (IsCharacterViper(UnitState) || (!IsTorque(UnitState) || !IsViperSoldier(UnitState)))
	{
		return "Viper_SocketsPawn.Meshes.SM_ViperSockets";
	}
	return "";
}

exec function AddViperTemplarRecruit()
{
	local XComGameState_Unit NewSoldierState;
	local XComOnlineProfileSettings ProfileSettings;
	local X2CharacterTemplate CharTemplate;
	local X2CharacterTemplateManager    CharTemplateMgr;
	local XComGameState NewGameState;
	local XComGameState_HeadquartersXCom XComHQ;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Allies Unknown State Objects");

	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));


		//assert(NewGameState != none);
		ProfileSettings = `XPROFILESETTINGS;

		CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
		//Tuple = TupleMgr.GetRandomTuple();

		CharTemplate = CharTemplateMgr.FindCharacterTemplate('ViperTemplarSoldier');
		if(CharTemplate == none)
		{
			return; //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
		NewSoldierState.ApplyInventoryLoadout(NewGameState);
		NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		XComHQ.AddToCrew(NewGameState, NewSoldierState);

	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHistory.CleanupPendingGameState(NewGameState);
	}
}

exec function AddViperSoldierRecruit()
{
	local XComGameState_Unit NewSoldierState;
	local XComOnlineProfileSettings ProfileSettings;
	local X2CharacterTemplate CharTemplate;
	local X2CharacterTemplateManager    CharTemplateMgr;
	local XComGameState NewGameState;
	local XComGameState_HeadquartersXCom XComHQ;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Allies Unknown State Objects");

	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));


		//assert(NewGameState != none);
		ProfileSettings = `XPROFILESETTINGS;

		CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
		//Tuple = TupleMgr.GetRandomTuple();

		CharTemplate = CharTemplateMgr.FindCharacterTemplate('ViperSoldier');
		if(CharTemplate == none)
		{
			return; //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
		NewSoldierState.ApplyInventoryLoadout(NewGameState);
		NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		XComHQ.AddToCrew(NewGameState, NewSoldierState);

	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHistory.CleanupPendingGameState(NewGameState);
	}
}

static function bool AbilityTagExpandHandler(string InString, out string OutString)
{
	local name Type;

	Type = name(InString);
	switch(Type)
	{
		case 'BITE_COST':
			OutString = string(class'X2Ability_MAWImplant'.default.MAW_BiteCost);
			return true;
		case 'BITE_COOLDOWN':
			OutString = string(class'X2Ability_MAWImplant'.default.MAW_BiteCooldown);
			return true;
		case 'BITE_ENDSTURN':
			OutString = getEndTurnString(class'X2Ability_MAWImplant'.default.MAW_Bite_EndsTurn);
			return true;
		case 'HEAL_DISORIENTCHANCE_I':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_I_DisorientedChance);
			return true;
		case 'HEAL_DISORIENTCHANCE_II':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_II_DisorientedChance);
			return true;
		case 'HEAL_DISORIENTCHANCE_III':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_III_DisorientedChance);
			return true;
		case 'HEAL_DISORIENTLENGTH_I':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_I_DisorientedDurnation);
			return true;
		case 'HEAL_DISORIENTLENGTH_II':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_II_DisorientedDurnation);
			return true;
		case 'HEAL_DISORIENTLENGTH_III':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_III_DisorientedDurnation);
			return true;
		case 'HEAL_STUNCHANCE_I':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_I_StunnedChance);
			return true;
		case 'HEAL_STUNCHANCE_II':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_II_StunnedChance);
			return true;
		case 'HEAL_STUNCHANCE_III':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_III_StunnedChance);
			return true;
		case 'HEAL_STUNTLENGTH_I':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_I_StunnedDurnation);
			return true;
		case 'HEAL_STUNTLENGTH_II':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_II_StunnedDurnation);
			return true;
		case 'HEAL_STUNTLENGTH_III':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_III_StunnedDurnation);
			return true;
		case 'HEAL_UNCONSCIOUSHANCE_I':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_I_UnconsciousChance);
			return true;
		case 'HEAL_UNCONSCIOUSCHANCE_II':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_II_UnconsciousChance);
			return true;
		case 'HEAL_UNCONSCIOUSCHANCE_III':
			OutString = string(class'X2Ability_MAWImplant'.default.Heal_III_UnconsciousChance);
			return true;
		case 'ELECTRIC_STUNCHANCE_I':
			OutString = string(class'X2Ability_MAWImplant'.default.Electric_I_StunnedChance);
			return true;
		case 'ELECTRIC_STUNCHANCE_II':
			OutString = string(class'X2Ability_MAWImplant'.default.Electric_II_StunnedChance);
			return true;
		case 'ELECTRIC_STUNCHANCE_III':
			OutString = string(class'X2Ability_MAWImplant'.default.Electric_III_StunnedChance);
			return true;
		case 'ELECTRIC_STUNLENGTH_I':
			OutString = string(class'X2Ability_MAWImplant'.default.Electric_I_StunnedDurnation);
			return true;
		case 'ELECTRIC_STUNLENGTH_II':
			OutString = string(class'X2Ability_MAWImplant'.default.Electric_II_StunnedDurnation);
			return true;
		case 'ELECTRIC_STUNLENGTH_III':
			OutString = string(class'X2Ability_MAWImplant'.default.Electric_III_StunnedDurnation);
			return true;
		default: 
			return false;
	}
}

private static function string getEndTurnString(bool value)
{
	if(value)
	{
		return "Ends the user's turn when used.";
	}

	return "Does not end the user's turn when used as a first action.";
}

static function AddTechGameStates()
{
	local XComGameStateHistory History;
	local XComGameState NewGameState;
	local X2TechTemplate TechTemplate;
	local X2StrategyElementTemplateManager	StratMgr;

	//This adds the techs to games that installed the mod in the middle of a campaign.
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	History = `XCOMHISTORY;	

	//Create a pending game state change
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding InR Tech Templates");

	//Find tech templates
	if ( !IsResearchInHistory('MAWTech_I') )
	{
		TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate('MAWTech_I'));
		NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}
	
	if ( !IsResearchInHistory('MAWTech_II') )
	{
		TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate('MAWTech_II'));
		NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}
	
	if ( !IsResearchInHistory('MAWTech_III') )
	{
		TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate('MAWTech_III'));
		NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}
	else
	{
		History.CleanupPendingGameState(NewGameState);
	}
}

static function bool IsResearchInHistory(name ResearchName)
{
	// Check if we've already injected the tech templates
	local XComGameState_Tech	TechState;
	
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Tech', TechState)
	{
		if ( TechState.GetMyTemplateName() == ResearchName )
		{
			return true;
		}
	}
	return false;
}

static function UpdateAnimations(out array<AnimSet> CustomAnimSets, XComGameState_Unit UnitState, XComUnitPawn Pawn)
{
	local XComContentManager	Content;

    Content = `CONTENT;

    if (IsTorque(UnitState))
    {
        if (HasEmptyPrimaryWeaponEquipped(UnitState))
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Civilian.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims_Civilian.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Pawn.Anims.AS_Gauntlet")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Torque_BaseAnims_Civilian.Anims.AS_Torque")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Torque_HQAnims.Anims.AS_Armory_Unarmed")));
        }
        else if (HasDualPistolEquipped(UnitState))
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Akimbo.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Akimbo_3.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Pawn.Anims.AS_Gauntlet")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn_Akimbo_3.Anims.AS_Rocket")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_FireAndMeleeAnims_Akimbo.Anims.AS_Viper_3")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Torque_BaseAnims_Akimbo.Anims.AS_Torque")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Torque_HQAnims.Anims.AS_Armory_Akimbo")));

            if (default.bUseNonPsiAmpAnimsForPsiAmps || HasGauntletsEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsionAnims_Akimbo_Pawn.Anims.AS_Psion")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsiAmpAnims_Akimbo_Pawn.Anims.AS_Psiamp")));
            }

            if (HasKnifeEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_KnifeAnims_AkimboCounter.Anims.AS_Knife")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_LWKnifeAnims_AkimboCounter.Anims.AS_CombatKnife")));
            }
        }
        else if (HasPrimaryPistolEquipped(UnitState))
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_PrimaryPistol.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_FireAndMeleeAnims_PrimaryPistol.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Pawn.Anims.AS_Gauntlet")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn_PrimaryPistol.Anims.AS_Rocket")));

            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Torque_BaseAnims_PrimaryPistol.Anims.AS_Torque")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Torque_HQAnims.Anims.AS_Armory_Pistol_Primary")));

            if (default.bUseNonPsiAmpAnimsForPsiAmps || HasGauntletsEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsionAnims_PrimaryPistol_Pawn.Anims.AS_Psion")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsiAmpAnims_PrimaryPistol_Pawn.Anims.AS_Psiamp")));
            }

            if (HasKnifeEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_KnifeAnims_PrimaryPistolCounter.Anims.AS_Knife")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_LWKnifeAnims_PrimaryPistolCounter.Anims.AS_CombatKnife")));
            }
        }
        else if (HasUnarmedPrimaryWeaponEquipped(UnitState))
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Unarmed.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Pawn.Anims.AS_Gauntlet")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn_Unarmed.Anims.AS_Rocket")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Torque_BaseAnims_Unarmed.Anims.AS_Torque")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Torque_HQAnims.Anims.AS_Armory_Unarmed")));

            if (default.bUseNonPsiAmpAnimsForPsiAmps || HasGauntletsEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsionAnims_Unarmed_Pawn.Anims.AS_Psion")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsiAmpAnims_Unarmed_Pawn.Anims.AS_Psiamp")));
            }

            if (HasKnifeEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_KnifeAnims_UnarmedCounter.Anims.AS_Knife")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_LWKnifeAnims_UnarmedCounter.Anims.AS_CombatKnife")));
            }
        }
        else
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Secondary_Pawn.Anims.AS_Gauntlet")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn.Anims.AS_Rocket")));

            if (default.bUseNonPsiAmpAnimsForPsiAmps || HasGauntletsEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsionAnims_Pawn.Anims.AS_Psion")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsiAmpAnims_Pawn.Anims.AS_Psiamp")));
            }

            if (HasKnifeEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_KnifeAnims_Counter.Anims.AS_Knife")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_LWKnifeAnims_Counter.Anims.AS_CombatKnife")));
            }
        }
    }

    else if (IsViperKing(UnitState))
    {
        if (HasEmptyPrimaryWeaponEquipped(UnitState))
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Civilian.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims_Civilian.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_HQAnims_Unarmed.Anims.AS_Armory")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Pawn.Anims.AS_Gauntlet")));
        }
        else
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Secondary_Pawn.Anims.AS_Gauntlet")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn.Anims.AS_Rocket")));

            if (default.bUseNonPsiAmpAnimsForPsiAmps || HasGauntletsEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsionAnims_Pawn.Anims.AS_Psion")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsiAmpAnims_Pawn.Anims.AS_Psiamp")));
            }

            if (HasKnifeEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_KnifeAnims_Counter.Anims.AS_Knife")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_LWKnifeAnims_Counter.Anims.AS_CombatKnife")));
            }
        }
    }

	else if (IsCharacterViper(UnitState))
    {
        if (HasEmptyPrimaryWeaponEquipped(UnitState))
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Civilian.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims_Civilian.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_HQAnims_Unarmed.Anims.AS_Armory")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Pawn.Anims.AS_Gauntlet")));
        }
        else if (HasDualPistolEquipped(UnitState))
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Akimbo.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_HQAnims_Akimbo.Anims.AS_Armory")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Pawn.Anims.AS_Gauntlet")));

            if (default.bUseGunUpDownAkimboAnims)
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn_Akimbo_1.Anims.AS_Rocket")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Akimbo_1.Anims.AS_Viper")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_FireAndMeleeAnims_Akimbo.Anims.AS_Viper_1")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims_Akimbo_1.Anims.AS_Viper")));
            }
            else if (default.bUseGunMidAkimboAnims)
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn_Akimbo_2.Anims.AS_Rocket")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Akimbo_2.Anims.AS_Viper")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_FireAndMeleeAnims_Akimbo.Anims.AS_Viper_2")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims_Akimbo_2.Anims.AS_Viper")));
            }
            else if (default.bUseGunDownAkimboAnims)
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn_Akimbo_3.Anims.AS_Rocket")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Akimbo_3.Anims.AS_Viper")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_FireAndMeleeAnims_Akimbo.Anims.AS_Viper_3")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims_Akimbo_3.Anims.AS_Viper")));
            }
            else if (default.bUseGunUpAkimboAnims)
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn_Akimbo_4.Anims.AS_Rocket")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Akimbo_4.Anims.AS_Viper")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_FireAndMeleeAnims_Akimbo.Anims.AS_Viper_4")));
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims_Akimbo_4.Anims.AS_Viper")));
            }

            if (default.bUseNonPsiAmpAnimsForPsiAmps || HasGauntletsEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsionAnims_Akimbo_Pawn.Anims.AS_Psion")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsiAmpAnims_Akimbo_Pawn.Anims.AS_Psiamp")));
            }

            if (HasKnifeEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_KnifeAnims_AkimboCounter.Anims.AS_Knife")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_LWKnifeAnims_AkimboCounter.Anims.AS_CombatKnife")));
            }
        }
        else if (HasPrimaryPistolEquipped(UnitState))
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_PrimaryPistol.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_HQAnims_PrimaryPistol.Anims.AS_Armory")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_FireAndMeleeAnims_PrimaryPistol.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Pawn.Anims.AS_Gauntlet")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn_PrimaryPistol.Anims.AS_Rocket")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims_PrimaryPistol.Anims.AS_Viper")));

            if (default.bUseNonPsiAmpAnimsForPsiAmps || HasGauntletsEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsionAnims_PrimaryPistol_Pawn.Anims.AS_Psion")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsiAmpAnims_PrimaryPistol_Pawn.Anims.AS_Psiamp")));
            }

            if (HasKnifeEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_KnifeAnims_PrimaryPistolCounter.Anims.AS_Knife")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_LWKnifeAnims_PrimaryPistolCounter.Anims.AS_CombatKnife")));
            }
        }
        else if (HasUnarmedPrimaryWeaponEquipped(UnitState))
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims_Unarmed.Anims.AS_Viper")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_HQAnims_Unarmed.Anims.AS_Armory")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Pawn.Anims.AS_Gauntlet")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn_Unarmed.Anims.AS_Rocket")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims_Unarmed.Anims.AS_Viper")));

            if (default.bUseNonPsiAmpAnimsForPsiAmps || HasGauntletsEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsionAnims_Unarmed_Pawn.Anims.AS_Psion")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsiAmpAnims_Unarmed_Pawn.Anims.AS_Psiamp")));
            }

            if (HasKnifeEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_KnifeAnims_UnarmedCounter.Anims.AS_Knife")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_LWKnifeAnims_UnarmedCounter.Anims.AS_CombatKnife")));
            }
        }
        else
        {
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_GauntletAnims_Secondary_Pawn.Anims.AS_Gauntlet")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_RLAnims_Pawn.Anims.AS_Rocket")));
            CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_MAWAnims.Anims.AS_Viper")));

            if (default.bUseNonPsiAmpAnimsForPsiAmps || HasGauntletsEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsionAnims_Pawn.Anims.AS_Psion")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_PsiAmpAnims_Pawn.Anims.AS_Psiamp")));
            }

            if (HasKnifeEquipped(UnitState))
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_KnifeAnims_Counter.Anims.AS_Knife")));
            }
            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_LWKnifeAnims_Counter.Anims.AS_CombatKnife")));
            }

            if (UnitState.GetMyTemplateName() == 'ViperSoldier' || UnitState.GetMyTemplateName() == 'ViperTemplarSoldier')
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_FireAndMeleeAnims.Anims.AS_Viper")));
            }

            else
            {
                CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Viper_BaseAnims.Anims.AS_Viper")));
            }
        }
    }

	else if (IsCharacterMuton(UnitState))
    {
        CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("PullAndBindAnims_Muton.Anims.AS_Muton")));
    }

	else if (IsCharacterSectoid(UnitState))
    {
        CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("PullAndBindAnims_Sectoid.Anims.AS_Sectoid")));
    }

	else if (IsCharacterHumanlike(UnitState))
    {
        CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("PullAndBindAnims_Human.Anims.AS_Human")));
    }

	else
	{
		return;
	}
}

static function WeaponInitialized(XGWeapon WeaponArchetype, XComWeapon Weapon, optional XComGameState_Item ItemState=none)
{
	local XComGameState_Unit UnitState;
	local X2WeaponTemplate WeaponTemplate;
	local array<string> AnimSetPaths;
	local string AnimSetPath;
	local bool bResetAnimsets, bOverride;
	local array<AnimSet> CustomUnitPawnAnimsets;
	local array<AnimSet> CustomUnitPawnAnimsetsFemale;
	local AnimSet Anim;
	bResetAnimsets = true;
	bOverride = true;
	
	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ItemState.OwnerStateObject.ObjectID));
    
	WeaponTemplate = X2WeaponTemplate(ItemState.GetMyTemplate());


	if (ItemState != none)
	{
		UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ItemState.OwnerStateObject.ObjectID));
	}

	if (IsCharacterViper(UnitState) || IsTorque(UnitState))
    {
	    `LOG("Initializing weapon: " @ ItemState.GetMyTemplateName() @ " for: " @ UnitState.GetFullName(), default.ENABLE_LOGGING, 'ViperWeapons');
        // - Primary Weapons
        if (IsPrimaryWeaponState(ItemState) && !HasDualPistolEquipped(UnitState))
        {   
	        `LOG("Weapon is Primary", default.ENABLE_LOGGING, 'ViperWeapons');
            // - Compatibility with standard and modded Viper weapons which just use FF_Fire
            if (IsViperWeaponTemplate(ItemState))
            {
	            `LOG("And a default Viper weapon", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_PrimaryAnims_Viper.Anims.AS_Rifle");
                if (IsViperBoltCasterTemplate(ItemState))
                {
	                `LOG("Boltcaster", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireMagA';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMagA';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMagA';
                }
                else if (IsArmoredViperWeaponTemplate(ItemState))
                {
	                `LOG("Gattling Rifle", default.ENABLE_LOGGING, 'ViperWeapons');
                    AnimSetPaths.AddItem("Viper_GauntletAnims_Secondary_Pawn.Anims.AS_Gauntlet");
                    AnimSetPaths.AddItem("Viper_GauntletAnims_Secondary_Weapon.Anims.AS_Gauntlet");
                    AnimSetPaths.AddItem("Viper_PsionAnims.Anims.AS_Psion");
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeamGatA';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeamGatA';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeamGatA';
                }
                else
                {
	                `LOG("Beam Rifle", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeamA';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeamA';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeamA';
                }
            }
            // - See if the weapon is a boltcaster before proceeding
            else if (IsBoltCasterTemplate(ItemState))
            {
	            `LOG("And a Boltcaster", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_BoltCasterAnims.Anims.AS_Viper");
            }
            // - Rifle Checks
            else if (IsRifleTemplate(ItemState) && !IsUnarmedWeaponTemplate(ItemState))
            {
	            `LOG("And a rifle", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_RifleAnims.Anims.AS_Viper");
                if (IsConventionalRifleTemplate(ItemState))
                {
	                `LOG("With the FF_FireConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsMagneticRifleTemplate(ItemState))
                {
	                `LOG("With the FF_FireMag firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMag';
                }
                else if (IsBeamRifleTemplate(ItemState))
                {
	                `LOG("With the FF_FireBeam firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                }
            }
            // - SMG/Bullpup Checks
            else if (IsSMGTemplate(ItemState))
            {
	            `LOG("And an SMG/Bullpup", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_SMGAnims.Anims.AS_Viper");
                if (IsConventionalSMGTemplate(ItemState))
                {
	                `LOG("With the FF_FireConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsMagneticSMGTemplate(ItemState))
                {
	                `LOG("With the FF_FireMag firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMag';
                }
                else if (IsBeamSMGTemplate(ItemState))
                {
	                `LOG("With the FF_FireBeam firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                }
            }
            // - DMR/Vektor Rifle Checks
            else if (IsDMRTemplate(ItemState))
            {
	            `LOG("And a DMR/Vektor Rifle", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_DMRAnims.Anims.AS_Viper");
                if (IsBallisticDMRTemplate(ItemState))
                {
	                `LOG("With the FF_FireConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsBeamDMRTemplate(ItemState))
                {
	                `LOG("With the FF_FireBeam firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                }
            }
            // - Shotgun Checks
            else if (IsShotgunTemplate(ItemState))
            {
	            `LOG("And a Shotgun", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_ShotgunAnims.Anims.AS_Viper");
                if (IsPumpShotgunTemplate(ItemState))
                {
	                `LOG("With the FF_FireConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsSemiShotgunTemplate(ItemState))
                {
	                `LOG("With the FF_FireSemi firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireSemi';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireSemi';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireSemi';
                }
                else if (IsBeamShotgunTemplate(ItemState))
                {
	                `LOG("With the FF_FireBeam firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                }
            }
            // - Sniper Checks
            else if (IsSniperTemplate(ItemState))
            {
	            `LOG("And a Sniper Rilfe", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_SniperAnims.Anims.AS_Viper");
                if (IsBoltSniperTemplate(ItemState))
                {
	                `LOG("With the FF_FireConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsSemiSniperTemplate(ItemState))
                {
	                `LOG("With the FF_FireMag firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMag';
                }
                else if (IsBeamSniperTemplate(ItemState))
                {
	                `LOG("With the FF_FireBeam firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                }
            }
            // - LMG/Battle Rifle Checks
            else if (IsLMGTemplate(ItemState))
            {
	            `LOG("And an LMG", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_LMGAnims.Anims.AS_Viper");
                if (IsConventionalLMGTemplate(ItemState))
                {
	                `LOG("With the FF_FireConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsMagneticLMGTemplate(ItemState))
                {
	                `LOG("With the FF_FireMag firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMag';
                }
                else if (IsBeamLMGTemplate(ItemState))
                {
	                `LOG("With the FF_FireBeam firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                }
            }
            // - Cannon Checks
            else if (IsCannonTemplate(ItemState))
            {
	            `LOG("And a Cannon", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_CannonAnims.Anims.AS_Viper");
                if (IsConventionalCannonTemplate(ItemState))
                {
	                `LOG("With the FF_FireConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsMagneticCannonTemplate(ItemState))
                {
	                `LOG("With the FF_FireMag firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMag';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMag';
                }
                else if (IsBeamCannonTemplate(ItemState))
                {
	                `LOG("With the FF_FireBeam firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                }
            }
            // - Gauntlet/Unarmed Weapon Check
            else if (IsUnarmedWeaponTemplate(ItemState))
            {
	            `LOG("And an unarmed weapon", default.ENABLE_LOGGING, 'ViperWeapons');
                Weapon.WeaponFireAnimSequenceName = 'FF_MeleeHit';
                AnimSetPaths.AddItem("Viper_GauntletAnims_Weapon.Anims.AS_Gauntlet");
                if (IsEmptyWeaponTemplate(ItemState))
                {
	                `LOG("But not a weapon at all...", default.ENABLE_LOGGING, 'ViperWeapons');
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Civilian.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Civilian.Anims.AS_Viper_NoCover");
                }
                else
                {
	                `LOG("Gauntlets", default.ENABLE_LOGGING, 'ViperWeapons');
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                }
            }
            // - Pistol Check
            else if (IsPistolTemplate(ItemState))
            {
	            `LOG("And a Pistol", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_PistolAnims_Primary.Anims.AS_Pistol");
                if (IsSinglePistolTemplate(ItemState))
                {
	                `LOG("With the FF_FireConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsSemiPistolTemplate(ItemState))
                {
	                `LOG("With the FF_FireMultiShotConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireMultiShotConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMultiShotConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMultiShotConv';
                }
                else if (IsBeamPistolTemplate(ItemState))
                {
	                `LOG("With the FF_FireBeam firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                }
            }
            // - Sidearm Check
            else if (IsSidearmTemplate(ItemState))
            {
	            `LOG("And a Sidearm", default.ENABLE_LOGGING, 'ViperWeapons');
                AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_PistolAnims_Primary.Anims.AS_Sidearm");
                if (IsAutoSidearmTemplate(ItemState))
                {
	                `LOG("With the FF_FireConv firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsBeamSidearmTemplate(ItemState))
                {
	                `LOG("With the FF_FireBeam firing animation", default.ENABLE_LOGGING, 'ViperWeapons');
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                    Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                }
            }
            // - Grenade Launcher Check
            else if (IsGrenadeLauncherTemplate(ItemState))
            {
	            `LOG("And a Grenade Launcher", default.ENABLE_LOGGING, 'ViperWeapons');
                Weapon.WeaponFireAnimSequenceName = 'FF_FireGrenade';
                AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                AnimSetPaths.AddItem("Viper_GrenadeLauncherAnims_Primary.Anims.AS_GrenadeLauncher");
            }
        }

        if (!IsPrimaryWeaponState(ItemState))
        {
	        `LOG("Weapon is not Primary", default.ENABLE_LOGGING, 'ViperWeapons');
            // - Armoured Viper Compatibility
            if (WeaponTemplate.DataName == 'PsiSpitGlob')
            {
                AnimSetPaths.AddItem("Viper_PsionAnims.Anims.AS_Psion");
            }
            // - Gauntlet Check
            else if (IsTemplarGauntletTemplate(ItemState))
            {
                Weapon.WeaponFireAnimSequenceName = 'FF_MeleeHit';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_GauntletAnims_Weapon.Anims.AS_Gauntlet");
                    AnimSetPaths.AddItem("Viper_PsionAnims_Akimbo.Anims.AS_Psion");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_GauntletAnims_Weapon.Anims.AS_Gauntlet");
                    AnimSetPaths.AddItem("Viper_PsionAnims_Akimbo.Anims.AS_Psion");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_GauntletAnims_Secondary_Weapon.Anims.AS_Gauntlet");
                    AnimSetPaths.AddItem("Viper_PsionAnims_PrimaryPistol.Anims.AS_Psion");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_GauntletAnims_Secondary_Weapon.Anims.AS_Gauntlet");
                    AnimSetPaths.AddItem("Viper_PsionAnims.Anims.AS_Psion");
                }
            }
            // - Pistol Check
            else if (IsPistolTemplate(ItemState))
            {
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_PistolAnims_Unarmed.Anims.AS_Aims");
                    AnimSetPaths.AddItem("Viper_PistolAnims_Unarmed.Anims.AS_Pistol");
                    if (IsSinglePistolTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                    }
                    else if (IsSemiPistolTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireMultiShotConv';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMultiShotConv';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMultiShotConv';
                    }
                    else if (IsBeamPistolTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                    }
                }
                else if (HasDualPistolEquipped(UnitState) && PistolIsNotDualWielded(ItemState))
                {
                    AnimSetPaths.AddItem("Viper_PistolAnims.Anims.AS_Pistol_Akimbo");
                    if (IsSinglePistolTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                    }
                    else if (IsSemiPistolTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireMultiShotConv';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMultiShotConv';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMultiShotConv';
                    }
                    else if (IsBeamPistolTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                    }

                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_PistolAnims_Akimbo.Anims.AS_Aims_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_PistolAnims_Akimbo.Anims.AS_Aims_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_PistolAnims_Akimbo.Anims.AS_Aims_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_PistolAnims_Akimbo.Anims.AS_Aims_4");
                    }
                }
                else if (!HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_PistolAnims.Anims.AS_Aims");
                    AnimSetPaths.AddItem("Viper_PistolAnims.Anims.AS_Pistol");
                    if (IsSinglePistolTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                    }
                    else if (IsSemiPistolTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireMultiShotConv';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireMultiShotConv';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMultiShotConv';
                    }
                    else if (IsBeamPistolTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                    }
                }
            }
            // - Sidearm Check
            else if (IsSidearmTemplate(ItemState))
            {
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_PistolAnims_Unarmed.Anims.AS_Aims");
                    AnimSetPaths.AddItem("Viper_PistolAnims_Unarmed.Anims.AS_Sidearm");
                    if (IsAutoSidearmTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                    }
                    else if (IsBeamSidearmTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                    }
                }
                else if (HasDualPistolEquipped(UnitState) && PistolIsNotDualWielded(ItemState))
                {
                    AnimSetPaths.AddItem("Viper_PistolAnims_Akimbo.Anims.AS_Sidearm");
                    if (IsAutoSidearmTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                    }
                    else if (IsBeamSidearmTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                    }

                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_PistolAnims_Akimbo.Anims.AS_Aims_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_PistolAnims_Akimbo.Anims.AS_Aims_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_PistolAnims_Akimbo.Anims.AS_Aims_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_PistolAnims_Akimbo.Anims.AS_Aims_4");
                    }
                }
                else if (!HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_PistolAnims.Anims.AS_Aims");
                    AnimSetPaths.AddItem("Viper_PistolAnims.Anims.AS_Sidearm");
                    if (IsAutoSidearmTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireConv';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireConv';
                    }
                    else if (IsBeamSidearmTemplate(ItemState))
                    {
                        Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponFireKillAnimSequenceName = 'FF_FireBeam';
                        Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireBeam';
                    }
                }
            }
            // - Axe/Two-Handed Melee Check - applied Before Sword so AH Axes have the Axe animset instead of swords without needing to blacklist them first
            else if (IsTwoHandedMeleeTemplate(ItemState))
            {
                Weapon.WeaponFireAnimSequenceName = 'FF_MeleeHit';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_SwordAnims_Unarmed.Anims.AS_Sword");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_SwordAnims_Akimbo.Anims.AS_Sword");

                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_SwordAnims_PrimaryPistol.Anims.AS_Sword");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_SwordAnims.Anims.AS_Sword");
                }
            }
            // - Knife/Spec Ops Knife Check - Same as above, so the used doesn't have to blacklist a knife as a sword first
            else if (IsKnifeTemplate(ItemState))
            {
                Weapon.DefaultSocket = 'ViperKnifeSocket';
                Weapon.WeaponFireAnimSequenceName = 'FF_MeleeHit';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    if (IsConventionalKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_Unarmed_CV.Anims.AS_Knife");
                    }
                    else if (IsMagneticKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_Unarmed_MG.Anims.AS_Knife");
                    }
                    else if (IsBeamKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_Unarmed_BM.Anims.AS_Knife");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_Unarmed_CV.Anims.AS_Knife");
                    }
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    if (IsConventionalKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_Akimbo_CV.Anims.AS_Knife");
                    }
                    else if (IsMagneticKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_Akimbo_MG.Anims.AS_Knife");
                    }
                    else if (IsBeamKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_Akimbo_BM.Anims.AS_Knife");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_Akimbo_CV.Anims.AS_Knife");
                    }

                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    if (IsConventionalKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_PrimaryPistol_CV.Anims.AS_Knife");
                    }
                    else if (IsMagneticKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_PrimaryPistol_MG.Anims.AS_Knife");
                    }
                    else if (IsBeamKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_PrimaryPistol_BM.Anims.AS_Knife");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_PrimaryPistol_CV.Anims.AS_Knife");
                    }
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    if (IsConventionalKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_CV.Anims.AS_Knife");
                    }
                    else if (IsMagneticKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_MG.Anims.AS_Knife");
                    }
                    else if (IsBeamKnifeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_BM.Anims.AS_Knife");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_KnifeAnims_CV.Anims.AS_Knife");
                    }
                }
            }
            // - Ripjack/Wrist Melee Weapon Check - Ditto
            else if (IsWristBladeTemplate(ItemState))
            {
                Weapon.WeaponFireAnimSequenceName = 'FF_MeleeHit';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    if (IsConventionalWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_Unarmed_CV.Anims.AS_WristBlade");
                    }
                    else if (IsMagneticWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_Unarmed_MG.Anims.AS_WristBlade");
                    }
                    else if (IsBeamWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_Unarmed_BM.Anims.AS_WristBlade");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_Unarmed_CV.Anims.AS_WristBlade");
                    }
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    if (IsConventionalWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_Akimbo_CV.Anims.AS_WristBlade");
                    }
                    else if (IsMagneticWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_Akimbo_MG.Anims.AS_WristBlade");
                    }
                    else if (IsBeamWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_Akimbo_BM.Anims.AS_WristBlade");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_Akimbo_CV.Anims.AS_WristBlade");
                    }

                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    if (IsConventionalWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_PrimaryPistol_CV.Anims.AS_WristBlade");
                    }
                    else if (IsMagneticWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_PrimaryPistol_MG.Anims.AS_WristBlade");
                    }
                    else if (IsBeamWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_PrimaryPistol_BM.Anims.AS_WristBlade");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_PrimaryPistol_CV.Anims.AS_WristBlade");
                    }
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    if (IsConventionalWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_CV.Anims.AS_WristBlade");
                    }
                    else if (IsMagneticWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_MG.Anims.AS_WristBlade");
                    }
                    else if (IsBeamWristBladeTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_BM.Anims.AS_WristBlade");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_RipjackAnims_CV.Anims.AS_WristBlade");
                    }
                }
            }
            // - Combat Knife Check
            else if (IsCombatKnifeTemplate(ItemState))
            {
                Weapon.WeaponFireAnimSequenceName = 'FF_MeleeHit';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_LWKnifeAnims_Unarmed.Anims.AS_CombatKnife");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_LWKnifeAnims_Akimbo.Anims.AS_CombatKnife");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_LWKnifeAnims_PrimaryPistol.Anims.AS_CombatKnife");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_LWKnifeAnims.Anims.AS_CombatKnife");
                }
            }
            // - Sword Check
            else if (IsSwordTemplate(ItemState))
            {
	            `LOG("Weapon is a Sword", default.ENABLE_LOGGING, 'ViperWeapons');
                Weapon.WeaponFireAnimSequenceName = 'FF_MeleeHit';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
	                `LOG("Unarmed", default.ENABLE_LOGGING, 'ViperWeapons');
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_SwordAnims_Unarmed.Anims.AS_Sword");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
	                `LOG("Akimbo", default.ENABLE_LOGGING, 'ViperWeapons');
                    AnimSetPaths.AddItem("Viper_SwordAnims_Akimbo.Anims.AS_Sword");

                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
	                `LOG("Primary Pistol", default.ENABLE_LOGGING, 'ViperWeapons');
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_SwordAnims_PrimaryPistol.Anims.AS_Sword");
                }
                else
                {
	                `LOG("Default", default.ENABLE_LOGGING, 'ViperWeapons');
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_SwordAnims.Anims.AS_Sword");
                    if (WeaponTemplate.DataName == 'VorpalBlade')
                    {
                        Weapon.DefaultSocket = 'SwordSheath';
                    }
                }
            }
            // - Grenade Launcher Check
            else if (IsGrenadeLauncherTemplate(ItemState))
            {
                Weapon.WeaponFireAnimSequenceName = 'FF_FireGrenade';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_GrenadeLauncherAnims_Unarmed.Anims.AS_GrenadeLauncher");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_GrenadeLauncherAnims_Akimbo.Anims.AS_GrenadeLauncher");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_GrenadeLauncherAnims_PrimaryPistol.Anims.AS_GrenadeLauncher");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_GrenadeLauncherAnims.Anims.AS_GrenadeLauncher");
                }
            }
            // - Psi-Amp Check
            else if (IsPsiAmpTemplate(ItemState))
            {
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    if (default.bUseNonPsiAmpAnimsForPsiAmps)
                    {
                        AnimSetPaths.AddItem("Viper_PsionAnims_Unarmed.Anims.AS_Psion");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_PsiampAnims_Unarmed.Anims.AS_Psiamp");
                    }
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    if (default.bUseNonPsiAmpAnimsForPsiAmps)
                    {
                        AnimSetPaths.AddItem("Viper_PsionAnims_Akimbo.Anims.AS_Psion");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_PsiampAnims_Akimbo.Anims.AS_Psiamp");
                    }

                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    if (default.bUseNonPsiAmpAnimsForPsiAmps)
                    {
                        AnimSetPaths.AddItem("Viper_PsionAnims_PrimaryPistol.Anims.AS_Psion");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_PsiampAnims_PrimaryPistol.Anims.AS_Psiamp");
                    }
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    if (default.bUseNonPsiAmpAnimsForPsiAmps)
                    {
                        AnimSetPaths.AddItem("Viper_PsionAnims.Anims.AS_Psion");
                    }
                    else
                    {
                        AnimSetPaths.AddItem("Viper_PsiampAnims.Anims.AS_Psiamp");
                    }
                }
            }
            // - Arc Thrower Check
            else if (IsArcThrowerTemplate(ItemState))
            {
                Weapon.WeaponFireAnimSequenceName = 'FF_FireArc';
                Weapon.DefaultSocket = 'ViperLowerBackHolster';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_ArcthrowerAnims_Unarmed.Anims.AS_Arcthrower");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_ArcthrowerAnims_Akimbo.Anims.AS_Arcthrower");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_ArcthrowerAnims_PrimaryPistol.Anims.AS_Arcthrower");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_ArcthrowerAnims.Anims.AS_Arcthrower");
                }
            }
            // - Holo Targeter Check
            else if (IsHoloTargeterTemplate(ItemState))
            {
                Weapon.WeaponFireAnimSequenceName = 'FF_FireHolotarget';
                Weapon.DefaultSocket = 'ViperLowerBackHolster';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_HolotargeterAnims_Unarmed.Anims.AS_Holotargeter");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_HolotargeterAnims_Akimbo.Anims.AS_Holotargeter");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_HolotargeterAnims_PrimaryPistol.Anims.AS_Holotargeter");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_HolotargeterAnims.Anims.AS_Holotargeter");
                }
            }
            // - Sawed Off Check
            else if (IsSawedOffTemplate(ItemState))
            {
                Weapon.DefaultSocket = 'ViperSawedOffHolster';
                if (IsBuckshotSawedOffTemplate(ItemState))
                {
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireConv';
                }
                else if (IsBeamSawedOffTemplate(ItemState))
                {
                    Weapon.WeaponFireAnimSequenceName = 'FF_FireBeam';
                }
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_SawedOffAnims_Unarmed.Anims.AS_SawedOff");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_SawedOffAnims.Anims.AS_SawedOff_Akimbo");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_SawedOffAnims_PrimaryPistol.Anims.AS_SawedOff");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_SawedOffAnims.Anims.AS_SawedOff");
                }
            }
            // - M.A.W/Spit Weapon Check
            else if (IsMAWTemplate(ItemState))
            {
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_MAWAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_MAWAnims_Akimbo_1.Anims.AS_Viper");
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_MAWAnims_Akimbo_2.Anims.AS_Viper");
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_MAWAnims_Akimbo_3.Anims.AS_Viper");
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_MAWAnims_Akimbo_4.Anims.AS_Viper");
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_MAWAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_MAWAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                }
            }
            // - Disposiable Rocket Launcher Check
            else if (IsDRLTemplate(ItemState))
            {
                Weapon.DefaultSocket = 'ViperAT4_Sling';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_DRLAnims_Unarmed.Anims.AS_Rocket");
                    if (IsConventionalDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_Unarmed_CV.Anims.AS_Rocket");
                    }
                    else if (IsMagneticDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_Unarmed_MG.Anims.AS_Rocket");
                    }
                    else if (IsBeamDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_Unarmed_BM.Anims.AS_Rocket");
                    }
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_DRLAnims_Akimbo.Anims.AS_Rocket");
                    if (IsConventionalDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_Akimbo_CV.Anims.AS_Rocket");
                    }
                    else if (IsMagneticDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_Akimbo_MG.Anims.AS_Rocket");
                    }
                    else if (IsBeamDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_Akimbo_BM.Anims.AS_Rocket");
                    }

                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_DRLAnims_PrimaryPistol.Anims.AS_Rocket");
                    if (IsConventionalDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_PrimaryPistol_CV.Anims.AS_Rocket");
                    }
                    else if (IsMagneticDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_PrimaryPistol_MG.Anims.AS_Rocket");
                    }
                    else if (IsBeamDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_PrimaryPistol_BM.Anims.AS_Rocket");
                    }
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_DRLAnims.Anims.AS_Rocket");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    if (IsConventionalDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_PrimaryPistol_CV.Anims.AS_Rocket");
                    }
                    else if (IsMagneticDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_PrimaryPistol_MG.Anims.AS_Rocket");
                    }
                    else if (IsBeamDRLTemplate(ItemState))
                    {
                        AnimSetPaths.AddItem("Viper_DRLAnims_PrimaryPistol_BM.Anims.AS_Rocket");
                    }
                }
            }
            // - Rocket Launcher Check
            else if (IsRocketLauncherTemplate(ItemState))
            {
                Weapon.DefaultSocket = 'ViperBigRocketLauncherSling';
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_RLAnims_Unarmed.Anims.AS_RocketLauncher");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_RLAnims_Akimbo.Anims.AS_RocketLauncher");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_RLAnims_PrimaryPistol.Anims.AS_RocketLauncher");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_RLAnims.Anims.AS_RocketLauncher");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                }
            }
            // - Rocket Item Check
            else if (IsRocketTemplate(ItemState))
            {
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_RLAnims_Unarmed.Anims.AS_RocketLauncher");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_RLAnims_Akimbo.Anims.AS_RocketLauncher");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_RLAnims_PrimaryPistol.Anims.AS_RocketLauncher");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_RLAnims.Anims.AS_RocketLauncher");
                }
            }
            // - Heavy Weapon Check
            else if (IsHeavyWeaponTemplate(ItemState))
            {
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                    AnimSetPaths.AddItem("Viper_HeavyAnims_Unamred.Anims.AS_Heavy");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_HeavyAnims_Akimbo.Anims.AS_Heavy");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_HeavyAnims_PrimaryPistol.Anims.AS_Heavy");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_HeavyAnims.Anims.AS_Heavy");
                }
            }
            // - Medkit Check
            else if (IsMedkitTemplate(ItemState))
            {
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_MedkitAnims_Unarmed.Anims.AS_Medkit");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_Unarmed.Anims.AS_Viper_NoCover");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_MedkitAnims_Akimbo.Anims.AS_Medkit");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1");
                    }
                    else if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2");
                    }
                    else if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3");
                    }
                    else if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims_PrimaryPistol.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_MedkitAnims_PrimaryPistol.Anims.AS_Medkit");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_StepAndFireAnims.Anims.AS_Viper");
                    AnimSetPaths.AddItem("Viper_MedkitAnims.Anims.AS_Medkit");
                }
            }
            // - Grenade Check
            else if (IsGrenadeTemplate(ItemState))
            {
                if (HasUnarmedPrimaryWeaponEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_GrenadeAnims_Unarmed.Anims.AS_Grenade");
                }
                else if (HasDualPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_GrenadeAnims_Akimbo.Anims.AS_Grenade");
                    if (default.bUseGunUpDownAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_GrenadeAnims_Akimbo.Anims.AS_Grenade_1");
                    }
                    if (default.bUseGunMidAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_GrenadeAnims_Akimbo.Anims.AS_Grenade_2");
                    }
                    if (default.bUseGunDownAkimboAnims || IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_GrenadeAnims_Akimbo.Anims.AS_Grenade_3");
                    }
                    if (default.bUseGunUpAkimboAnims && !IsTorque(UnitState))
                    {
                        AnimSetPaths.AddItem("Viper_GrenadeAnims_Akimbo.Anims.AS_Grenade_4");
                    }
                }
                else if (HasPrimaryPistolEquipped(UnitState))
                {
                    AnimSetPaths.AddItem("Viper_GrenadeAnims_PrimaryPistol.Anims.AS_Grenade");
                }
                else
                {
                    AnimSetPaths.AddItem("Viper_GrenadeAnims.Anims.AS_Grenade");
                }
            }
        }
        
        if (AnimSetPaths.Length > 0)
        {
            if (!bOverride)
            {
                CustomUnitPawnAnimsets = Weapon.CustomUnitPawnAnimsets;
                CustomUnitPawnAnimsetsFemale = Weapon.CustomUnitPawnAnimsetsFemale;
            }

            if (bResetAnimsets || !bOverride)
            {
                Weapon.CustomUnitPawnAnimsets.Length = 0;
                Weapon.CustomUnitPawnAnimsetsFemale.Length = 0;
            }

            foreach AnimSetPaths(AnimSetPath)
            {
                Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype(AnimSetPath)));
            }

            if (!bOverride)
            {
                foreach CustomUnitPawnAnimsets(Anim)
                {
                    Weapon.CustomUnitPawnAnimsets.AddItem(Anim);
                }

                foreach CustomUnitPawnAnimsetsFemale(Anim)
                {
                    Weapon.CustomUnitPawnAnimsetsFemale.AddItem(Anim);
                }
            }
        }
    }
}

static function AddAnimSet(XComUnitPawn Pawn, AnimSet AnimSetToAdd, optional int Index = -1)
{
	if (Pawn.Mesh.AnimSets.Find(AnimSetToAdd) == INDEX_NONE)
	{
		if (Index != INDEX_NONE)
		{
			Pawn.Mesh.AnimSets.InsertItem(Index, AnimSetToAdd);
		}
		else
		{
			Pawn.Mesh.AnimSets.AddItem(AnimSetToAdd);
		}
	}
}

// - See if the weapon is a primary or not
static public function bool IsPrimaryWeaponState(XComGameState_Item ItemState)
{	
	return ItemState != none && ItemState.InventorySlot == eInvSlot_PrimaryWeapon;
}

// - Compatibility with modded Viper weapons and Non-Viper Soldier Animations
static public function bool IsViperWeaponTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
            default.ViperWeaponTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.ViperBoltcasterTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.ArmoredViperWeaponTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsViperBoltCasterTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
            default.ViperBoltcasterTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsArmoredViperWeaponTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
            default.ArmoredViperWeaponTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Bolt Caster Checks
static public function bool IsBoltCasterTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
            default.BoltCasterTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Rifle Checks
static public function bool IsRifleTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.RifleTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.ConventionalRifleTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.MagneticRifleTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BeamRifleTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           (ItemState.GetWeaponCategory() == 'rifle' && default.RifleBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsConventionalRifleTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.ConventionalRifleTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsMagneticRifleTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.MagneticRifleTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamRifleTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamRifleTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - SMG/Bullpup Checks
static public function bool IsSMGTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.SMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.ConventionalSMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.MagneticSMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BeamSMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           (ItemState.GetWeaponCategory() == 'bullpup' && default.SMGBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsConventionalSMGTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.ConventionalSMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsMagneticSMGTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.MagneticSMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamSMGTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamSMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - DMR/Vektor Rifle Checks
static public function bool IsDMRTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.DMRTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BallisticDMRTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BeamDMRTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           (ItemState.GetWeaponCategory() == 'vektor_rifle' && default.DMRBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsBallisticDMRTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BallisticDMRTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamDMRTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamDMRTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Shotgun Checks
static public function bool IsShotgunTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.ShotgunTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.PumpShotgunTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.SemiShotgunTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BeamShotgunTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           (ItemState.GetWeaponCategory() == 'shotgun' && default.ShotgunBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsPumpShotgunTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.PumpShotgunTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsSemiShotgunTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.SemiShotgunTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamShotgunTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamShotgunTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Sniper Checks
static public function bool IsSniperTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.SniperTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BoltSniperTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.SemiSniperTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BeamSniperTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           (ItemState.GetWeaponCategory() == 'sniper_rifle' && default.SniperBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsBoltSniperTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BoltSniperTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsSemiSniperTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.SemiSniperTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamSniperTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamSniperTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Cannon Checks
static public function bool IsCannonTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.CannonTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.ConventionalCannonTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.MagneticCannonTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BeamCannonTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           (ItemState.GetWeaponCategory() == 'cannon' && default.CannonBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsConventionalCannonTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.ConventionalCannonTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsMagneticCannonTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.MagneticCannonTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamCannonTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamCannonTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - LMG/Battle Rifle Checks
static public function bool IsLMGTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.LMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.ConventionalLMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.MagneticLMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BeamLMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE);
}

static public function bool IsConventionalLMGTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.ConventionalLMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsMagneticLMGTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.MagneticLMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamLMGTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamLMGTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Pistol Checks
static public function bool IsPistolTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.PistolTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.SinglePistolTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.SemiPistolTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            default.BeamPistolTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           (ItemState.GetWeaponCategory() == 'pistol' && default.PistolBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsSinglePistolTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
            default.SinglePistolTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsSemiPistolTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
            default.SemiPistolTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamPistolTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
            default.BeamPistolTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Sidearm Checks
static public function bool IsSidearmTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none &&
            (default.SidearmTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
             default.AutoSidearmTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
             default.BeamSidearmTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
            (ItemState.GetWeaponCategory() == 'sidearm' && default.SidearmBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsAutoSidearmTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
            default.AutoSidearmTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamSidearmTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
            default.BeamSidearmTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Axe/Two-Handed weapon Check
static public function bool IsTwoHandedMeleeTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   default.TwoHandedMeleeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Knife Checks
static public function bool IsKnifeTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   default.KnifeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.ConventionalKnifeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.MagneticKnifeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.BeamKnifeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsConventionalKnifeTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.ConventionalKnifeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsMagneticKnifeTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.MagneticKnifeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamKnifeTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamKnifeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Rip-jack/Wrist Melee Checks
static public function bool IsWristBladeTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.WristBladeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.ConventionalWristBladeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.MagneticWristBladeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.BeamWristBladeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           (ItemState.GetWeaponCategory() == 'wristblade' && default.WristBladeBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsConventionalWristBladeTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.ConventionalWristBladeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsMagneticWristBladeTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.MagneticWristBladeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamWristBladeTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamWristBladeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Combat Knife Checks
static public function bool IsCombatKnifeTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.CombatKnifeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            (ItemState.GetWeaponCategory() == 'combatknife' && default.CombatKnifeBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Sword Check
static public function bool IsSwordTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   default.SwordTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
           (ItemState.GetWeaponCategory() == 'sword' && default.SwordBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Grenade Launcher Checks
static public function bool IsGrenadeLauncherTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.GrenadeLauncherTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            (ItemState.GetWeaponCategory() == 'grenade_launcher' && default.GrenadeLauncherBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Unarmed/Gauntlets Checks
static public function bool IsUnarmedWeaponTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
           (default.UnarmedWeaponTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
           ItemState.GetMyTemplateName() == 'EmptyPrimaryViper' ||
           ItemState.GetMyTemplateName() == 'BoaWeapon' ||
           default.GauntletWeaponTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           ItemState.GetWeaponCategory() == 'gauntlet' || ItemState.GetWeaponCategory() == 'replace_psiamp';
}

static public function bool IsTemplarGauntletTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.GauntletWeaponTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsEmptyWeaponTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && (ItemState.GetMyTemplateName() == 'EmptyPrimaryViper' || ItemState.GetMyTemplateName() == '') || ItemState.GetMyTemplateName() == '';
}

// - Psi-Amp Checks
static public function bool IsPsiAmpTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.PsiAmpTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            (ItemState.GetWeaponCategory() == 'psiamp' && default.PsiAmpBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Arc Thrower Checks
static public function bool IsArcThrowerTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.ArcThrowerTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            (ItemState.GetWeaponCategory() == 'arcthrower' && default.ArcThrowerBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Holo Targeter Checks
static public function bool IsHoloTargeterTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.HoloTargeterTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            (ItemState.GetWeaponCategory() == 'holotargeter' && default.HoloTargeterBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Sawed Off Checks
static public function bool IsSawedOffTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   (default.SawedOffTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.BuckshotSawedOffTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.BeamSawedOffTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE) ||
           (ItemState.GetWeaponCategory() == 'sawedoffshotgun' && default.SawedOffBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsBuckshotSawedOffTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BuckshotSawedOffTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamSawedOffTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamSawedOffTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - M.A.W/Spit/Pull Weapon Checks
static public function bool IsMAWTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.MAWTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
           (ItemState.GetWeaponCategory() == 'maw' && default.MAWBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Disposable Rocket Launcher Checks
static public function bool IsDRLTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   default.ConventionalDRLTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.MagneticDRLTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
		   default.BeamDRLTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
           ItemState.GetWeaponCategory() == 'iri_disposable_launcher';
}

static public function bool IsConventionalDRLTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.ConventionalDRLTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsMagneticDRLTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.MagneticDRLTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsBeamDRLTemplate(XComGameState_Item ItemState)
{
	return ItemState != none && default.BeamDRLTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Rocket Launcher Check
static public function bool IsRocketLauncherTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.RocketLauncherTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            (ItemState.GetWeaponCategory() == 'iri_rocket_launcher' && default.RocketLauncherBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Rocket Item Check
static public function bool IsRocketTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.RocketTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

// - Heavy Weapon/LW Gauntlet Checks
static public function bool IsHeavyWeaponTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.HeavyWeaponTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            ((ItemState.GetWeaponCategory() == 'heavy' || ItemState.GetWeaponCategory() == 'lw_gauntlet') && default.HeavyWeaponBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Medkit Check
static public function bool IsMedkitTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.MedkitTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            (ItemState.GetWeaponCategory() == 'medikit' && default.MedkitBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Grenade Check
static public function bool IsGrenadeTemplate(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		    default.GrenadeTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
            ((ItemState.GetWeaponCategory() == 'grenade' || ItemState.GetWeaponCategory() == 'utility') &&
            default.GrenadeBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
}

// - Shield Checks
//static public function bool IsShieldTemplate(XComGameState_Item ItemState)
//{	
//	return ItemState != none && 
//		    default.ShieldTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE ||
//            (ItemState.WeaponCat == 'shield' && default.ShieldBlacklist.Find(ItemState.GetMyTemplateName()) == INDEX_NONE);
//}

// - For Akimbo, Checks if the item is a pistol located either in the Primary or Secondary weapon slot
static public function bool IsPrimaryPistolWeaponState(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_PrimaryWeapon && 
		   default.AkimboPistolCategories.Find(ItemState.GetWeaponCategory()) != INDEX_NONE;
}

static public function bool IsSecondaryPistolWeaponState(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_SecondaryWeapon && 
		   default.AkimboPistolCategories.Find(ItemState.GetWeaponCategory()) != INDEX_NONE;
}

// - Checks whever the pistol is neither a Primary or Secondary pistol if the user is Dual Weilding pistols
static public function bool PistolIsNotDualWielded(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot != eInvSlot_PrimaryWeapon && ItemState.InventorySlot != eInvSlot_SecondaryWeapon;
}

// - Checks If the user has a pistol equipped in both the Primary and Secondary weapon slots
static public function bool HasDualPistolEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolWeaponState(PrimaryWeapon) &&
			IsSecondaryPistolWeaponState(SecondaryWeapon);
}

// - Checks If the user either have an unarmed weapon or gauntlets equipped as a primary weapon
static public function bool HasUnarmedPrimaryWeaponEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);

	return 	IsUnarmedWeaponTemplate(PrimaryWeapon);
}

static public function bool HasEmptyPrimaryWeaponEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);

	return 	IsEmptyWeaponTemplate(PrimaryWeapon);
}

static public function bool HasPrimaryPistolEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);

	return 	IsPrimaryPistolWeaponState(PrimaryWeapon) &&
		!HasDualPistolEquipped(UnitState, CheckGameState);
}

static public function bool HasKnifeEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item SecondaryWeapon, PistolSlot;

	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);
	PistolSlot = UnitState.GetItemInSlot(eInvSlot_Pistol, CheckGameState);

	return 	IsKnifeTemplate(SecondaryWeapon) || IsKnifeTemplate(PistolSlot);
}

static public function bool HasGauntletsEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item SecondaryWeapon, PistolSlot;

	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);
	PistolSlot = UnitState.GetItemInSlot(eInvSlot_Pistol, CheckGameState);

	return 	IsTemplarGauntletTemplate(SecondaryWeapon) || IsTemplarGauntletTemplate(PistolSlot);
}

//static public function bool HasPrimarySwordWeaponEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
//{
//	local XComGameState_Item PrimaryWeapon;
//
//	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
//
//	return 	IsSwordTemplate(PrimaryWeapon) &&
//		!HasDualMeleeEquipped(UnitState, CheckGameState) &&
//		!HasShieldEquipped(UnitState, CheckGameState);
//}

//static public function bool HasPrimaryKnifeWeaponEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
//{
//	local XComGameState_Item PrimaryWeapon;
//
//	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
//
//	return 	(IsKnifeTemplate(PrimaryWeapon) || IsCombatKnifeTemplate(PrimaryWeapon))  &&
//		!HasDualMeleeEquipped(UnitState, CheckGameState) &&
//		!HasShieldEquipped(UnitState, CheckGameState);
//}

//static public function bool HasPrimaryTwoHandedWeaponEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
//{
//	local XComGameState_Item PrimaryWeapon;
//
//	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
//
//	return 	IsTwoHandedMeleeTemplate(PrimaryWeapon) &&
//		!HasDualMeleeEquipped(UnitState, CheckGameState) &&
//		!HasShieldEquipped(UnitState, CheckGameState);
//}

//static function bool HasShieldEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
//{
//	local XComGameState_Item SecondaryWeapon;
//
//	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);
//
//	return 	IsShieldTemplate(SecondaryWeapon);
//}

//static function bool HasDualMeleeEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
//{
//	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;
//
//	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
//	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);
//
//	return 	IsPrimaryMeleeWeaponState(PrimaryWeapon) &&
//			IsSecondaryMeleeWeaponState(SecondaryWeapon);
//}
static public function bool IsCharacterViper(XComGameState_Unit UnitState)
{
	return UnitState != none && 
		    default.ViperCharacterTemplates.Find(UnitState.GetMyTemplateName()) != INDEX_NONE ||
            default.ViperSoldierCharacterTemplates.Find(UnitState.GetMyTemplateGroupName()) != INDEX_NONE ||
            default.TorqueCharacterTemplate.Find(UnitState.GetMyTemplateGroupName()) != INDEX_NONE ||
            default.ViperCivilianCharacterTemplates.Find(UnitState.GetMyTemplateGroupName()) != INDEX_NONE ||
            (default.ViperCharacterGroups.Find(UnitState.GetMyTemplateGroupName()) != INDEX_NONE &&
            default.BlacklistedViperTemplates.Find(UnitState.GetMyTemplateName()) == INDEX_NONE);
}

static public function bool IsCivilanViper(XComGameState_Unit UnitState)
{
	return UnitState != none && 
		    default.ViperCivilianCharacterTemplates.Find(UnitState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsCharacterMuton(XComGameState_Unit UnitState)
{
	return UnitState != none && 
		   (default.MutonCharacterTemplates.Find(UnitState.GetMyTemplateName()) != INDEX_NONE || default.MutonCharacterGroups.Find(UnitState.GetMyTemplateGroupName()) != INDEX_NONE ) &&
           default.BlacklistedMutonTemplates.Find(UnitState.GetMyTemplateName()) == INDEX_NONE;
}

static public function bool IsCharacterSectoid(XComGameState_Unit UnitState)
{
	return UnitState != none && 
		   (default.SectoidCharacterTemplates.Find(UnitState.GetMyTemplateName()) != INDEX_NONE || default.SectoidCharacterGroups.Find(UnitState.GetMyTemplateGroupName()) != INDEX_NONE ) &&
           default.BlacklistedSectoidTemplates.Find(UnitState.GetMyTemplateName()) == INDEX_NONE;
}

static public function bool IsViperKing(XComGameState_Unit UnitState)
{
	return UnitState != none && 
		   default.ViperKingCharacterTemplates.Find(UnitState.GetMyTemplateName()) != INDEX_NONE || default.ViperkingCharacterGroups.Find(UnitState.GetMyTemplateGroupName()) != INDEX_NONE;
}

static public function bool IsTorque(XComGameState_Unit UnitState)
{
	return UnitState != none && default.TorqueCharacterTemplate.Find(UnitState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsViperSoldier(XComGameState_Unit UnitState)
{
	return UnitState != none && 
		   default.ViperSoldierCharacterTemplates.Find(UnitState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsCharacterHumanlike(XComGameState_Unit UnitState)
{
	return UnitState != none && 
		   (UnitState.GetMyTemplate().bIsAdvent || UnitState.GetMyTemplate().bIsSoldier) && 
           (!UnitState.GetMyTemplate().bIsRobotic || default.AllowedRoboticHumanoidTemplates.Find(UnitState.GetMyTemplateName()) != INDEX_NONE) &&
           default.BlacklistedHumanoidTemplates.Find(UnitState.GetMyTemplateName()) == INDEX_NONE;
}

static function bool CanAddItemToInventory_CH_Improved(out int bCanAddItem, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, int Quantity, XComGameState_Unit UnitState, optional XComGameState CheckGameState, optional out string DisabledReason, optional XComGameState_Item ItemState)
{
    local X2WeaponTemplate              MAW;
    local XGParamTag                    LocTag;
    local bool                          OverrideNormalBehavior, DoNotOverrideNormalBehavior;

    OverrideNormalBehavior = CheckGameState != none;
    DoNotOverrideNormalBehavior = CheckGameState == none;
    MAW = X2WeaponTemplate(ItemTemplate);

	if (Slot == eInvSlot_ViperMAW && CheckGameState != none && UnitState.GetItemInSlot(eInvSlot_ViperMAW, CheckGameState) != none)
	{
	    return DoNotOverrideNormalBehavior;
	}

    if (MAW != none && MAW.WeaponCat == 'maw')
    {
        if (MAW.DataName == 'Inquisitor_MAW_I' || MAW.DataName == 'Inquisitor_MAW_II' || MAW.DataName == 'Inquisitor_MAW_III')
        {
            if (IsTorque(UnitState) || UnitState.GetMyTemplateName() == 'TorqueCivilian')
            {
                return DoNotOverrideNormalBehavior;
            }

            LocTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
            LocTag.StrValue0 = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager().FindSoldierClassTemplate('Torque_Inquisitor').DisplayName;
            DisabledReason = class'UIUtilities_Text'.static.CapsCheckForGermanScharfesS(`XEXPAND.ExpandString(class'UIArmory_Loadout'.default.m_strNeedsSoldierClass));
            bCanAddItem = 0;
            return OverrideNormalBehavior;
        }

        else
        {
            if (IsCharacterViper(UnitState) && !IsTorque(UnitState))
            {
                return DoNotOverrideNormalBehavior;
            }

            LocTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
            LocTag.StrValue0 = "VIPER";
            DisabledReason = class'UIUtilities_Text'.static.CapsCheckForGermanScharfesS(`XEXPAND.ExpandString(class'UIArmory_Loadout'.default.m_strNeedsSoldierClass));
            bCanAddItem = 0;
            return OverrideNormalBehavior;
        }
    }
    
    return DoNotOverrideNormalBehavior;
}