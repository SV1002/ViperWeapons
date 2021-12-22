class X2Ability_ViperWeapons_ViperKing extends X2Ability
	config(ViperAbilities);

var config int DamageRequiredToEndBind;
var config float BindRange;
var config int BindActionCost;
var config bool BindFreeAction;
var config bool BindEndsTurn;
var config int KingBindPassiveStrengthBonus;

var config int KingTonguePullCooldown;
var config float KingTonguePullMinRange;
var config float KingTonguePullMaxRange;
var config int ActionCostToKingTonguePull;
var config int ActionPointsFromKingTonguePull;
var config bool KingTonguePullIsFreeAction;
var config bool KingTonguePullEndsTurn;
var config bool KingTonguePullBlockedByHighCover;

var config int FrostbiteCooldown;
var config int FrostbiteActionCost;
var config bool FrostbiteFreeAction;
var config bool FrostbiteEndsTurn;
var config int FrostbiteRulerFreezeMinDuration;
var config int FrostbiteRulerFreezeMaxDuration;

var config int KingBindStrengthBonus;
var config int KingBindActionCost;
var config bool KingBindFreeAction;
var config bool KingBindEndsTurn;
var config int KingBindCooldown;
var config int KingBindDisorientedTurns;
var config int KingBindDisorientedChance;
var config int KingBindMinResultForWeakDamage;
var config int KingBindMaxResultForWeakDamage;
var config int KingBindMinResultForBaseDamage;
var config int KingBindMaxResultForBaseDamage;
var config int KingBindMinResultForStrongDamage;
var config int KingBindMaxResultForStrongDamage;
var config int KingBindMinResultForUnconscious;
var config WeaponDamageValue KingBind_WeakDamage;
var config WeaponDamageValue KingBind_BaseDamage;
var config WeaponDamageValue KingBind_StrongDamage;

var config array<name> BIND_ABILITY_ALIASES;
var config array<name> GET_OVER_HERE_ABILITY_ALIASES;

var name GetOverHereAbilityName;
var name BindAbilityName;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateFrostbiteAbility());
	Templates.AddItem(CreateBindAbility());
	Templates.AddItem(CreateBindSustainedAbility());
	Templates.AddItem(KingBindSustainedChoke());
	Templates.AddItem(KingBindSustainedSubdue());
	Templates.AddItem(CreateEndBindAbility());
	Templates.AddItem(KingEndBindAlt());
	Templates.AddItem(CreateGetOverHereAbility());

	return Templates;
}

static function X2AbilityTemplate CreateFrostbiteAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_ApplyWeaponDamage        WeaponEffect;
	local array<name> SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Frostbite');
	Template.bDontDisplayInAbilitySummary = false;
	Template.IconImage = "img:///UILibrary_DLC2Images.UIPerk_freezingbreath";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.FrostbiteActionCost;
	ActionPointCost.bFreeCost = default.FrostbiteFreeAction;
	ActionPointCost.bConsumeAllPoints = default.FrostbiteEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	WeaponEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponEffect.DamageTypes.AddItem('Frost');
	Template.AddMultiTargetEffect(WeaponEffect);
	Template.AddMultiTargetEffect(class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeEffect(default.FrostbiteRulerFreezeMinDuration, default.FrostbiteRulerFreezeMaxDuration));
	Template.AddMultiTargetEffect(class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeRemoveEffects());

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

	// Frostbite may be used if disoriented, burning, or confused.  Not bound though.
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.ConfusedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_frostbite";
	Template.bUseAmmoAsChargesForHUD = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Viper_PoisonSpit";

	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';

	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.FrostbiteCooldown;
	Template.AbilityCooldown = Cooldown;

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;

}

static function X2AbilityTemplate CreateBindAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown                 Cooldown;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_Persistent			    BoundEffect;
	local X2Effect_ViperBindSustained       SustainedEffect;
	local X2Condition_UnitTemplateCheck		ExcudeCharacterCondition;
	local array<name> SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.BindAbilityName);
	Template.IconImage = "img:///UILibrary_DLC2Images.PerkIcons.UIPerk_viper_choke";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;

	Template.AdditionalAbilities.AddItem('KingBindSustained');
	Template.AdditionalAbilities.AddItem('KingBindSustainedChoke');
	Template.AdditionalAbilities.AddItem('KingBindSustainedSubdue');
	Template.AdditionalAbilities.AddItem('KingEndBind');
	Template.AdditionalAbilities.AddItem('KingEndBindAlt');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.BindActionCost;
	ActionPointCost.bFreeCost = default.BindFreeAction;
	ActionPointCost.bConsumeAllPoints = default.BindEndsTurn;
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.GOHBindActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityToHitCalc = new class'X2AbilityToHitCalc_DeadEye';

	// Source cannot be dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	// Bind may be used if disoriented, burning, or confused.  Not if already bound though.
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.ConfusedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	ExcudeCharacterCondition = new class'X2Condition_UnitTemplateCheck';
	ExcudeCharacterCondition.ExcludeTypes = class'X2Ability_ViperWeapons'.default.CharactersThatCanNotBeBound;
	Template.AbilityTargetConditions.AddItem(ExcudeCharacterCondition);

	// The Target must be alive and a humanoid
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNonHumanoidAliens = true;
	UnitPropertyCondition.ExcludeLargeUnits = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = default.BindRange;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// This Target cannot already be bound
	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2AbilityTemplateManager'.default.BoundName, 'AA_UnitIsBound');
	UnitEffectsCondition.AddExcludeEffect(class'X2Ability_CarryUnit'.default.CarryUnitEffectName, 'AA_CarryingUnit');
	UnitEffectsCondition.AddExcludeEffect(class'X2Effect_PersistentVoidConduit'.default.EffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	TargetVisibilityCondition = new class'X2Condition_Visibility';	
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bCannotPeek = true;
	TargetVisibilityCondition.bRequireNotMatchCoverType = true;
	TargetVisibilityCondition.TargetCover = CT_Standing;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// Add to the target the sustained bind effect
	SustainedEffect = new class'X2Effect_ViperBindSustained';
	SustainedEffect.FragileAmount = default.DamageRequiredToEndBind;
	SustainedEffect.EffectName = class'X2Ability_ViperWeapons'.default.BindSustainedEffectName;
	SustainedEffect.bRemoveWhenTargetDies = true;
	SustainedEffect.EffectRemovedSourceVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEndSource_BuildVisualization;
	SustainedEffect.EffectRemovedVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEndTarget_BuildVisualization;
	SustainedEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	SustainedEffect.bBringRemoveVisualizationForward = true;
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('AffectedByStasis');
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('StunStrikeActivated');

	SustainedEffect.bCanTickEveryAction = true;

	// Since this will also be a sustained ability, only put the bound status on the target
	// for one round
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, true);
	BoundEffect.CustomIdleOverrideAnim = class'X2Ability_ViperWeapons'.default.ViperBindLoop;
	Template.AddTargetEffect(BoundEffect);
	// This target effect needs to be set as a child on the sustain effect
	SustainedEffect.EffectsToRemoveFromTarget.AddItem(BoundEffect.EffectName);

	// The shooter is also bound
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, false);
	BoundEffect.CustomIdleOverrideAnim = class'X2Ability_ViperWeapons'.default.ViperBindCastLoop;
	Template.AddShooterEffect(BoundEffect);
	// This source effect needs to be set as a child on the sustain effect
	SustainedEffect.EffectsToRemoveFromSource.AddItem(BoundEffect.EffectName);

	// All child effects to the sustained effect have been added, submit
	Template.AddTargetEffect(SustainedEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.Bind_BuildVisualization;
	Template.BuildAffectedVisualizationSyncFn = class'X2Ability_ViperWeapons'.static.BindUnit_BuildAffectedVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.CinescriptCameraType = "Viper_Bind";

	class'X2Ability_DLC_Day60AlienRulers'.static.RemoveMimicBeaconsFromTargets(Template);
	
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate CreateBindSustainedAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_SustainedEffect  InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_ImmediateAbilityActivation          RemoveBind;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'KingBindSustained');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 0;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.KingBindPassiveStrengthBonus;
	Template.AbilityToHitCalc = StatCheck;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// May only target a single unit
	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_SustainedEffect';
	Template.AbilityTriggers.AddItem(InputTrigger);

	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'KingBindEnd';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate KingBindSustainedChoke()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_PlayerInput  InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_ApplyWeaponDamage        PhysicalDamageEffect;
	local X2Effect_ImmediateAbilityActivation          RemoveBind;
	local X2Effect_Persistent               UnconsciousEffect;
	local X2Condition_UnitEffects           UnconsciousEffectsCondition;
	local X2Effect_PersistentStatChange 	DisorientedEffect;
	local X2AbilityCooldown                 Cooldown;
	local AdditionalCooldownInfo 			SubdueCooldown;
	local X2Effect_Stunned					StunnedEffect;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'KingBindSustainedChoke');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindChoke";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = -3;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.KingBindActionCost;
	ActionPointCost.bFreeCost = default.KingBindFreeAction;
	ActionPointCost.bConsumeAllPoints = default.KingBindEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.KingBindCooldown;

	SubdueCooldown.AbilityName = 'KingBindSustainedSubdue';
	SubdueCooldown.NumTurns = default.KingBindCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(SubdueCooldown);

	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.KingBindStrengthBonus;
	Template.AbilityToHitCalc = StatCheck;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// May only target a single unit
	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'KingEndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Chance for Disoriented to proc on choke
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.KingBindDisorientedTurns;
	DisorientedEffect.ApplyChance = default.KingBindDisorientedChance;
	Template.AddTargetEffect(DisorientedEffect);

	// Deal small damage on 2-3 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.KingBind_WeakDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.KingBindMinResultForWeakDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.KingBindMaxResultForWeakDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal damage on 4-5 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.KingBind_BaseDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.KingBindMinResultForBaseDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.KingBindMaxResultForBaseDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal big damage on 6-7 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.KingBind_StrongDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.KingBindMinResultForStrongDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.KingBindMaxResultForStrongDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);
	
	// K.O on 8+ unblocked str hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = default.KingBindMinResultForUnconscious;
	StunnedEffect.MaxStatContestResult = 0;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);

	// K.O on 8+ unblocked str hit
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = default.KingBindMinResultForUnconscious;
	UnconsciousEffect.MaxStatContestResult = 0;
	Template.AddTargetEffect(UnconsciousEffect);
	
	UnconsciousEffectsCondition = new class'X2Condition_UnitEffects';
	UnconsciousEffectsCondition.AddRequireEffect(class'X2StatusEffects'.default.UnconsciousName, 'AA_UnitIsUnconscious');
	
	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'KingEndBindAlt';
	RemoveBind.TargetConditions.AddItem(UnconsciousEffectsCondition);
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate KingBindSustainedSubdue()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_PlayerInput  InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_PersistentStatChange 	DisorientedEffect;
	local X2Effect_Stunned					StunnedEffect;
	local X2Effect_Persistent               UnconsciousEffect;
	local X2Effect_ImmediateAbilityActivation        RemoveBind;
	local X2AbilityCooldown                 Cooldown;
	local AdditionalCooldownInfo 			ChokeCooldown;
	local X2Condition_UnitEffects           UnconsciousEffectsCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'KingBindSustainedSubdue');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindSubdue";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = -2;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.KingBindActionCost;
	ActionPointCost.bFreeCost = default.KingBindFreeAction;
	ActionPointCost.bConsumeAllPoints = default.KingBindEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.KingBindCooldown;

	ChokeCooldown.AbilityName = 'KingBindSustainedChoke';
	ChokeCooldown.NumTurns = default.KingBindCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(ChokeCooldown);

	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.KingBindStrengthBonus;
	Template.AbilityToHitCalc = StatCheck;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// May only target a single unit
	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'KingEndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Disorientate on 2-3 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = class'X2Ability_ViperWeapons'.default.BindSubdueDisorientedTurns;
	DisorientedEffect.MinStatContestResult = class'X2Ability_ViperWeapons'.default.BindSubdueMinResultForDisoriented;
	DisorientedEffect.MaxStatContestResult = class'X2Ability_ViperWeapons'.default.BindSubdueMaxResultForDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Disorientate longer on 4 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = class'X2Ability_ViperWeapons'.default.BindSubdueStrongDisorientedTurns;
	DisorientedEffect.MinStatContestResult = class'X2Ability_ViperWeapons'.default.BindSubdueMinResultForStrongDisoriented;
	DisorientedEffect.MaxStatContestResult = class'X2Ability_ViperWeapons'.default.BindSubdueMaxResultForStrongDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Stun on 5-7 unblocked str hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(class'X2Ability_ViperWeapons'.default.BindSubdueStunnedTurns, 100, false);
	StunnedEffect.MinStatContestResult = class'X2Ability_ViperWeapons'.default.BindSubdueMinResultForStunned;
	StunnedEffect.MaxStatContestResult = class'X2Ability_ViperWeapons'.default.BindSubdueMaxResultForStunned;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);

	// K.O on 8+ unblocked str hit (Stun)
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = class'X2Ability_ViperWeapons'.default.BindSubdueMinResultForUnconscious;
	StunnedEffect.MaxStatContestResult = 0;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);
	
	// K.O on 8+ unblocked str hit (Unconscious)
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = class'X2Ability_ViperWeapons'.default.BindSubdueMinResultForUnconscious;
	UnconsciousEffect.MaxStatContestResult = 0;
	Template.AddTargetEffect(UnconsciousEffect);
	
	UnconsciousEffectsCondition = new class'X2Condition_UnitEffects';
	UnconsciousEffectsCondition.AddRequireEffect(class'X2StatusEffects'.default.UnconsciousName, 'AA_UnitIsUnconscious');
	
	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'KingEndBindAlt';
	RemoveBind.TargetConditions.AddItem(UnconsciousEffectsCondition);
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate CreateEndBindAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_RemoveEffects            RemoveEffects;
	local X2AbilityCooldown                 Cooldown;
	local AdditionalCooldownInfo 			CooldownInfo;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'KingEndBind');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 0;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 0;

	CooldownInfo.AbilityName = 'KingBind';
	CooldownInfo.NumTurns = 2;
	Cooldown.AditionalAbilityCooldowns.AddItem(CooldownInfo);
	Template.AbilityCooldown = Cooldown;

	Template.AbilityToHitCalc = default.DeadEye;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// Remove the bind/bound effects from the Target
	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName);
	Template.AddTargetEffect(RemoveEffects);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEnd_BuildVisualization;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate KingEndBindAlt()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_RemoveEffects            RemoveEffects;
	local X2AbilityCooldown                 Cooldown;
	local AdditionalCooldownInfo 			CooldownInfo;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'KingEndBindAlt');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 0;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 0;

	CooldownInfo.AbilityName = 'KingBind';
	CooldownInfo.NumTurns = 2;
	Cooldown.AditionalAbilityCooldowns.AddItem(CooldownInfo);
	Template.AbilityCooldown = Cooldown;

	Template.AbilityToHitCalc = default.DeadEye;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// Remove the bind/bound effects from the Target
	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName);
	Template.AddTargetEffect(RemoveEffects);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEndAlt_BuildVisualization;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate CreateGetOverHereAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown					Cooldown;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2Condition_UnblockedNeighborTile UnblockedNeighborTileCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Effect_GetOverHere              GetOverHereEffect;
	local X2Effect_GrantActionPoints        ActionPointsEffect;
	local X2Condition_TargetIsHighCovered	CoverCondition;
	local array<name> SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.GetOverHereAbilityName);
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_getoverhere";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.ActionCostToKingTonguePull;
	ActionPointCost.bConsumeAllPoints = default.KingTonguePullEndsTurn;
	ActionPointCost.bFreeCost = default.KingTonguePullIsFreeAction;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.KingTonguePullCooldown;
	Template.AbilityCooldown = Cooldown;

	CoverCondition = new class'X2Condition_TargetIsHighCovered';
	CoverCondition.bBlockedByHighCover = default.KingTonguePullBlockedByHighCover;
	Template.AbilityTargetConditions.AddItem(CoverCondition);

	// Source cannot be dead
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	// GetOverHere may be used if disoriented, burning, or confused.  Not bound though.
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.ConfusedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// There must be a free tile around the source unit
	UnblockedNeighborTileCondition = new class'X2Condition_UnblockedNeighborTile';
	template.AbilityShooterConditions.AddItem(UnblockedNeighborTileCondition);

	// The Target must be alive and a humanoid
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNonHumanoidAliens = true;
	UnitPropertyCondition.ExcludeLargeUnits = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.RequireWithinMinRange = true;
	UnitPropertyCondition.WithinMinRange = default.KingTonguePullMinRange;
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = default.KingTonguePullMaxRange;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// This Target cannot already be bound
	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2AbilityTemplateManager'.default.BoundName, 'AA_UnitIsBound');
	UnitEffectsCondition.AddExcludeEffect(class'X2Ability_CarryUnit'.default.CarryUnitEffectName, 'AA_CarryingUnit');
	UnitEffectsCondition.AddExcludeEffect(class'X2Effect_PersistentVoidConduit'.default.EffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// Target must be visible and not in high cover
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// This will attack using the standard aim
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	Template.AbilityToHitCalc = StandardAim;

	// Apply the effect that pulls the unit to the Viper
	GetOverHereEffect = new class'X2Effect_GetOverHere';
	Template.AddTargetEffect(GetOverHereEffect);

	// The shooter gets a free point that can be used bind
	ActionPointsEffect = new class'X2Effect_GrantActionPoints';
	ActionPointsEffect.NumActionPoints = default.ActionPointsFromKingTonguePull;
	ActionPointsEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddShooterEffect(ActionPointsEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.GetOverhere_BuildVisualization;
	Template.CinescriptCameraType = "Viper_StranglePull";

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

DefaultProperties
{
	GetOverHereAbilityName="KingGetOverHere"
	BindAbilityName="KingBind"
}
