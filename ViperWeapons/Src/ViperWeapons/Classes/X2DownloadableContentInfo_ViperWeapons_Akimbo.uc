//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_ViperAnims.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_ViperWeapons_Akimbo extends X2DownloadableContentInfo;

var config(WeaponAnimations_Akimbo) bool AKIMBO_ENABLE_LOGGING;

var config(WeaponAnimations_Akimbo) array<name> PistolSingleShotTemplates;
var config(WeaponAnimations_Akimbo) array<name> PistolMultiShotTemplates;
var config(WeaponAnimations_Akimbo) array<name> SidearmTemplates;
var config(WeaponAnimations_Akimbo) array<name> PistolChargedTemplates;
var config(WeaponAnimations_Akimbo) array<name> SidearmChargedTemplates;

static function WeaponInitialized(XGWeapon WeaponArchetype, XComWeapon Weapon, optional XComGameState_Item ItemState = none)
{
    local X2WeaponTemplate		WeaponTemplate;
    local XComGameState_Unit	UnitState;
    Local XComGameState_Item	InternalWeaponState;
	local XComGameStateHistory	History;

	
	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ItemState.OwnerStateObject.ObjectID));

	History = `XCOMHISTORY;
    InternalWeaponState = ItemState;

    if (InternalWeaponState == none)
    {
        InternalWeaponState = XComGameState_Item(History.GetGameStateForObjectID(WeaponArchetype.ObjectID));
    }

    WeaponTemplate = X2WeaponTemplate(InternalWeaponState.GetMyTemplate());
    
	if (class'X2DownloadableContentInfo_ViperWeapons'.static.IsCharacterViper(UnitState) || class'X2DownloadableContentInfo_ViperWeapons'.static.IsTorque(UnitState))
    {
        if (class'X2DownloadableContentInfo_ViperWeapons'.static.HasDualPistolEquipped(UnitState) && WeaponTemplate != none)
        {
            if(class'X2DownloadableContentInfo_ViperWeapons'.static.IsPrimaryPistolWeaponState(InternalWeaponState))
            {
                Weapon.CustomUnitPawnAnimsets.Length = 0;
                Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Melee.Anims.AS_Akimbo_Melee")));
                Weapon.DefaultSocket = 'R_Hand';
                Weapon.WeaponFireAnimSequenceName = 'FF_Fire';
                Weapon.WeaponFireKillAnimSequenceName = 'FF_Fire';
                Weapon.WeaponSuppressionFireAnimSequenceName = 'FF_FireMultiShotConv';

                if (class'X2DownloadableContentInfo_ViperWeapons'.default.bUseGunUpDownAkimboAnims && !class'X2DownloadableContentInfo_ViperWeapons'.static.IsTorque(UnitState))
                {
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_1")));
                }
                if (class'X2DownloadableContentInfo_ViperWeapons'.default.bUseGunMidAkimboAnims && !class'X2DownloadableContentInfo_ViperWeapons'.static.IsTorque(UnitState))
                {
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_2")));
                }
                if (class'X2DownloadableContentInfo_ViperWeapons'.default.bUseGunDownAkimboAnims || class'X2DownloadableContentInfo_ViperWeapons'.static.IsTorque(UnitState))
                {
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_3")));
                }
                if (class'X2DownloadableContentInfo_ViperWeapons'.default.bUseGunUpAkimboAnims && !class'X2DownloadableContentInfo_ViperWeapons'.static.IsTorque(UnitState))
                {
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_StepAndFireAnims_Akimbo.Anims.AS_Viper_4")));
                }

                if (HasDualPistolSingleShotEquipped(UnitState))
                {
			        `Log("Dual Single Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Pistol_Pistol")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasPistolSingleShotAndPistolMultiShotEquipped(UnitState))
                {
			        `Log("Single Shot + Multi Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Pistol_PistolSemi")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasPistolSingleShotAndSidearmEquipped(UnitState))
                {
			        `Log("Single Shot + Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Pistol_Sidearm")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasPistolSingleShotAndChargedPistolEquipped(UnitState))
                {
			        `Log("Single Shot + Charged Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Pistol_PistolCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasPistolSingleShotAndChargedSidearmEquipped(UnitState))
                {
			        `Log("Single Shot + Charged Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Pistol_SidearmCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasPistolMultiShotAndPistolSingleShotEquipped(UnitState))
                {
			        `Log("Multi Shot + Single Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolSemi_Pistol")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasDualPistolMultiShotEquipped(UnitState))
                {
			        `Log("Dual Multi Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolSemi_PistolSemi")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasPistolMultiShotAndSidearmEquipped(UnitState))
                {
			        `Log("Multi Shot + Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolSemi_Sidearm")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasPistolMultiShotAndChargedPistolEquipped(UnitState))
                {
			        `Log("Multi Shot + Charged Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolSemi_PistolCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasPistolMultiShotAndChargedSidearmEquipped(UnitState))
                {
			        `Log("Multi Shot + Charged Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolSemi_SidearmCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
                else if (HasSidearmAndPistolSingleShotEquipped(UnitState))
                {
			        `Log("Auto + Single Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Sidearm_Pistol")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_Sidearm")));
                }
                else if (HasSidearmAndPistolMultiShotEquipped(UnitState))
                {
			        `Log("Auto + Multi Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Sidearm_PistolSemi")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_Sidearm")));
                }
                else if (HasDualSidearmEquipped(UnitState))
                {
			        `Log("Dual Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Sidearm_Sidearm")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_Sidearm")));
                }
                else if (HasSidearmAndChargedPistolEquipped(UnitState))
                {
			        `Log("Auto + Charged Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Sidearm_PistolCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_Sidearm")));
                }
                else if (HasSidearmAndChargedSidearmEquipped(UnitState))
                {
			        `Log("Auto + Charged Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Sidearm_SidearmCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_Sidearm")));
                }
                else if (HasChargedPistolAndPistolSingleShotEquipped(UnitState))
                {
			        `Log("Charged + Single Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolCharged_Pistol")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamPistol")));
                }
                else if (HasChargedPistolAndPistolMultiShotEquipped(UnitState))
                {
			        `Log("Charged + Multi Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolCharged_PistolSemi")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamPistol")));
                }
                else if (HasChargedPistolAndSidearmEquipped(UnitState))
                {
			        `Log("Charged + Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolCharged_Sidearm")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamPistol")));
                }
                else if (HasDualChargedPistolEquipped(UnitState))
                {
			        `Log("Dual Charged Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolCharged_PistolCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamPistol")));
                }
                else if (HasChargedPistolAndChargedSidearmEquipped(UnitState))
                {
			        `Log("Charged + Charged Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_PistolCharged_SidearmCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamPistol")));
                }
                else if (HasChargedSidearmAndPistolSingleShotEquipped(UnitState))
                {
			        `Log("Charged Auto + Single Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_SidearmCharged_Pistol")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamSidearm")));
                }
                else if (HasChargedSidearmAndPistolMultiShotEquipped(UnitState))
                {
			        `Log("Charged Auto + Multi Shot Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_SidearmCharged_PistolSemi")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolSemi_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamSidearm")));
                }
                else if (HasChargedSidearmAndSidearmEquipped(UnitState))
                {
			        `Log("Charged Auto + Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_SidearmCharged_Sidearm")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Sidearm_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamSidearm")));
                }
                else if (HasChargedSidearmAndChargedPistolEquipped(UnitState))
                {
			        `Log("Charged Auto + Charged Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_SidearmCharged_PistolCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_PistolCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamSidearm")));
                }
                else if (HasDualChargedSidearmEquipped(UnitState))
                {
			        `Log("Dual Charged Auto Equipped");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_SidearmCharged_SidearmCharged")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_SidearmCharged_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate_BeamSidearm")));
                }
                else
                {
			        `Log("Invalid Akimbo Pairing, Using Dual Single Animations");
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_DualShot.Anims.AS_Pistol_Pistol")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Right")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_SingleShot.Anims.AS_Pistol_Left")));
                    Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(`CONTENT.RequestGameArchetype("Viper_AkimboAnims_Checkmate.Anims.AS_Checkmate")));
                }
            }
            if(class'X2DownloadableContentInfo_ViperWeapons'.static.IsSecondaryPistolWeaponState(InternalWeaponState))
            {
                Weapon.DefaultSocket = 'L_Hand';
        
                Weapon.CustomUnitPawnAnimsets.Length = 0;
                Weapon.WeaponFireAnimSequenceName = '';
                Weapon.WeaponFireKillAnimSequenceName = '';
                Weapon.WeaponSuppressionFireAnimSequenceName = '';
            }
        }
    }
}

static public function bool IsPrimaryPistolSingleShot(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_PrimaryWeapon && 
		   default.PistolSingleShotTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsPrimaryPistolMultiShot(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_PrimaryWeapon && 
		   default.PistolMultiShotTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsPrimarySidearm(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_PrimaryWeapon && 
		   default.SidearmTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsPrimaryPistolCharged(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_PrimaryWeapon && 
		   default.PistolChargedTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsPrimarySidearmCharged(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_PrimaryWeapon && 
		   default.SidearmChargedTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsSecondaryPistolSingleShot(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_SecondaryWeapon && 
		   default.PistolSingleShotTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsSecondaryPistolMultiShot(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_SecondaryWeapon && 
		   default.PistolMultiShotTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsSecondarySidearm(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_SecondaryWeapon && 
		   default.SidearmTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsSecondaryPistolCharged(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_SecondaryWeapon && 
		   default.PistolChargedTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool IsSecondarySidearmCharged(XComGameState_Item ItemState)
{	
	return ItemState != none && 
		   ItemState.InventorySlot == eInvSlot_SecondaryWeapon && 
		   default.SidearmChargedTemplates.Find(ItemState.GetMyTemplateName()) != INDEX_NONE;
}

static public function bool HasDualPistolSingleShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolSingleShot(PrimaryWeapon) &&
			IsSecondaryPistolSingleShot(SecondaryWeapon);
}

static public function bool HasDualPistolMultiShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolMultiShot(PrimaryWeapon) &&
			IsSecondaryPistolMultiShot(SecondaryWeapon);
}

static public function bool HasDualSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearm(PrimaryWeapon) &&
			IsSecondarySidearm(SecondaryWeapon);
}

static public function bool HasDualChargedPistolEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolCharged(PrimaryWeapon) &&
			IsSecondaryPistolCharged(SecondaryWeapon);
}

static public function bool HasDualChargedSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearmCharged(PrimaryWeapon) &&
			IsSecondarySidearmCharged(SecondaryWeapon);
}

static public function bool HasPistolMultiShotAndPistolSingleShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolMultiShot(PrimaryWeapon) &&
			IsSecondaryPistolSingleShot(SecondaryWeapon);
}

static public function bool HasSidearmAndPistolSingleShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearm(PrimaryWeapon) &&
			IsSecondaryPistolSingleShot(SecondaryWeapon);
}

static public function bool HasChargedPistolAndPistolSingleShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolCharged(PrimaryWeapon) &&
			IsSecondaryPistolSingleShot(SecondaryWeapon);
}

static public function bool HasChargedSidearmAndPistolSingleShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearmCharged(PrimaryWeapon) &&
			IsSecondaryPistolSingleShot(SecondaryWeapon);
}

static public function bool HasPistolSingleShotAndPistolMultiShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolSingleShot(PrimaryWeapon) &&
			IsSecondaryPistolMultiShot(SecondaryWeapon);
}

static public function bool HasSidearmAndPistolMultiShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearm(PrimaryWeapon) &&
			IsSecondaryPistolMultiShot(SecondaryWeapon);
}

static public function bool HasChargedPistolAndPistolMultiShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolCharged(PrimaryWeapon) &&
			IsSecondaryPistolMultiShot(SecondaryWeapon);
}

static public function bool HasChargedSidearmAndPistolMultiShotEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearmCharged(PrimaryWeapon) &&
			IsSecondaryPistolMultiShot(SecondaryWeapon);
}

static public function bool HasPistolSingleShotAndSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolSingleShot(PrimaryWeapon) &&
			IsSecondarySidearm(SecondaryWeapon);
}

static public function bool HasPistolMultiShotAndSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolMultiShot(PrimaryWeapon) &&
			IsSecondarySidearm(SecondaryWeapon);
}

static public function bool HasChargedPistolAndSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolCharged(PrimaryWeapon) &&
			IsSecondarySidearm(SecondaryWeapon);
}

static public function bool HasChargedSidearmAndSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearmCharged(PrimaryWeapon) &&
			IsSecondarySidearm(SecondaryWeapon);
}

static public function bool HasPistolSingleShotAndChargedPistolEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolSingleShot(PrimaryWeapon) &&
			IsSecondaryPistolCharged(SecondaryWeapon);
}

static public function bool HasPistolMultiShotAndChargedPistolEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolMultiShot(PrimaryWeapon) &&
			IsSecondaryPistolCharged(SecondaryWeapon);
}

static public function bool HasSidearmAndChargedPistolEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearm(PrimaryWeapon) &&
			IsSecondaryPistolCharged(SecondaryWeapon);
}

static public function bool HasChargedSidearmAndChargedPistolEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearmCharged(PrimaryWeapon) &&
			IsSecondaryPistolCharged(SecondaryWeapon);
}

static public function bool HasPistolSingleShotAndChargedSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolSingleShot(PrimaryWeapon) &&
			IsSecondarySidearmCharged(SecondaryWeapon);
}

static public function bool HasPistolMultiShotAndChargedSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolMultiShot(PrimaryWeapon) &&
			IsSecondarySidearmCharged(SecondaryWeapon);
}

static public function bool HasSidearmAndChargedSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimarySidearm(PrimaryWeapon) &&
			IsSecondarySidearmCharged(SecondaryWeapon);
}

static public function bool HasChargedPistolAndChargedSidearmEquipped(XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	local XComGameState_Item PrimaryWeapon, SecondaryWeapon;

	PrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, CheckGameState);
	SecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, CheckGameState);

	return 	IsPrimaryPistolCharged(PrimaryWeapon) &&
			IsSecondarySidearmCharged(SecondaryWeapon);
}
