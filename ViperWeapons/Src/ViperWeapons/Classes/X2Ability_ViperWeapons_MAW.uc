class X2Ability_ViperWeapons_MAW extends X2Ability
	config(ViperAbilities);

var config int DamageRequiredToEndBind;
var config float BindRange;

var config int BindPassiveStrengthBonus;

var config int BindCrushStrengthBonus;
var config int BindCrushActionCost;
var config bool BindCrushFreeAction;
var config bool BindCrushEndsTurn;
var config int BindCrushCooldown;
var config int BindCrushMinResultForWeakDamage;
var config int BindCrushMaxResultForWeakDamage;
var config int BindCrushMinResultForBaseDamage;
var config int BindCrushMaxResultForBaseDamage;
var config int BindCrushMinResultForStrongDamage;
var config WeaponDamageValue BindCrush_WeakDamage;
var config WeaponDamageValue BindCrush_BaseDamage;
var config WeaponDamageValue BindCrush_StrongDamage;

var config int BindSubdueStrengthBonus;
var config int BindSubdueActionCost;
var config bool BindSubdueFreeAction;
var config bool BindSubdueEndsTurn;
var config int BindSubdueCooldown;
var config int BindSubdueDisorientedTurns;
var config int BindSubdueMinResultForDisoriented;
var config int BindSubdueMaxResultForDisoriented;
var config int BindSubdueStrongDisorientedTurns;
var config int BindSubdueMinResultForStrongDisoriented;
var config int BindSubdueMaxResultForStrongDisoriented;
var config int BindSubdueStunnedTurns;
var config int BindSubdueMinResultForStunned;
var config int BindSubdueMaxResultForStunned;
var config int BindSubdueMinResultForUnconscious;

var config int BindChokeStrengthBonus;
var config int BindChokeActionCost;
var config bool BindChokeFreeAction;
var config bool BindChokeEndsTurn;
var config int BindChokeCooldown;
var config int BindChokeDisorientedTurns;
var config int BindChokeDisorientedChance;
var config int BindChokeMinResultForWeakDamage;
var config int BindChokeMaxResultForWeakDamage;
var config int BindChokeMinResultForBaseDamage;
var config int BindChokeMaxResultForBaseDamage;
var config int BindChokeMinResultForStrongDamage;
var config int BindChokeMaxResultForStrongDamage;
var config int BindChokeMinResultForUnconscious;
var config WeaponDamageValue BindChoke_WeakDamage;
var config WeaponDamageValue BindChoke_BaseDamage;
var config WeaponDamageValue BindChoke_StrongDamage;

var config int BindEndActionCost;
var config bool BindEndFreeAction;
var config bool BindEndEndsTurn;
var config int BindEndCooldown;

var config int BindActionCost;
var config bool BindFreeAction;
var config bool BindEndsTurn;

var config int AllyTonguePullCooldown;
var config int EnemyTonguePullCooldown;

var config float EnemyTonguePullMinRange;
var config float EnemyTonguePullMaxRange;

var config float AllyTonguePullMinRange;
var config float AllyTonguePullMaxRange;

var config int EnemyActionCostToTonguePull;
var config int AllyActionCostToTonguePull;

var config int ActionPointsFromEnemyTonguePull;
var config int ActionPointsFromAllyTonguePull;

var config bool EnemyTonguePullEndsTurn;
var config bool AllyTonguePullEndsTurn;

var config bool EnemyTonguePullIsFreeAction;
var config bool AllyTonguePullIsFreeAction;

var config bool EnemyTonguePullBlockedByHighCover;
var config bool AllyTonguePullBlockedByHighCover;

var config bool TonguePullGuaranteedOnAllies;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(VW_GetOverHere());
	Templates.AddItem(VW_FriendlyGetOverHere());
	Templates.AddItem(VW_Bind());
	Templates.AddItem(VW_BindSustained());
	Templates.AddItem(VW_BindSustainedCrush());
	Templates.AddItem(VW_BindSustainedSubdue());
	Templates.AddItem(VW_BindSustainedChoke());
	Templates.AddItem(VW_EndBind());
	Templates.AddItem(VW_EndBindAlt());
	Templates.AddItem(VW_CivilianBind());
	Templates.AddItem(VW_CivilianBindSustained());

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

static function X2AbilityTemplate VW_Bind()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_Persistent			    BoundEffect;
	local X2Effect_ViperBindSustained       SustainedEffect;
	local X2Condition_ViperHasAbility 		HasMAW_I, HasMAW_II, HasMAW_III;
	local X2Effect_PersistentStatChange 	Strength1, Strength2, Strength3;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_Bind');

	SetupSharedBindAbilityData(Template);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;	

	Template.AdditionalAbilities.AddItem('VW_BindSustained');
	Template.AdditionalAbilities.AddItem('VW_BindSustainedCrush');
	Template.AdditionalAbilities.AddItem('VW_BindSustainedSubdue');
	Template.AdditionalAbilities.AddItem('VW_BindSustainedChoke');
	Template.AdditionalAbilities.AddItem('VW_EndBind');
	Template.AdditionalAbilities.AddItem('VW_EndBindAlt');

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	Template.AddShooterEffectExclusions();

	// Add to the target the sustained bind effect
	SustainedEffect = new class'X2Effect_ViperBindSustained';
	SustainedEffect.SustainedAbilityName = 'VW_BindSustained';
	SustainedEffect.FragileAmount = default.DamageRequiredToEndBind;
	SustainedEffect.EffectName = class'X2Ability_ViperWeapons'.default.BindSustainedEffectName;
	SustainedEffect.bRemoveWhenTargetDies = true;
	SustainedEffect.EffectRemovedSourceVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEndSource_BuildVisualization;
	SustainedEffect.EffectRemovedVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEndTarget_BuildVisualization;
	SustainedEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin); //infinite
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('AffectedByStasis');
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('StunStrikeActivated');
	SustainedEffect.bBringRemoveVisualizationForward = true;

	// Since this will also be a sustained ability, only put the bound status on the target
	// for one round
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, true);
	BoundEffect.CustomIdleOverrideAnim = class'X2Ability_ViperWeapons'.default.ViperBindLoop;
	Template.AddTargetEffect(BoundEffect);
	SustainedEffect.EffectsToRemoveFromTarget.AddItem(BoundEffect.EffectName);

	// The shooter is also bound
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, false);
	BoundEffect.CustomIdleOverrideAnim = class'X2Ability_ViperWeapons'.default.ViperBindCastLoop;
	Template.AddShooterEffect(BoundEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(BoundEffect.EffectName);
	Template.AddTargetEffect(SustainedEffect);
	
	HasMAW_I = new class'X2Condition_ViperHasAbility';
	HasMAW_I.RequiredAbilityNameOnSource = 'Viper_MAW_I_Bonus';
	HasMAW_II = new class'X2Condition_ViperHasAbility';
	HasMAW_II.RequiredAbilityNameOnSource = 'Viper_MAW_II_Bonus';
	HasMAW_III = new class'X2Condition_ViperHasAbility';
	HasMAW_III.RequiredAbilityNameOnSource = 'Viper_MAW_III_Bonus';
	
	Strength1 = new class'X2Effect_PersistentStatChange';
	Strength2 = new class'X2Effect_PersistentStatChange';
	Strength3 = new class'X2Effect_PersistentStatChange';
	Strength1.BuildPersistentEffect(1, true, false, false);
	Strength2.BuildPersistentEffect(1, true, false, false);
	Strength3.BuildPersistentEffect(1, true, false, false);
	Strength1.TargetConditions.AddItem(HasMAW_I);
	Strength2.TargetConditions.AddItem(HasMAW_II);
	Strength3.TargetConditions.AddItem(HasMAW_III);
	Strength1.EffectName = 'BoundStrengthEffect';
	Strength2.EffectName = 'BoundStrengthEffect';
	Strength3.EffectName = 'BoundStrengthEffect';
	Strength1.AddPersistentStatChange(eStat_Strength, class'X2Item_MAW'.default.MAW_I_Strength);
	Strength2.AddPersistentStatChange(eStat_Strength, class'X2Item_MAW'.default.MAW_II_Strength);
	Strength3.AddPersistentStatChange(eStat_Strength, class'X2Item_MAW'.default.MAW_III_Strength);
	Template.AddShooterEffect(Strength1);
	Template.AddShooterEffect(Strength2);
	Template.AddShooterEffect(Strength3);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(Strength1.EffectName);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(Strength2.EffectName);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(Strength3.EffectName);

	Template.ActivationSpeech = 'HackUnitSuccess';

	return Template;
}

static function X2AbilityTemplate VW_BindSustained()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_SustainedEffect  InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_ImmediateAbilityActivation        RemoveBind;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_BindSustained');
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
	StatCheck.BaseValue = default.BindPassiveStrengthBonus;
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
	RemoveBind.AbilityName = 'VW_EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate VW_BindSustainedCrush()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_PlayerInput  InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_ApplyWeaponDamage        PhysicalDamageEffect;
	local X2Effect_ImmediateAbilityActivation          RemoveBind;
	local X2AbilityCooldown                 Cooldown;
	local AdditionalCooldownInfo 			SubdueCooldown, ChokeCooldown;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;
	local X2Condition_UnitTemplateCheck				ExcudeCharacterCondition;
	local X2Condition_UnitType				ExcludeCharacterGroupCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_BindSustainedCrush');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindCrush";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 1;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.BindCrushActionCost;
	ActionPointCost.bFreeCost = default.BindCrushFreeAction;
	ActionPointCost.bConsumeAllPoints = default.BindCrushEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BindCrushCooldown;

	SubdueCooldown.AbilityName = 'VW_BindSustainedSubdue';
	SubdueCooldown.NumTurns = default.BindCrushCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(SubdueCooldown);

	ChokeCooldown.AbilityName = 'VW_BindSustainedChoke';
	ChokeCooldown.NumTurns = default.BindCrushCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(ChokeCooldown);

	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.BindCrushStrengthBonus;
	Template.AbilityToHitCalc = StatCheck;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	ExcudeCharacterCondition = new class'X2Condition_UnitTemplateCheck';
	ExcudeCharacterCondition.ExcludeTypes = class'X2Ability_ViperWeapons'.default.CharactersThatCanNotBeCrushed;
	Template.AbilityTargetConditions.AddItem(ExcudeCharacterCondition);
	
	ExcludeCharacterGroupCondition = new class'X2Condition_UnitType';
	ExcludeCharacterGroupCondition.ExcludeTypes.AddItem('Viper');
	ExcludeCharacterGroupCondition.ExcludeTypes.AddItem('ViperNeonate');
	ExcludeCharacterGroupCondition.ExcludeTypes.AddItem('ViperKing');
	Template.AbilityTargetConditions.AddItem(ExcludeCharacterGroupCondition);

	// May only target a single unit
	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'VW_EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Deal small damage on 2-3 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.BindCrush_WeakDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.BindCrushMinResultForWeakDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.BindCrushMaxResultForWeakDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal damage on 4-5 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.BindCrush_BaseDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.BindCrushMinResultForBaseDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.BindCrushMaxResultForBaseDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal big damage on 6+ unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.BindCrush_StrongDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.BindCrushMinResultForStrongDamage;
	PhysicalDamageEffect.MaxStatContestResult = 0;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.DamagePreviewFn = CrushDamagePreview;

	Template.SourceMissSpeech = 'HackTurretSuccess';

	return Template;
}

function bool CrushDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
    MinDamagePreview = default.BindCrush_WeakDamage;
    MaxDamagePreview = default.BindCrush_StrongDamage;

    return true;
}

static function X2AbilityTemplate VW_BindSustainedSubdue()
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
	local AdditionalCooldownInfo 			CrushCooldown, ChokeCooldown;
	local X2Condition_UnitEffects           UnconsciousEffectsCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_BindSustainedSubdue');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindSubdue";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 2;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.BindSubdueActionCost;
	ActionPointCost.bFreeCost = default.BindSubdueFreeAction;
	ActionPointCost.bConsumeAllPoints = default.BindSubdueEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BindSubdueCooldown;

	CrushCooldown.AbilityName = 'VW_BindSustainedCrush';
	CrushCooldown.NumTurns = default.BindSubdueCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(CrushCooldown);

	ChokeCooldown.AbilityName = 'VW_BindSustainedChoke';
	ChokeCooldown.NumTurns = default.BindSubdueCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(ChokeCooldown);

	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.BindSubdueStrengthBonus;
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
	RemoveBind.AbilityName = 'VW_EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Disorientate on 2-3 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.BindSubdueDisorientedTurns;
	DisorientedEffect.MinStatContestResult = default.BindSubdueMinResultForDisoriented;
	DisorientedEffect.MaxStatContestResult = default.BindSubdueMaxResultForDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Disorientate longer on 4 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.BindSubdueStrongDisorientedTurns;
	DisorientedEffect.MinStatContestResult = default.BindSubdueMinResultForStrongDisoriented;
	DisorientedEffect.MaxStatContestResult = default.BindSubdueMaxResultForStrongDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Stun on 5-7 unblocked str hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.BindSubdueStunnedTurns, 100, false);
	StunnedEffect.MinStatContestResult = default.BindSubdueMinResultForStunned;
	StunnedEffect.MaxStatContestResult = default.BindSubdueMaxResultForStunned;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);

	// K.O on 8+ unblocked str hit (Stun)
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = default.BindSubdueMinResultForUnconscious;
	StunnedEffect.MaxStatContestResult = 0;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);
	
	// K.O on 8+ unblocked str hit (Unconscious)
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = default.BindSubdueMinResultForUnconscious;
	UnconsciousEffect.MaxStatContestResult = 0;
	Template.AddTargetEffect(UnconsciousEffect);
	
	UnconsciousEffectsCondition = new class'X2Condition_UnitEffects';
	UnconsciousEffectsCondition.AddRequireEffect(class'X2StatusEffects'.default.UnconsciousName, 'AA_UnitIsUnconscious');
	
	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'VW_EndBindAlt';
	RemoveBind.TargetConditions.AddItem(UnconsciousEffectsCondition);
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.SourceMissSpeech = 'HackTurretSuccess';

	return Template;
}

static function X2AbilityTemplate VW_BindSustainedChoke()
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
	local AdditionalCooldownInfo 			CrushCooldown, SubdueCooldown;
	local X2Effect_Stunned					StunnedEffect;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_BindSustainedChoke');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindChoke";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 3;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.BindChokeActionCost;
	ActionPointCost.bFreeCost = default.BindChokeFreeAction;
	ActionPointCost.bConsumeAllPoints = default.BindChokeEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BindChokeCooldown;

	CrushCooldown.AbilityName = 'VW_BindSustainedCrush';
	CrushCooldown.NumTurns = default.BindChokeCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(CrushCooldown);

	SubdueCooldown.AbilityName = 'VW_BindSustainedSubdue';
	SubdueCooldown.NumTurns = default.BindChokeCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(SubdueCooldown);

	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.BindChokeStrengthBonus;
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
	RemoveBind.AbilityName = 'VW_EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Chance for Disoriented to proc on choke
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.BindChokeDisorientedTurns;
	DisorientedEffect.ApplyChance = default.BindChokeDisorientedChance;
	Template.AddTargetEffect(DisorientedEffect);

	// Deal small damage on 2-3 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.BindChoke_WeakDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.BindChokeMinResultForWeakDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.BindChokeMaxResultForWeakDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal damage on 4-5 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.BindChoke_BaseDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.BindChokeMinResultForBaseDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.BindChokeMaxResultForBaseDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal big damage on 6-7 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.BindChoke_StrongDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.BindChokeMinResultForStrongDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.BindChokeMaxResultForStrongDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);
	
	// K.O on 8+ unblocked str hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = default.BindChokeMinResultForUnconscious;
	StunnedEffect.MaxStatContestResult = 0;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);

	// K.O on 8+ unblocked str hit
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = default.BindChokeMinResultForUnconscious;
	UnconsciousEffect.MaxStatContestResult = 0;
	Template.AddTargetEffect(UnconsciousEffect);
	
	UnconsciousEffectsCondition = new class'X2Condition_UnitEffects';
	UnconsciousEffectsCondition.AddRequireEffect(class'X2StatusEffects'.default.UnconsciousName, 'AA_UnitIsUnconscious');
	
	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'VW_EndBindAlt';
	RemoveBind.TargetConditions.AddItem(UnconsciousEffectsCondition);
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.DamagePreviewFn = ChokeDamagePreview;

	Template.SourceMissSpeech = 'HackTurretSuccess';

	return Template;
}

function bool ChokeDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
    MinDamagePreview = default.BindCrush_WeakDamage;
    MaxDamagePreview = default.BindCrush_StrongDamage;

    return true;
}

static function X2AbilityTemplate VW_EndBind()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_RemoveEffects            RemoveEffects;
	local AdditionalCooldownInfo CooldownInfo;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_EndBind');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 4;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.BindEndActionCost;
	ActionPointCost.bFreeCost = default.BindEndFreeAction;
	ActionPointCost.bConsumeAllPoints = default.BindEndEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 0;

	CooldownInfo.AbilityName = 'VW_Bind';
	CooldownInfo.NumTurns = default.BindEndCooldown;
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

	Template.ActivationSpeech = 'HackTurretSuccess';

	return Template;
}

static function X2AbilityTemplate VW_EndBindAlt()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_RemoveEffects            RemoveEffects;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_EndBindAlt');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 0;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

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
	Template.BuildVisualizationFn = BindEndAlt_BuildVisualization;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.SourceMissSpeech = 'Kill';
	Template.ActivationSpeech = 'Kill';

	return Template;
}

static function BindEndAltSource_BuildVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local XComGameStateHistory			History;
	local XComGameState_Effect          BindSustainedEffectState;
	local XComGameState_Unit            OldUnitState, BindTarget;
	local X2Action_ViperWeaponsBindEndAlt         BindEnd;
	local XComGameStateContext			Context;

	History = `XCOMHISTORY;

	if (ActionMetadata.VisualizeActor != None)
	{
		Context = VisualizeGameState.GetContext();

		OldUnitState = XComGameState_Unit(ActionMetadata.StateObject_OldState);
		BindSustainedEffectState = OldUnitState.GetUnitApplyingEffectState(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName);
		`assert(BindSustainedEffectState != none);
		BindTarget = XComGameState_Unit(History.GetGameStateForObjectID(BindSustainedEffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
		`assert(BindTarget != none);

		if (BindTarget.IsDead() ||
			BindTarget.IsBleedingOut() ||
			BindTarget.IsUnconscious())
		{
			// The target is dead, wait for it to die and inform the source
			class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		}
		else
		{
			//class 'X2StatusEffects'.static.AddEffectCameraPanToAffectedUnitToTrack(ActionMetadata, VisualizeGameState.GetContext());
			ActionMetadata.AdditionalVisualizeActors.AddItem(History.GetVisualizer(BindSustainedEffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
			BindEnd = X2Action_ViperWeaponsBindEndAlt(class'X2Action_ViperWeaponsBindEndAlt'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
			BindEnd.PartnerUnitRef = BindSustainedEffectState.ApplyEffectParameters.TargetStateObjectRef;
			BindEnd.bIsCaster = true;
		}
	}
}

simulated function BindEndAltTarget_BuildVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{	
	local XComGameState_Effect          BindSustainedEffectState;
	local XComGameState_Unit            OldUnitState, NewUnitState, BindSourceState;
	local X2Action_ViperWeaponsBindEndAlt         BindEnd;
	local XComGameStateContext			Context;
	local XComGameStateHistory			History;

	History = `XCOMHISTORY;

	if (ActionMetadata.VisualizeActor != None)
	{
		Context = VisualizeGameState.GetContext();

		OldUnitState = XComGameState_Unit(ActionMetadata.StateObject_OldState);
		NewUnitState = XComGameState_Unit(ActionMetadata.StateObject_NewState);
		BindSustainedEffectState = OldUnitState.GetUnitAffectedByEffectState(class'X2Ability_ViperWeapons'.default.BindSustainedEffectName);
		`assert(BindSustainedEffectState != none);
		BindSourceState = XComGameState_Unit(History.GetGameStateForObjectID(BindSustainedEffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

		if (NewUnitState.IsDead() ||
			NewUnitState.IsBleedingOut() ||
			NewUnitState.IsAlive() ||
			NewUnitState.IsIncapacitated() ||
			NewUnitState.IsUnconscious() ||
			BindSourceState.IsDead() ||
			BindSourceState.IsBleedingOut() ||
			BindSourceState.IsUnconscious())
		{
			ActionMetadata.AdditionalVisualizeActors.AddItem(History.GetVisualizer(BindSourceState.ObjectID));
			class 'X2StatusEffects'.static.AddEffectCameraPanToAffectedUnitToTrack(ActionMetadata, VisualizeGameState.GetContext());
			BindEnd = X2Action_ViperWeaponsBindEndAlt(class'X2Action_ViperWeaponsBindEndAlt'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
			BindEnd.PartnerUnitRef = BindSustainedEffectState.ApplyEffectParameters.SourceStateObjectRef;
			BindEnd.bIsCaster = false;
		}
		//else
		//{
		//	class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		//}
	}
}

simulated function BindEndAlt_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory			History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference          InteractingUnitRef;
	

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	InteractingUnitRef = Context.InputContext.SourceObject;
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);

	BindEndAltSource_BuildVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');
		//****************************************************************************************

	//Configure the visualization track for the target
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	InteractingUnitRef = Context.InputContext.PrimaryTarget;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	BindEndAltTarget_BuildVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');
		//****************************************************************************************
}


static function X2AbilityTemplate VW_GetOverHere()
{
	local X2AbilityTemplate                 Template;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2Condition_UnblockedNeighborTile UnblockedNeighborTileCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityCooldown  				Cooldown;
	local AdditionalCooldownInfo 			CooldownInfo;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_TargetIsHighCovered	CoverCondition;
	local X2AbilityToHitCalc_StandardAim    Pull;
	local X2Effect_GetOverHere				PullEffect;
	local X2Effect_GrantActionPoints        PullActionPointsEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_GetOverHere');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_getoverhere";

	Template.AdditionalAbilities.AddItem('VW_FriendlyGetOverHere');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;

	// Source cannot be dead
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
	Template.AddShooterEffectExclusions();

	// There must be a free tile around the source unit
	UnblockedNeighborTileCondition = new class'X2Condition_UnblockedNeighborTile';
	template.AbilityShooterConditions.AddItem(UnblockedNeighborTileCondition);

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

	// The target must be alive and a humanoid and an enemy
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNonHumanoidAliens = true;
	UnitPropertyCondition.ExcludeLargeUnits = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.RequireWithinMinRange = true;
	UnitPropertyCondition.WithinMinRange = default.EnemyTonguePullMinRange;
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = default.EnemyTonguePullMaxRange;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// Cooldown from pulling an enemy
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.EnemyTonguePullCooldown;

	CooldownInfo.AbilityName = 'VW_FriendlyGetOverHere';
	CooldownInfo.NumTurns = default.EnemyTonguePullCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(CooldownInfo);
	Template.AbilityCooldown = Cooldown;

	// AP to pull a enemy
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.EnemyActionCostToTonguePull;
	ActionPointCost.bConsumeAllPoints = default.EnemyTonguePullEndsTurn;
	ActionPointCost.bFreeCost = default.EnemyTonguePullIsFreeAction;
	Template.AbilityCosts.AddItem(ActionPointCost);

	// Cannot pull an enemy out of high cover, unless flanking them
	CoverCondition = new class'X2Condition_TargetIsHighCovered';
	CoverCondition.bBlockedByHighCover = default.EnemyTonguePullBlockedByHighCover;
	Template.AbilityTargetConditions.AddItem(CoverCondition);

	// Standard aim roll for pulling enemies
	Pull = new class'X2AbilityToHitCalc_StandardAim';
	Template.AbilityToHitCalc = Pull;

	// Standard animation for pulling enemies
	PullEffect = new class'X2Effect_GetOverHere';
	Template.AddTargetEffect(PullEffect);

	// The shooter gets a free point from pulling an enemy
	PullActionPointsEffect = new class'X2Effect_GrantActionPoints';
	PullActionPointsEffect.NumActionPoints = default.ActionPointsFromEnemyTonguePull;
	PullActionPointsEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddShooterEffect(PullActionPointsEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.GetOverhere_BuildVisualization;
	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.bUsesFiringCamera = true;
	Template.CinescriptCameraType = "Viper_StranglePull";

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.ActivationSpeech = 'Justice';

	return Template;
}

static function X2AbilityTemplate VW_FriendlyGetOverHere()
{
	local X2AbilityTemplate                 Template;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2Condition_UnblockedNeighborTile UnblockedNeighborTileCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityCooldown  				Cooldown;
	local AdditionalCooldownInfo 			CooldownInfo;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_TargetIsHighCovered	CoverCondition;
	local X2AbilityToHitCalc_StandardAim    Pull;
	local X2Effect_GetOverHere				PullEffect;
	local X2Effect_GrantActionPoints        PullActionPointsEffect, PullActionPointsGivenEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_FriendlyGetOverHere');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_getoverhere";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;

	// Source cannot be dead
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
	Template.AddShooterEffectExclusions();

	// There must be a free tile around the source unit
	UnblockedNeighborTileCondition = new class'X2Condition_UnblockedNeighborTile';
	template.AbilityShooterConditions.AddItem(UnblockedNeighborTileCondition);

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
	
	// The target must be alive and a humanoid and an ally
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNonHumanoidAliens = true;
	UnitPropertyCondition.ExcludeLargeUnits = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.RequireWithinMinRange = true;
	UnitPropertyCondition.WithinMinRange = default.AllyTonguePullMinRange;
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = default.AllyTonguePullMaxRange;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// Cooldown from pulling an ally
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.AllyTonguePullCooldown;

	CooldownInfo.AbilityName = 'VW_GetOverHere';
	CooldownInfo.NumTurns = default.AllyTonguePullCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(CooldownInfo);
	Template.AbilityCooldown = Cooldown;

	// AP to pull a ally
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.AllyActionCostToTonguePull;
	ActionPointCost.bConsumeAllPoints = default.AllyTonguePullEndsTurn;
	ActionPointCost.bFreeCost = default.AllyTonguePullIsFreeAction;
	Template.AbilityCosts.AddItem(ActionPointCost);

	// Can pull an ally, regardless of cover
	CoverCondition = new class'X2Condition_TargetIsHighCovered';
	CoverCondition.bBlockedByHighCover = default.AllyTonguePullBlockedByHighCover;
	Template.AbilityTargetConditions.AddItem(CoverCondition);

	// This will attack using the standard aim but can be guaranteed on Allies
	Pull = new class'X2AbilityToHitCalc_StandardAim';
	Pull.bGuaranteedHit = default.TonguePullGuaranteedOnAllies;
	Template.AbilityToHitCalc = Pull;

	// TODO: Replace effect with one with alt animations
	PullEffect = new class'X2Effect_GetOverHere';
	Template.AddTargetEffect(PullEffect);

	// As well as an ally
	PullActionPointsEffect = new class'X2Effect_GrantActionPoints';
	PullActionPointsEffect.NumActionPoints = default.ActionPointsFromAllyTonguePull;
	PullActionPointsEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddShooterEffect(PullActionPointsEffect);

	// Give an ally a free movement action to reposision after pull
	PullActionPointsGivenEffect = new class'X2Effect_GrantActionPoints';
	PullActionPointsGivenEffect.NumActionPoints = 1;
	PullActionPointsGivenEffect.PointType = class'X2CharacterTemplateManager'.default.MoveActionPoint;
	PullActionPointsGivenEffect.bApplyOnlyWhenOut = true;
	Template.AddTargetEffect(PullActionPointsGivenEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.GetOverhere_BuildVisualization;
	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.bUsesFiringCamera = true;
	Template.CinescriptCameraType = "Viper_StranglePull";

	// This action is considered 'defensive' as you are aiding your team
	Template.Hostility = eHostility_Defensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = false;

	Template.ActivationSpeech = 'HealingAlly';
	Template.SourceMissSpeech = 'TargetMissed';

	return Template;
}

static function X2AbilityTemplate VW_CivilianBind()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_Persistent			    BoundEffect;
	local X2Effect_ViperBindSustained       SustainedEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_CivilianBind');

	SetupSharedBindAbilityData(Template);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;	

	Template.AdditionalAbilities.AddItem('VW_CivilianBindSustained');
	Template.AdditionalAbilities.AddItem('VW_EndBind');

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	Template.AddShooterEffectExclusions();

	// Add to the target the sustained bind effect
	SustainedEffect = new class'X2Effect_ViperBindSustained';
	SustainedEffect.SustainedAbilityName = 'VW_CivilianBindSustained';
	SustainedEffect.FragileAmount = default.DamageRequiredToEndBind - 2;
	SustainedEffect.EffectName = class'X2Ability_ViperWeapons'.default.BindSustainedEffectName;
	SustainedEffect.bRemoveWhenTargetDies = true;
	SustainedEffect.EffectRemovedSourceVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEndSource_BuildVisualization;
	SustainedEffect.EffectRemovedVisualizationFn = class'X2Ability_ViperWeapons'.static.BindEndTarget_BuildVisualization;
	SustainedEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin); //infinite
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('AffectedByStasis');
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('StunStrikeActivated');
	SustainedEffect.bBringRemoveVisualizationForward = true;

	// Since this will also be a sustained ability, only put the bound status on the target
	// for one round
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, true);
	BoundEffect.CustomIdleOverrideAnim = class'X2Ability_ViperWeapons'.default.ViperBindLoop;
	Template.AddTargetEffect(BoundEffect);
	SustainedEffect.EffectsToRemoveFromTarget.AddItem(BoundEffect.EffectName);

	// The shooter is also bound
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, false);
	BoundEffect.CustomIdleOverrideAnim = class'X2Ability_ViperWeapons'.default.ViperBindCastLoop;
	Template.AddShooterEffect(BoundEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(BoundEffect.EffectName);
	Template.AddTargetEffect(SustainedEffect);

	Template.ActivationSpeech = 'HackUnitSuccess';

	return Template;
}

static function X2AbilityTemplate VW_CivilianBindSustained()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_SustainedEffect  InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_ImmediateAbilityActivation        RemoveBind;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'VW_BindSustained');
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
	StatCheck.BaseValue = default.BindPassiveStrengthBonus - 40;
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
	RemoveBind.AbilityName = 'VW_EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}
