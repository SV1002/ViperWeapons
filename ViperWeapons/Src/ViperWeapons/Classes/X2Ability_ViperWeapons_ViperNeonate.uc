class X2Ability_ViperWeapons_ViperNeonate extends X2Ability
	config(ViperAbilities);

var config int DamageRequiredToEndBind;
var config float BindRange;
var config int BindActionCost;
var config bool BindFreeAction;
var config bool BindEndsTurn;
var config int NeonateBindMaxDuration;

var config int NeonateBindStrengthBonus;

var name BindAbilityName;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(NeonateBind());
	Templates.AddItem(MoveAndNeonateBind());
	Templates.AddItem(NeonateBindSustained());
	Templates.AddItem(NeonateEndBind());

	return Templates;
}

static function SetupSharedBindAbilityData(out X2AbilityTemplate Template)
{
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2Condition_UnitTemplateCheck		ExcudeCharacterCondition;

	Template.AbilityToHitCalc = new class'X2AbilityToHitCalc_DeadEye';
	Template.AbilityTargetStyle = new class'X2AbilityTarget_Single';
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_PlayerInput');

	// Action cost
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.BindActionCost;
	ActionPointCost.bFreeCost = default.BindFreeAction;
	ActionPointCost.bConsumeAllPoints = default.BindEndsTurn;
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.GOHBindActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);

	// Source cannot be dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);	

	// The Target must be alive and a humanoid
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNonHumanoidAliens = true;
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

	ExcudeCharacterCondition = new class'X2Condition_UnitTemplateCheck';
	ExcudeCharacterCondition.ExcludeTypes = class'X2Ability_ViperWeapons'.default.CharactersThatCanNotBeBound;
	Template.AbilityTargetConditions.AddItem(ExcudeCharacterCondition);

	// The target must be visible and NOT in full cover
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bCannotPeek = true;
	TargetVisibilityCondition.bRequireNotMatchCoverType = true;
	TargetVisibilityCondition.TargetCover = CT_Standing;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.Bind_BuildVisualization;
	Template.BuildAffectedVisualizationSyncFn = class'X2Ability_ViperWeapons'.static.BindUnit_BuildAffectedVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CinescriptCameraType = "Viper_Bind";
	Template.Hostility = eHostility_Offensive;

	Template.bFrameEvenWhenUnitIsHidden = true;
}

static function X2AbilityTemplate NeonateBind(name SustainedAbilityName='NeonateBindSustained')
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_Persistent			    BoundEffect;
	local X2Effect_ViperBindSustained       SustainedEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.BindAbilityName);

	SetupSharedBindAbilityData(Template);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;	

	Template.AdditionalAbilities.AddItem('MoveAndNeonateBind');
	Template.AdditionalAbilities.AddItem('NeonateBindSustained');
	Template.AdditionalAbilities.AddItem('NeonateEndBind');

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	Template.AddShooterEffectExclusions();

	// Add to the target the sustained bind effect
	SustainedEffect = new class'X2Effect_ViperBindSustained';
	SustainedEffect.SustainedAbilityName = 'NeonateBindSustained';
	SustainedEffect.FragileAmount = default.DamageRequiredToEndBind;
	SustainedEffect.EffectName = class'X2Ability_ViperWeapons'.default.BindSustainedEffectName;
	SustainedEffect.bRemoveWhenTargetDies = true;
	SustainedEffect.EffectRemovedSourceVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEndSource_BuildVisualization;
	SustainedEffect.EffectRemovedVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEndTarget_BuildVisualization;
	SustainedEffect.BuildPersistentEffect(3, false, true, false, eGameRule_PlayerTurnBegin); //infinite
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('AffectedByStasis');
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('StunStrikeActivated');
	SustainedEffect.bBringRemoveVisualizationForward = true;

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

	return Template;
}

static function X2AbilityTemplate MoveAndNeonateBind()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2AbilityCooldown					Cooldown;
	local X2AbilityTarget_MovingMelee		MeleeTarget;
	local X2Effect_ImmediateAbilityActivation		BindAbilityEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MoveAndNeonateBind');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	// Source cannot be dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	// The Target must be alive and a humanoid
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNonHumanoidAliens = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.ExcludeCivilian = true;
	UnitPropertyCondition.ExcludeTurret = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// This Target cannot already be bound
	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2AbilityTemplateManager'.default.BoundName, 'AA_UnitIsBound');
	UnitEffectsCondition.AddExcludeEffect(class'X2Ability_CarryUnit'.default.CarryUnitEffectName, 'AA_CarryingUnit');
	UnitEffectsCondition.AddExcludeEffect(class'X2Effect_PersistentVoidConduit'.default.EffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// Target must be visible and not in high cover
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	MeleeTarget = new class'X2AbilityTarget_MovingMelee';
	MeleeTarget.MovementRangeAdjustment = 0;
	Template.AbilityTargetStyle = MeleeTarget;
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_PlayerInput');
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');

	// This will always hit
	Template.AbilityToHitCalc = default.DeadEye;

	// Successful GetOverHere leads to a bind
	BindAbilityEffect = new class 'X2Effect_ImmediateAbilityActivation';
	BindAbilityEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	BindAbilityEffect.EffectName = 'ImmediateBind';
	BindAbilityEffect.AbilityName = default.BindAbilityName;
	BindAbilityEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(BindAbilityEffect);

	Template.bAllowBonusWeaponEffects = false;
	Template.bSkipFireAction = true;

	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	return Template;
}

static function X2AbilityTemplate NeonateBindSustained()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_SustainedEffect  InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_ImmediateAbilityActivation          RemoveBind;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'NeonateBindSustained');
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
	StatCheck.BaseValue = default.NeonateBindStrengthBonus;
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
	RemoveBind.AbilityName = 'NeonateEndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate NeonateEndBind()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_RemoveEffects            RemoveEffects;
	local AdditionalCooldownInfo 			BindCooldown, MoveAndBindCooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'NeonateEndBind');
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

	BindCooldown.AbilityName = 'NeonateBind';
	BindCooldown.NumTurns = 2;
	Cooldown.AditionalAbilityCooldowns.AddItem(BindCooldown);

	MoveAndBindCooldown.AbilityName = 'MoveAndNeonateBind';
	MoveAndBindCooldown.NumTurns = 2;
	Cooldown.AditionalAbilityCooldowns.AddItem(MoveAndBindCooldown);
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

DefaultProperties
{
	BindAbilityName="NeonateBind"
}
