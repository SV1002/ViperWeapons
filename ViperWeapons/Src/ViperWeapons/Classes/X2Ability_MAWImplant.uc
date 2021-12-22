class X2Ability_MAWImplant extends X2Ability config(ViperMAWConfig);

var config int MAW_BiteCost;
var config int MAW_BiteCooldown;
var config bool MAW_Bite_EndsTurn;
var config int MAW_SpitCooldown;


var config WeaponDamageValue Poison_I_DamagePerTurn;
var config WeaponDamageValue Poison_II_DamagePerTurn;
var config WeaponDamageValue Poison_III_DamagePerTurn;

var config int Poison_I_Durnation;
var config int Poison_II_Durnation;
var config int Poison_III_Durnation;

var config int Poison_I_MobilityMalus;
var config int Poison_II_MobilityMalus;
var config int Poison_III_MobilityMalus;

var config int Poison_I_AimMalus;
var config int Poison_II_AimMalus;
var config int Poison_III_AimMalus;


var config WeaponDamageValue Acid_I_InitialDamage;
var config WeaponDamageValue Acid_II_InitialDamage;
var config WeaponDamageValue Acid_III_InitialDamage;

var config int Acid_I_DamagePerTurn;
var config int Acid_II_DamagePerTurn;
var config int Acid_III_DamagePerTurn;

var config int Acid_I_DamageSpreadPerTurn;
var config int Acid_II_DamageSpreadPerTurn;
var config int Acid_III_DamageSpreadPerTurn;

var config int Acid_I_Durnation;
var config int Acid_II_Durnation;
var config int Acid_III_Durnation;


var config int Heal_I_HealAmmount;
var config int Heal_II_HealAmmount;
var config int Heal_III_HealAmmount;

var config int Heal_I_DisorientedChance;
var config int Heal_II_DisorientedChance;
var config int Heal_III_DisorientedChance;

var config int Heal_I_DisorientedDurnation;
var config int Heal_II_DisorientedDurnation;
var config int Heal_III_DisorientedDurnation;

var config int Heal_I_StunnedChance;
var config int Heal_II_StunnedChance;
var config int Heal_III_StunnedChance;

var config int Heal_I_StunnedDurnation;
var config int Heal_II_StunnedDurnation;
var config int Heal_III_StunnedDurnation;

var config int Heal_I_UnconsciousChance;
var config int Heal_II_UnconsciousChance;
var config int Heal_III_UnconsciousChance;


var config WeaponDamageValue Electric_I_InitialDamage;
var config WeaponDamageValue Electric_II_InitialDamage;
var config WeaponDamageValue Electric_III_InitialDamage;

var config int Electric_I_StunnedChance;
var config int Electric_II_StunnedChance;
var config int Electric_III_StunnedChance;

var config int Electric_I_StunnedDurnation;
var config int Electric_II_StunnedDurnation;
var config int Electric_III_StunnedDurnation;


var config int Fire_I_DamagePerTurn;
var config int Fire_II_DamagePerTurn;
var config int Fire_III_DamagePerTurn;

var config int Fire_I_DamageSpreadPerTurn;
var config int Fire_II_DamageSpreadPerTurn;
var config int Fire_III_DamageSpreadPerTurn;

var config int Fire_I_Durnation;
var config int Fire_II_Durnation;
var config int Fire_III_Durnation;


var config int Ice_I_Durnation;
var config int Ice_II_Durnation;
var config int Ice_III_Durnation;

var config int Ice_I_DurnationRuler;
var config int Ice_II_DurnationRuler;
var config int Ice_III_DurnationRuler;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(MAW_NeutralBite_Template('MAW_NeutralBite'));


	Templates.AddItem(MAW_PoisonSpit_Template('MAW_PoisonSpit_I', default.Poison_I_DamagePerTurn, default.Poison_I_Durnation, default.Poison_I_MobilityMalus, default.Poison_I_AimMalus));
	Templates.AddItem(MAW_PoisonSpit_Template('MAW_PoisonSpit_II', default.Poison_II_DamagePerTurn, default.Poison_II_Durnation, default.Poison_II_MobilityMalus, default.Poison_II_AimMalus));
	Templates.AddItem(MAW_PoisonSpit_Template('MAW_PoisonSpit_III', default.Poison_III_DamagePerTurn, default.Poison_III_Durnation, default.Poison_III_MobilityMalus, default.Poison_III_AimMalus));

	Templates.AddItem(MAW_PoisonBite_Template('MAW_PoisonBite_I', default.Poison_I_DamagePerTurn, default.Poison_I_Durnation, default.Poison_I_MobilityMalus, default.Poison_I_AimMalus));
	Templates.AddItem(MAW_PoisonBite_Template('MAW_PoisonBite_II', default.Poison_II_DamagePerTurn, default.Poison_II_Durnation, default.Poison_II_MobilityMalus, default.Poison_II_AimMalus));
	Templates.AddItem(MAW_PoisonBite_Template('MAW_PoisonBite_III', default.Poison_III_DamagePerTurn, default.Poison_III_Durnation, default.Poison_III_MobilityMalus, default.Poison_III_AimMalus));


	Templates.AddItem(MAW_IceSpit_Template('MAW_IceSpit_I', default.Ice_I_Durnation, default.Ice_I_DurnationRuler));
	Templates.AddItem(MAW_IceSpit_Template('MAW_IceSpit_II', default.Ice_II_Durnation, default.Ice_II_DurnationRuler));
	Templates.AddItem(MAW_IceSpit_Template('MAW_IceSpit_III', default.Ice_III_Durnation, default.Ice_III_DurnationRuler));

	Templates.AddItem(MAW_IceBite_Template('MAW_IceBite_I', default.Ice_I_Durnation, default.Ice_I_DurnationRuler));
	Templates.AddItem(MAW_IceBite_Template('MAW_IceBite_II', default.Ice_II_Durnation, default.Ice_II_DurnationRuler));
	Templates.AddItem(MAW_IceBite_Template('MAW_IceBite_III', default.Ice_III_Durnation, default.Ice_III_DurnationRuler));


	Templates.AddItem(MAW_HealSpit_Template('MAW_HealSpit_I', default.Heal_I_HealAmmount, default.Heal_I_DisorientedChance, default.Heal_I_DisorientedDurnation, default.Heal_I_StunnedChance, default.Heal_I_StunnedDurnation, default.Heal_I_UnconsciousChance));
	Templates.AddItem(MAW_HealSpit_Template('MAW_HealSpit_II', default.Heal_II_HealAmmount, default.Heal_II_DisorientedChance, default.Heal_II_DisorientedDurnation, default.Heal_II_StunnedChance, default.Heal_II_StunnedDurnation, default.Heal_II_UnconsciousChance));
	Templates.AddItem(MAW_HealSpit_Template('MAW_HealSpit_III', default.Heal_III_HealAmmount, default.Heal_III_DisorientedChance, default.Heal_III_DisorientedDurnation, default.Heal_III_StunnedChance, default.Heal_III_StunnedDurnation, default.Heal_III_UnconsciousChance));

	Templates.AddItem(MAW_HealBite_Template('MAW_HealBite_I', default.Heal_I_DisorientedChance, default.Heal_I_DisorientedDurnation, default.Heal_I_StunnedChance, default.Heal_I_StunnedDurnation, default.Heal_I_UnconsciousChance));
	Templates.AddItem(MAW_HealBite_Template('MAW_HealBite_II', default.Heal_II_DisorientedChance, default.Heal_II_DisorientedDurnation, default.Heal_II_StunnedChance, default.Heal_II_StunnedDurnation, default.Heal_II_UnconsciousChance));
	Templates.AddItem(MAW_HealBite_Template('MAW_HealBite_III', default.Heal_III_DisorientedChance, default.Heal_III_DisorientedDurnation, default.Heal_III_StunnedChance, default.Heal_III_StunnedDurnation, default.Heal_III_UnconsciousChance));


	Templates.AddItem(MAW_AcidSpit_Template('MAW_AcidSpit_I', default.Acid_I_InitialDamage, default.Acid_I_DamagePerTurn, default.Acid_I_DamageSpreadPerTurn, default.Acid_I_Durnation));
	Templates.AddItem(MAW_AcidSpit_Template('MAW_AcidSpit_II', default.Acid_II_InitialDamage, default.Acid_II_DamagePerTurn, default.Acid_II_DamageSpreadPerTurn, default.Acid_II_Durnation));
	Templates.AddItem(MAW_AcidSpit_Template('MAW_AcidSpit_III', default.Acid_III_InitialDamage, default.Acid_III_DamagePerTurn, default.Acid_III_DamageSpreadPerTurn, default.Acid_III_Durnation));

	Templates.AddItem(MAW_AcidBite_Template('MAW_AcidBite_I', default.Acid_I_DamagePerTurn, default.Acid_I_DamageSpreadPerTurn, default.Acid_I_Durnation));
	Templates.AddItem(MAW_AcidBite_Template('MAW_AcidBite_II', default.Acid_II_DamagePerTurn, default.Acid_II_DamageSpreadPerTurn, default.Acid_II_Durnation));
	Templates.AddItem(MAW_AcidBite_Template('MAW_AcidBite_III', default.Acid_III_DamagePerTurn, default.Acid_III_DamageSpreadPerTurn, default.Acid_III_Durnation));


	Templates.AddItem(MAW_FireSpit_Template('MAW_FireSpit_I', default.Fire_I_DamagePerTurn, default.Fire_I_DamageSpreadPerTurn, default.Fire_I_Durnation));
	Templates.AddItem(MAW_FireSpit_Template('MAW_FireSpit_II', default.Fire_II_DamagePerTurn, default.Fire_II_DamageSpreadPerTurn, default.Fire_II_Durnation));
	Templates.AddItem(MAW_FireSpit_Template('MAW_FireSpit_III', default.Fire_III_DamagePerTurn, default.Fire_III_DamageSpreadPerTurn, default.Fire_III_Durnation));

	Templates.AddItem(MAW_FireBite_Template('MAW_FireBite_I', default.Fire_I_DamagePerTurn, default.Fire_I_DamageSpreadPerTurn, default.Fire_I_Durnation));
	Templates.AddItem(MAW_FireBite_Template('MAW_FireBite_II', default.Fire_II_DamagePerTurn, default.Fire_II_DamageSpreadPerTurn, default.Fire_II_Durnation));
	Templates.AddItem(MAW_FireBite_Template('MAW_FireBite_III', default.Fire_III_DamagePerTurn, default.Fire_III_DamageSpreadPerTurn, default.Fire_III_Durnation));
	

	Templates.AddItem(MAW_ElectricSpit_Template('MAW_ElectricSpit_I', default.Electric_I_InitialDamage, default.Electric_I_StunnedChance, default.Electric_I_StunnedDurnation));
	Templates.AddItem(MAW_ElectricSpit_Template('MAW_ElectricSpit_II', default.Electric_II_InitialDamage, default.Electric_II_StunnedChance, default.Electric_II_StunnedDurnation));
	Templates.AddItem(MAW_ElectricSpit_Template('MAW_ElectricSpit_III', default.Electric_III_InitialDamage, default.Electric_III_StunnedChance, default.Electric_III_StunnedDurnation));

	Templates.AddItem(MAW_ElectricBite_Template('MAW_ElectricBite_I', default.Electric_I_StunnedChance, default.Electric_I_StunnedDurnation));
	Templates.AddItem(MAW_ElectricBite_Template('MAW_ElectricBite_II', default.Electric_II_StunnedChance, default.Electric_II_StunnedDurnation));
	Templates.AddItem(MAW_ElectricBite_Template('MAW_ElectricBite_III', default.Electric_III_StunnedChance, default.Electric_III_StunnedDurnation));

	Templates.AddItem(Viper_MAW_Bonus('Viper_MAW_I_Bonus'));
	Templates.AddItem(Viper_MAW_Bonus('Viper_MAW_II_Bonus'));
	Templates.AddItem(Viper_MAW_Bonus('Viper_MAW_III_Bonus'));

	return Templates;
}

static function X2AbilityTemplate Viper_MAW_Bonus(name TemplateName)
{
	local X2AbilityTemplate					Template;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_command";
    Template.bDisplayInUITacticalText = false;
    Template.bDisplayInUITooltip = false;
    Template.bDontDisplayInAbilitySummary = true;
    Template.bHideOnClassUnlock = true;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	
	return Template;
}

static function X2AbilityTemplate MAW_NeutralBite_Template(name TemplateName)
{
	local X2AbilityTemplate						Template;
	local X2AbilityCooldown  					Cooldown;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		MeleeHitCalc;
	local X2Effect_ApplyWeaponDamage			DamageEffect;
	local X2Condition_UnitProperty          	UnitPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_Bite";
	Template.ShotHUDPriority = 512;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.bCrossClassEligible = false;
	Template.bDisplayInUITooltip = true;
    Template.bDisplayInUITacticalText = true;
    Template.DisplayTargetHitChance = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.MAW_BiteCost;
	ActionPointCost.bConsumeAllPoints = default.MAW_Bite_EndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_BiteCooldown;
	Template.AbilityCooldown = Cooldown;

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;
    Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.WithinRange = 144; //1.5 tiles in Unreal units, allows attacks on the diag
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(DamageEffect);

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipExitCoverWhenFiring = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'FF_BiteNormal';
	Template.CinescriptCameraType = "Viper_Bite";
	Template.ActivationSpeech = 'ArcThrower';
	Template.SourceMissSpeech = 'SwordMiss';

	Template.AddShooterEffectExclusions();

	return Template;
}

static function X2AbilityTemplate MAW_PoisonSpit_Template(name TemplateName, WeaponDamageValue DamagePerTurn, int EffectDurnation, int EffectMobilityMalus, int EffectAimMalus)
{
	local X2AbilityTemplate                 		Template;	
	local X2AbilityCost_ActionPoints				ActionPointCost;
	local X2AbilityTarget_Cursor            		CursorTarget;
	local X2AbilityMultiTarget_Cylinder     		CylinderMultiTarget;
	local X2Condition_UnitProperty          		UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      		InputTrigger;
	local X2AbilityCooldown  						Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.bDontDisplayInAbilitySummary = true;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_poisonspit";
	Template.ShotHUDPriority = 511;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_SpitCooldown;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;

	Template.AddMultiTargetEffect(CreateMAW_PoisonStatusEffect(DamagePerTurn, EffectDurnation, EffectMobilityMalus, EffectAimMalus));
	Template.AddMultiTargetEffect(new class'X2Effect_ApplyPoisonToWorld');

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	CylinderMultiTarget = new class'X2AbilityMultiTarget_Cylinder';
	CylinderMultiTarget.bUseWeaponRadius = true;
	CylinderMultiTarget.fTargetHeight = 3;
	CylinderMultiTarget.bUseOnlyGroundTiles = true;
	Template.AbilityMultiTargetStyle = CylinderMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition); 
	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_poisonspit";
	Template.bUseAmmoAsChargesForHUD = false;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Viper_SpitPoison";

	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.ActivationSpeech = 'RepairSHIV';

	return Template;
}

static function X2AbilityTemplate MAW_PoisonBite_Template(name TemplateName, WeaponDamageValue DamagePerTurn, int EffectDurnation, int EffectMobilityMalus, int EffectAimMalus)
{
	local X2AbilityTemplate						Template;
	local X2AbilityCooldown  					Cooldown;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		MeleeHitCalc;
	local X2Effect_ApplyWeaponDamage			DamageEffect;
	local X2Condition_UnitProperty          	UnitPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_Bite";
	Template.ShotHUDPriority = 512;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.bCrossClassEligible = false;
	Template.bDisplayInUITooltip = true;
    Template.bDisplayInUITacticalText = true;
    Template.DisplayTargetHitChance = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.MAW_BiteCost;
	ActionPointCost.bConsumeAllPoints = default.MAW_Bite_EndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_BiteCooldown;
	Template.AbilityCooldown = Cooldown;

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;
    Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.WithinRange = 144; //1.5 tiles in Unreal units, allows attacks on the diag
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AddTargetEffect(CreateMAW_PoisonStatusEffect(DamagePerTurn, EffectDurnation, EffectMobilityMalus, EffectAimMalus));

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(DamageEffect);

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipExitCoverWhenFiring = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'FF_BitePoison';
	Template.CinescriptCameraType = "Viper_Bite";
	Template.ActivationSpeech = 'ArcThrower';
	Template.SourceMissSpeech = 'SwordMiss';

	Template.AddShooterEffectExclusions();

	return Template;
}

static function X2AbilityTemplate MAW_IceSpit_Template(name TemplateName, int EffectDurnation, int EffectDurnationRuler)
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown                 Cooldown;

	// HUD
	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.bDontDisplayInAbilitySummary = true;
	Template.IconImage = "img:///UILibrary_DLC2Images.UIPerk_freezingbreath";
    Template.AbilitySourceName = 'eAbilitySource_Standard';
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
    Template.Hostility = eHostility_Offensive;
    Template.ShotHUDPriority = 511;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_SpitCooldown;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;

	Template.AddMultiTargetEffect(CreateMAW_FreezeEffect(EffectDurnation, EffectDurnationRuler));
	Template.AddMultiTargetEffect(class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeRemoveEffects());

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = false;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Viper_PoisonSpit";

	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';

	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'HL_SpitIce';

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.ActivationSpeech = 'RepairSHIV';

	return Template;
}

static function X2AbilityTemplate MAW_IceBite_Template(name TemplateName, int EffectDurnation, int EffectDurnationRuler)
{
	local X2AbilityTemplate						Template;
	local X2AbilityCooldown  					Cooldown;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		MeleeHitCalc;
	local X2Effect_ApplyWeaponDamage			DamageEffect;
	local X2Condition_UnitProperty          	UnitPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_Bite";
	Template.ShotHUDPriority = 512;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.bCrossClassEligible = false;
	Template.bDisplayInUITooltip = true;
    Template.bDisplayInUITacticalText = true;
    Template.DisplayTargetHitChance = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.MAW_BiteCost;
	ActionPointCost.bConsumeAllPoints = default.MAW_Bite_EndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_BiteCooldown;
	Template.AbilityCooldown = Cooldown;

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;
    Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.WithinRange = 144; //1.5 tiles in Unreal units, allows attacks on the diag
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AddTargetEffect(CreateMAW_FreezeEffect(EffectDurnation, EffectDurnationRuler));
	Template.AddTargetEffect(class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeRemoveEffects());

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(DamageEffect);

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipExitCoverWhenFiring = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'FF_BiteIce';
	Template.CinescriptCameraType = "Viper_Bite";
	Template.ActivationSpeech = 'ArcThrower';
	Template.SourceMissSpeech = 'SwordMiss';

	Template.AddShooterEffectExclusions();

	return Template;
}

static function X2AbilityTemplate MAW_HealSpit_Template(name TemplateName, int HealAmmount, int DisorientedChance, int DisorientedTurns, int StunnedChance, int StunnedTurns, int UnconsciousChance)
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition, IsHealableAlly, IsHostile;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_ApplyMedikitHeal			Heal;
	local X2Condition_UnitEffects           AllyNotBleedingOut;
	local X2Condition_UnitStatCheck         AllyNotDead;
	local X2Effect_PersistentStatChange		Disoriented;
	local X2Effect_Stunned					Stunned;
	local X2Effect_Persistent				Unconscious;

	// HUD
	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.bDontDisplayInAbilitySummary = true;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_HealSpit";
    Template.AbilitySourceName = 'eAbilitySource_Standard';
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
    Template.Hostility = eHostility_Offensive;
    Template.ShotHUDPriority = 511;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_SpitCooldown;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;

	IsHealableAlly = new class'X2Condition_UnitProperty';
	IsHealableAlly.ExcludeHostileToSource = true;
	IsHealableAlly.ExcludeFriendlyToSource = false;
	IsHealableAlly.ExcludeFullHealth = true;
	IsHealableAlly.RequireSquadmates = true;
	IsHealableAlly.ExcludeDead = false;
	IsHealableAlly.ExcludeRobotic = true;

	IsHostile = new class'X2Condition_UnitProperty';
	IsHostile.ExcludeDead = true;
	IsHostile.ExcludeHostileToSource = false;
	IsHostile.ExcludeFriendlyToSource = true;
	IsHostile.ExcludeRobotic = true;

	AllyNotDead = new class'X2Condition_UnitStatCheck';
	AllyNotDead.AddCheckStat(eStat_HP, 0, eCheck_GreaterThan);

	AllyNotBleedingOut = new class'X2Condition_UnitEffects';
	AllyNotBleedingOut.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');

	Heal = new class'X2Effect_ApplyMedikitHeal';
	Heal.PerUseHP  = HealAmmount;
	Heal.TargetConditions.AddItem(IsHealableAlly);
	Heal.TargetConditions.AddItem(AllyNotBleedingOut);
	Heal.TargetConditions.AddItem(AllyNotDead);
	Template.AddMultiTargetEffect(Heal);

	Disoriented = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	Disoriented.iNumTurns = DisorientedTurns;
	Disoriented.ApplyChance = DisorientedChance;
	Disoriented.TargetConditions.AddItem(IsHostile);
	Template.AddMultiTargetEffect(Disoriented);

	Stunned = class'X2StatusEffects'.static.CreateStunnedStatusEffect(StunnedTurns, StunnedChance, false);
	Stunned.TargetConditions.AddItem(IsHostile);
	Template.AddMultiTargetEffect(Stunned);

	Unconscious = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	Unconscious.ApplyChance = UnconsciousChance;
	Unconscious.TargetConditions.AddItem(IsHostile);
	Template.AddMultiTargetEffect(Unconscious);

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Viper_PoisonSpit";

	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';

	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'HL_SpitHeal';

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.ActivationSpeech = 'RepairSHIV';

	return Template;
}

static function X2AbilityTemplate MAW_HealBite_Template(name TemplateName, int DisorientedChance, int DisorientedTurns, int StunnedChance, int StunnedTurns, int UnconsciousChance)
{
	local X2AbilityTemplate						Template;
	local X2AbilityCooldown  					Cooldown;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		MeleeHitCalc;
	local X2Condition_UnitProperty          	UnitPropertyCondition;
	local X2Effect_PersistentStatChange			Disoriented;
	local X2Effect_Stunned						Stunned;
	local X2Effect_Persistent					Unconscious;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_Bite";
	Template.ShotHUDPriority = 512;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.bCrossClassEligible = false;
	Template.bDisplayInUITooltip = true;
    Template.bDisplayInUITacticalText = true;
    Template.DisplayTargetHitChance = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.MAW_BiteCost;
	ActionPointCost.bConsumeAllPoints = default.MAW_Bite_EndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_BiteCooldown;
	Template.AbilityCooldown = Cooldown;

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;
    Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.WithinRange = 144; //1.5 tiles in Unreal units, allows attacks on the diag
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Disoriented = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	Disoriented.iNumTurns = DisorientedTurns;
	Disoriented.ApplyChance = DisorientedChance;
	Template.AddTargetEffect(Disoriented);

	Stunned = class'X2StatusEffects'.static.CreateStunnedStatusEffect(StunnedTurns, StunnedChance, false);
	Template.AddTargetEffect(Stunned);

	Unconscious = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	Unconscious.ApplyChance = UnconsciousChance;
	Template.AddTargetEffect(Unconscious);

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipExitCoverWhenFiring = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'FF_BiteHeal';
	Template.CinescriptCameraType = "Viper_Bite";
	Template.ActivationSpeech = 'ArcThrower';
	Template.SourceMissSpeech = 'SwordMiss';

	Template.AddShooterEffectExclusions();

	return Template;
}

static function X2AbilityTemplate MAW_AcidSpit_Template(name TemplateName, WeaponDamageValue InitialDamage, int DamagePerTurn, int DamageSpreadPerTurn, int EffectDurnation)
{
	local X2AbilityTemplate                 		Template;	
	local X2AbilityCost_ActionPoints        		ActionPointCost;
	local X2AbilityTarget_Cursor            		CursorTarget;
	local X2AbilityMultiTarget_Radius       		RadiusMultiTarget;
	local X2Condition_UnitProperty          		UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      		InputTrigger;
	local X2AbilityCooldown                		 	Cooldown;
	local X2Effect_ApplyWeaponDamage				Damage;

	// HUD
	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.bDontDisplayInAbilitySummary = true;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_acidblob";
    Template.AbilitySourceName = 'eAbilitySource_Standard';
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
    Template.Hostility = eHostility_Offensive;
    Template.ShotHUDPriority = 511;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_SpitCooldown;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;

	Template.AddMultiTargetEffect(CreateMAW_AcidBurnEffect(DamagePerTurn, DamageSpreadPerTurn, EffectDurnation));
	Template.AddMultiTargetEffect(new class'X2Effect_ApplyAcidToWorld');

	Damage = new class'X2Effect_ApplyWeaponDamage';
	Damage.EffectDamageValue = InitialDamage;
	Damage.EffectDamageValue.DamageType = 'Acid';
	Damage.bIgnoreBaseDamage = true;
	Template.AddMultiTargetEffect(Damage);

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = false;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Viper_PoisonSpit";

	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';

	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'HL_SpitAcid';

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.ActivationSpeech = 'RepairSHIV';

	return Template;
}

static function X2AbilityTemplate MAW_AcidBite_Template(name TemplateName, int DamagePerTurn, int DamageSpreadPerTurn, int EffectDurnation)
{
	local X2AbilityTemplate						Template;
	local X2AbilityCooldown  					Cooldown;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		MeleeHitCalc;
	local X2Effect_ApplyWeaponDamage			DamageEffect;
	local X2Condition_UnitProperty          	UnitPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_Bite";
	Template.ShotHUDPriority = 512;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.bCrossClassEligible = false;
	Template.bDisplayInUITooltip = true;
    Template.bDisplayInUITacticalText = true;
    Template.DisplayTargetHitChance = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.MAW_BiteCost;
	ActionPointCost.bConsumeAllPoints = default.MAW_Bite_EndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_BiteCooldown;
	Template.AbilityCooldown = Cooldown;

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;
    Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.WithinRange = 144; //1.5 tiles in Unreal units, allows attacks on the diag
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AddTargetEffect(CreateMAW_AcidBurnEffect(DamagePerTurn, DamageSpreadPerTurn, EffectDurnation));

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(DamageEffect);

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipExitCoverWhenFiring = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'FF_BiteAcid';
	Template.CinescriptCameraType = "Viper_Bite";
	Template.ActivationSpeech = 'ArcThrower';
	Template.SourceMissSpeech = 'SwordMiss';

	Template.AddShooterEffectExclusions();

	return Template;
}

static function X2AbilityTemplate MAW_FireSpit_Template(name TemplateName, int DamagePerTurn, int DamageSpreadPerTurn, int EffectDurnation)
{
	local X2AbilityTemplate                 		Template;	
	local X2AbilityCost_ActionPoints        		ActionPointCost;
	local X2AbilityTarget_Cursor            		CursorTarget;
	local X2AbilityMultiTarget_Cylinder     		CylinderMultiTarget;
	local X2Condition_UnitProperty          		UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      		InputTrigger;
	local X2AbilityCooldown  						Cooldown;

	// HUD
	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.bDontDisplayInAbilitySummary = true;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_Burn";
    Template.AbilitySourceName = 'eAbilitySource_Standard';
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
    Template.Hostility = eHostility_Offensive;
    Template.ShotHUDPriority = 511;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_SpitCooldown;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;

	Template.AddMultiTargetEffect(CreateMAW_BurnEffect(DamagePerTurn, DamageSpreadPerTurn, EffectDurnation));
	Template.AddMultiTargetEffect(new class'X2Effect_ApplyFireToWorld');

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	CylinderMultiTarget = new class'X2AbilityMultiTarget_Cylinder';
	CylinderMultiTarget.bUseWeaponRadius = true;
	CylinderMultiTarget.fTargetHeight = 3;
	CylinderMultiTarget.bUseOnlyGroundTiles = true;
	Template.AbilityMultiTargetStyle = CylinderMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Viper_PoisonSpit";

	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';

	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'HL_SpitFire';

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.ActivationSpeech = 'RepairSHIV';

	return Template;
}

static function X2AbilityTemplate MAW_FireBite_Template(name TemplateName, int DamagePerTurn, int DamageSpreadPerTurn, int EffectDurnation)
{
	local X2AbilityTemplate						Template;
	local X2AbilityCooldown  					Cooldown;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		MeleeHitCalc;
	local X2Effect_ApplyWeaponDamage			DamageEffect;
	local X2Condition_UnitProperty          	UnitPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_Bite";
	Template.ShotHUDPriority = 512;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.bCrossClassEligible = false;
	Template.bDisplayInUITooltip = true;
    Template.bDisplayInUITacticalText = true;
    Template.DisplayTargetHitChance = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.MAW_BiteCost;
	ActionPointCost.bConsumeAllPoints = default.MAW_Bite_EndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_BiteCooldown;
	Template.AbilityCooldown = Cooldown;

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;
    Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.WithinRange = 144; //1.5 tiles in Unreal units, allows attacks on the diag
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AddTargetEffect(CreateMAW_BurnEffect(DamagePerTurn, DamageSpreadPerTurn, EffectDurnation));

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(DamageEffect);

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipExitCoverWhenFiring = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'FF_BiteFire';
	Template.CinescriptCameraType = "Viper_Bite";
	Template.ActivationSpeech = 'ArcThrower';
	Template.SourceMissSpeech = 'SwordMiss';

	Template.AddShooterEffectExclusions();

	return Template;
}

static function X2AbilityTemplate MAW_ElectricSpit_Template(name TemplateName, WeaponDamageValue InitialDamage, int StunnedChance, int StunnedTurns)
{
	local X2AbilityTemplate                 		Template;	
	local X2AbilityCost_ActionPoints				ActionPointCost;
	local X2AbilityTarget_Cursor            		CursorTarget;
	local X2AbilityMultiTarget_Cylinder     		CylinderMultiTarget;
	local X2Condition_UnitProperty          		UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      		InputTrigger;
	local X2AbilityCooldown  						Cooldown;
	local X2Effect_ApplyWeaponDamage 				DamageEffect;
	local X2Effect_RemoveEffects 					RemoveEffects;
	local X2Effect_Stunned 							StunnedEffect;
	local X2Condition_UnitProperty 					UnitCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.bDontDisplayInAbilitySummary = true;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_ElectricSpit";
	Template.ShotHUDPriority = 511;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.bFriendlyFireWarningRobotsOnly = true;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_SpitCooldown;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	UnitCondition = new class'X2Condition_UnitProperty';
	UnitCondition.ExcludeOrganic = true;
	UnitCondition.IncludeWeakAgainstTechLikeRobot = true;
	UnitCondition.ExcludeFriendlyToSource = false;

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_EnergyShield'.default.EffectName);
	Template.AddMultiTargetEffect(RemoveEffects);

	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(StunnedTurns, StunnedChance, false);
	StunnedEffect.SetDisplayInfo(ePerkBuff_Penalty, class'X2StatusEffects'.default.RoboticStunnedFriendlyName, class'X2StatusEffects'.default.RoboticStunnedFriendlyDesc, "img:///UILibrary_PerkIcons.UIPerk_stun");
	StunnedEffect.TargetConditions.AddItem(UnitCondition);
	Template.AddMultiTargetEffect(StunnedEffect);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue = InitialDamage;
	DamageEffect.EffectDamageValue.DamageType = 'Electrical';
	DamageEffect.bIgnoreBaseDamage = true;
	DamageEffect.bExplosiveDamage = true;
	DamageEffect.TargetConditions.AddItem(UnitCondition);
	DamageEffect.bShowImmunityAnyFailure = true;
	Template.AddMultiTargetEffect(DamageEffect);

	Template.AddMultiTargetEffect(class'X2StatusEffects'.static.CreateHackDefenseChangeStatusEffect(class'X2Item_DefaultGrenades'.default.EMPGRENADE_HACK_DEFENSE_CHANGE, UnitCondition));

	CylinderMultiTarget = new class'X2AbilityMultiTarget_Cylinder';
	CylinderMultiTarget.bUseWeaponRadius = true;
	CylinderMultiTarget.fTargetHeight = 3;
	CylinderMultiTarget.bUseOnlyGroundTiles = true;
	Template.AbilityMultiTargetStyle = CylinderMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition); 
	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_poisonspit";
	Template.bUseAmmoAsChargesForHUD = false;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Viper_SpitElectric";

	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.ActivationSpeech = 'RepairSHIV';

	return Template;
}

static function X2AbilityTemplate MAW_ElectricBite_Template(name TemplateName, int StunnedChance, int StunnedTurns)
{
	local X2AbilityTemplate						Template;
	local X2AbilityCooldown  					Cooldown;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		MeleeHitCalc;
	local X2Effect_RemoveEffects 				RemoveEffects;
	local X2Effect_ApplyWeaponDamage			DamageEffect;
	local X2Effect_Stunned 						StunnedEffect;
	local X2Condition_UnitProperty          	UnitPropertyCondition, UnitHackCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_Bite";
	Template.ShotHUDPriority = 512;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.bCrossClassEligible = false;
	Template.bDisplayInUITooltip = true;
    Template.bDisplayInUITacticalText = true;
    Template.DisplayTargetHitChance = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.MAW_BiteCost;
	ActionPointCost.bConsumeAllPoints = default.MAW_Bite_EndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MAW_BiteCooldown;
	Template.AbilityCooldown = Cooldown;

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;
    Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.WithinRange = 144; //1.5 tiles in Unreal units, allows attacks on the diag
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	UnitHackCondition = new class'X2Condition_UnitProperty';
	UnitHackCondition.ExcludeOrganic = true;

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_EnergyShield'.default.EffectName);
	Template.AddTargetEffect(RemoveEffects);

	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(StunnedTurns, StunnedChance, false);
	StunnedEffect.SetDisplayInfo(ePerkBuff_Penalty, class'X2StatusEffects'.default.RoboticStunnedFriendlyName, class'X2StatusEffects'.default.RoboticStunnedFriendlyDesc, "img:///UILibrary_PerkIcons.UIPerk_stun");
	StunnedEffect.TargetConditions.AddItem(UnitHackCondition);
	Template.AddTargetEffect(StunnedEffect);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(DamageEffect);

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateHackDefenseChangeStatusEffect(class'X2Item_DefaultGrenades'.default.EMPGRENADE_HACK_DEFENSE_CHANGE, UnitHackCondition));

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipExitCoverWhenFiring = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CustomFireAnim = 'FF_BiteElectric';
	Template.CinescriptCameraType = "Viper_Bite";
	Template.ActivationSpeech = 'ArcThrower';
	Template.SourceMissSpeech = 'SwordMiss';

	Template.AddShooterEffectExclusions();

	return Template;
}

static function X2Effect_PersistentStatChange CreateMAW_PoisonStatusEffect(WeaponDamageValue DamagePerTurn, int EffectDurnation, int EffectMobilityMalus, int EffectAimMalus)
{
	local X2Effect_PersistentStatChange     PersistentStatChangeEffect;
	local X2Effect_ApplyWeaponDamage        DamageEffect;
	local X2Condition_UnitProperty 			UnitPropCondition;

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = class'X2StatusEffects'.default.PoisonedName;
	PersistentStatChangeEffect.DuplicateResponse = eDupe_Refresh;
	PersistentStatChangeEffect.BuildPersistentEffect(EffectDurnation,, false,,eGameRule_PlayerTurnBegin);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Penalty, class'X2StatusEffects'.default.PoisonedFriendlyName, class'X2StatusEffects'.default.PoisonedFriendlyDesc, "img:///UILibrary_PerkIcons.UIPerk_poisoned");
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, EffectMobilityMalus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, EffectAimMalus);
	PersistentStatChangeEffect.iInitialShedChance = 0;
	PersistentStatChangeEffect.iPerTurnShedChance = 0;
	PersistentStatChangeEffect.VisualizationFn = class'X2StatusEffects'.static.PoisonedVisualization;
	PersistentStatChangeEffect.EffectTickedVisualizationFn = class'X2StatusEffects'.static.PoisonedVisualizationTicked;
	PersistentStatChangeEffect.EffectRemovedVisualizationFn = class'X2StatusEffects'.static.PoisonedVisualizationRemoved;
	PersistentStatChangeEffect.DamageTypes.AddItem('Poison');
	PersistentStatChangeEffect.bRemoveWhenTargetDies = true;

	if (class'X2StatusEffects'.default.PoisonEnteredParticle_Name != "")
	{
		PersistentStatChangeEffect.VFXTemplateName = class'X2StatusEffects'.default.PoisonEnteredParticle_Name;
		PersistentStatChangeEffect.VFXSocket = class'X2StatusEffects'.default.PoisonEnteredSocket_Name;
		PersistentStatChangeEffect.VFXSocketsArrayName = class'X2StatusEffects'.default.PoisonEnteredSocketsArray_Name;
	}

	UnitPropCondition = new class'X2Condition_UnitProperty';
	UnitPropCondition.ExcludeFriendlyToSource = false;
	UnitPropCondition.ExcludeRobotic = true;
	PersistentStatChangeEffect.TargetConditions.AddItem(UnitPropCondition);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue = DamagePerTurn;
	DamageEffect.EffectDamageValue.DamageType = 'Poison';
	DamageEffect.bIgnoreBaseDamage = true;
	DamageEffect.bBypassShields = true;
	DamageEffect.DamageTypes.AddItem('Poison');
	PersistentStatChangeEffect.ApplyOnTick.AddItem(DamageEffect);

	return PersistentStatChangeEffect;
}

static function X2Effect_DLC_Day60Freeze CreateMAW_FreezeEffect(int EffectDurnation, int EffectDurnationRuler)
{
	local X2Effect_DLC_Day60Freeze      Effect;

	Effect = new class'X2Effect_DLC_Day60Freeze';
	Effect.BuildPersistentEffect(EffectDurnation, false, false, true, eGameRule_PlayerTurnBegin);
	Effect.bUseSourcePlayerState = true;
	Effect.bRemoveWhenTargetDies = true;
	Effect.SetDisplayInfo(ePerkBuff_Penalty, class'X2Effect_DLC_Day60Freeze'.default.FreezeName, class'X2Effect_DLC_Day60Freeze'.default.FreezeDesc, class'X2Effect_DLC_Day60Freeze'.default.ConfigStatusIcon);

	Effect.AddPersistentStatChange(eStat_Dodge, 0, MODOP_PostMultiplication);       //  no dodge for you
	Effect.AddPersistentStatChange(eStat_Defense, class'X2Effect_DLC_Day60Freeze'.default.DefenseMod);

	Effect.MinRulerFreezeCount = EffectDurnationRuler;
	Effect.MaxRulerFreezeCount = EffectDurnationRuler;

	return Effect;
}

static function X2Effect_Burning CreateMAW_AcidBurnEffect(int DamagePerTurn, int DamageSpreadPerTurn, int EffectDurnation)
{
	local X2Effect_Burning BurningEffect;
	local X2Condition_UnitProperty UnitPropCondition;

	BurningEffect = new class'X2Effect_Burning';
	BurningEffect.EffectName = class'X2StatusEffects'.default.AcidBurningName;
	BurningEffect.BuildPersistentEffect(EffectDurnation, , false, , eGameRule_PlayerTurnBegin);
	BurningEffect.SetDisplayInfo(ePerkBuff_Penalty, class'X2StatusEffects'.default.AcidBurningFriendlyName, class'X2StatusEffects'.default.AcidBurningFriendlyDesc, "img:///UILibrary_PerkIcons.UIPerk_burn");
	BurningEffect.SetBurnDamage(DamagePerTurn, DamageSpreadPerTurn, 'Acid');
	BurningEffect.VisualizationFn = class'X2StatusEffects'.static.AcidBurningVisualization;
	BurningEffect.EffectTickedVisualizationFn = class'X2StatusEffects'.static.AcidBurningVisualizationTicked;
	BurningEffect.EffectRemovedVisualizationFn = class'X2StatusEffects'.static.AcidBurningVisualizationRemoved;
	BurningEffect.bRemoveWhenTargetDies = true;
	BurningEffect.DamageTypes.Length = 0;   // By default X2Effect_Burning has a damage type of fire, but acid is not fire
	BurningEffect.DamageTypes.InsertItem(0, 'Acid');
	BurningEffect.DuplicateResponse = eDupe_Refresh;
	BurningEffect.bCanTickEveryAction = true;

	if (class'X2StatusEffects'.default.AcidEnteredParticle_Name != "")
	{
		BurningEffect.VFXTemplateName = class'X2StatusEffects'.default.AcidEnteredParticle_Name;
		BurningEffect.VFXSocket = class'X2StatusEffects'.default.AcidEnteredSocket_Name;
		BurningEffect.VFXSocketsArrayName = class'X2StatusEffects'.default.AcidEnteredSocketsArray_Name;
	}
	BurningEffect.PersistentPerkName = class'X2StatusEffects'.default.AcidEnteredPerk_Name;

	UnitPropCondition = new class'X2Condition_UnitProperty';
	UnitPropCondition.ExcludeFriendlyToSource = false;
	BurningEffect.TargetConditions.AddItem(UnitPropCondition);

	return BurningEffect;
}

static function X2Effect_Burning CreateMAW_BurnEffect(int DamagePerTurn, int DamageSpreadPerTurn, int EffectDurnation)
{
	local X2Effect_Burning BurningEffect;
	local X2Condition_UnitProperty UnitPropCondition;

	BurningEffect = new class'X2Effect_Burning';
	BurningEffect.EffectName = class'X2StatusEffects'.default.BurningName;
	BurningEffect.BuildPersistentEffect(EffectDurnation,, false,,eGameRule_PlayerTurnBegin);
	BurningEffect.SetDisplayInfo(ePerkBuff_Penalty, class'X2StatusEffects'.default.BurningFriendlyName, class'X2StatusEffects'.default.BurningFriendlyDesc, "img:///UILibrary_PerkIcons.UIPerk_burn");
	BurningEffect.SetBurnDamage(DamagePerTurn, DamageSpreadPerTurn, 'Fire');
	BurningEffect.VisualizationFn = class'X2StatusEffects'.static.BurningVisualization;
	BurningEffect.EffectTickedVisualizationFn = class'X2StatusEffects'.static.BurningVisualizationTicked;
	BurningEffect.EffectRemovedVisualizationFn = class'X2StatusEffects'.static.BurningVisualizationRemoved;
	BurningEffect.bRemoveWhenTargetDies = true;
	BurningEffect.DamageTypes.AddItem('Fire');
	BurningEffect.DuplicateResponse = eDupe_Refresh;
	BurningEffect.bCanTickEveryAction = true;
	BurningEffect.EffectAppliedEventName = class'X2Effect_Burning'.default.BurningEffectAddedEventName;

	if (class'X2StatusEffects'.default.FireEnteredParticle_Name != "")
	{
		BurningEffect.VFXTemplateName = class'X2StatusEffects'.default.FireEnteredParticle_Name;
		BurningEffect.VFXSocket = class'X2StatusEffects'.default.FireEnteredSocket_Name;
		BurningEffect.VFXSocketsArrayName = class'X2StatusEffects'.default.FireEnteredSocketsArray_Name;
	}
	BurningEffect.PersistentPerkName = class'X2StatusEffects'.default.FireEnteredPerk_Name;

	BurningEffect.EffectTickedFn = class'X2StatusEffects'.static.BurningTicked;

	UnitPropCondition = new class'X2Condition_UnitProperty';
	UnitPropCondition.ExcludeFriendlyToSource = false;
	BurningEffect.TargetConditions.AddItem(UnitPropCondition);

	return BurningEffect;
}
