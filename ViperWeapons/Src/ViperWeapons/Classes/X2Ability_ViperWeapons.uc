class X2Ability_ViperWeapons extends X2Ability
	config(ViperAbilities);

var config int DamageRequiredToEndBind;
var config float BindRange;
var config int BindActionCost;
var config bool BindFreeAction;
var config bool BindEndsTurn;

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

var config int TonguePullUnitCooldown;
var config int TonguePullGlobalCooldown;
var config bool TonguePullIsFreeAction;
var config bool TonguePullEndsTurn;
var config int ActionCostToTonguePull;
var config int ActionPointsFromTonguePull;
var config float TonguePullMinRange;
var config float TonguePullMaxRange;
var config bool TonguePullBlockedByHighCover;

var config array<name> BIND_ABILITY_ALIASES;
var config array<name> BIND_SUSTAINED_ABILITY_ALIASES;
var config array<name> GET_OVER_HERE_ABILITY_ALIASES;

var config WeaponDamageValue Bind_WeakDamage;
var config WeaponDamageValue Bind_BaseDamage;
var config WeaponDamageValue Bind_StrongDamage;

var name BindSustainedEffectName;
var name GetOverHereAbilityName;
var name BindAbilityName;

var name ViperBindStart;
var name ViperBindLoop;
var name ViperBindEnd;
var name ViperBindCastStart;
var name ViperBindCastLoop;
var name ViperBindCastEnd;

var config array<name> CharactersThatCanNotBeBound;
var config array<name> CharactersThatCanNotBeCrushed;

var config array<name> ViperBoaTemplates;
var config array<name> ViperPrimeTemplates;
var config array<name> ViperEliteTemplates;

var config int BoaBindArmour;
var config int PrimeBindArmour;
var config int EliteBindArmour;

var config int BoaBindDefense;
var config int PrimeBindDefense;
var config int EliteBindDefense;

var config int BoaBindStrength;
var config int PrimeBindStrength;
var config int EliteBindStrength;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateBindAbility());
	Templates.AddItem(CreateBindSustainedAbility());
	Templates.AddItem(BindSustainedCrush());
	Templates.AddItem(BindSustainedSubdue());
	Templates.AddItem(CreateEndBindAbility('EndBind'));
	Templates.AddItem(CreateEndBindAltAbility('EndBindAlt'));
	Templates.AddItem(CreateGetOverHereAbility());

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
	ExcudeCharacterCondition.ExcludeTypes = default.CharactersThatCanNotBeBound;
	Template.AbilityTargetConditions.AddItem(ExcudeCharacterCondition);

	// The target must be visible and NOT in full cover
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bCannotPeek = true;
	TargetVisibilityCondition.bRequireNotMatchCoverType = true;
	TargetVisibilityCondition.TargetCover = CT_Standing;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = Bind_BuildVisualization;
	Template.BuildAffectedVisualizationSyncFn = BindUnit_BuildAffectedVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CinescriptCameraType = "Viper_Bind";
	Template.Hostility = eHostility_Offensive;

	Template.bFrameEvenWhenUnitIsHidden = true;
}

static function X2AbilityTemplate CreateBindAbility(name SustainedAbilityName='BindSustained')
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_Persistent			    BoundEffect;
	local X2Effect_ViperBindSustained       SustainedEffect;
	local X2Condition_UnitTemplateCheck		IsBoaTemplate, IsPrimeTemplate, IsEliteTemplate;
	local X2Effect_PersistentStatChange 	BoaArmourEffect, BoaDefenseEffect, BoaStrengthEffect, PrimeArmourEffect, PrimeDefenseEffect, PrimeStrengthEffect, EliteArmourEffect, EliteDefenseEffect, EliteStrengthEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.BindAbilityName);

	SetupSharedBindAbilityData(Template);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;	

	Template.AdditionalAbilities.AddItem('BindSustained');
	Template.AdditionalAbilities.AddItem('BindSustainedCrush');
	Template.AdditionalAbilities.AddItem('BindSustainedSubdue');
	Template.AdditionalAbilities.AddItem('EndBind');
	Template.AdditionalAbilities.AddItem('EndBindAlt');

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	Template.AddShooterEffectExclusions();

	// Add to the target the sustained bind effect
	SustainedEffect = new class'X2Effect_ViperBindSustained';
	SustainedEffect.SustainedAbilityName = SustainedAbilityName;
	SustainedEffect.FragileAmount = default.DamageRequiredToEndBind;
	SustainedEffect.EffectName = default.BindSustainedEffectName;
	SustainedEffect.bRemoveWhenTargetDies = true;
	SustainedEffect.EffectRemovedSourceVisualizationFn = BindEndSource_BuildVisualization;
	SustainedEffect.EffectRemovedVisualizationFn = BindEndTarget_BuildVisualization;
	SustainedEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin); //infinite
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('AffectedByStasis');
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('StunStrikeActivated');
	SustainedEffect.bBringRemoveVisualizationForward = true;

	// Since this will also be a sustained ability, only put the bound status on the target
	// for one round
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, true);
	BoundEffect.CustomIdleOverrideAnim = default.ViperBindLoop;
	Template.AddTargetEffect(BoundEffect);
	// This target effect needs to be set as a child on the sustain effect
	SustainedEffect.EffectsToRemoveFromTarget.AddItem(BoundEffect.EffectName);

	// The shooter is also bound
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, false);
	BoundEffect.CustomIdleOverrideAnim = default.ViperBindCastLoop;
	Template.AddShooterEffect(BoundEffect);
	// This source effect needs to be set as a child on the sustain effect
	SustainedEffect.EffectsToRemoveFromSource.AddItem(BoundEffect.EffectName);

	IsBoaTemplate = new class'X2Condition_UnitTemplateCheck';
	IsBoaTemplate.IncludeTypes = default.ViperBoaTemplates;

	IsPrimeTemplate = new class'X2Condition_UnitTemplateCheck';
	IsPrimeTemplate.IncludeTypes = default.ViperPrimeTemplates;

	IsEliteTemplate = new class'X2Condition_UnitTemplateCheck';
	IsEliteTemplate.IncludeTypes = default.ViperEliteTemplates;

	// Bonus Effects applied to the Bind, depending on the caster's template.
	BoaArmourEffect = new class'X2Effect_PersistentStatChange';
	BoaArmourEffect.BuildPersistentEffect(1, true, false, false);
	BoaArmourEffect.EffectName = 'BoundArmourEffect';
	BoaArmourEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.BoaBindArmour);
	BoaArmourEffect.TargetConditions.AddItem(IsBoaTemplate);
	Template.AddShooterEffect(BoaArmourEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(BoaArmourEffect.EffectName);

	PrimeArmourEffect = new class'X2Effect_PersistentStatChange';
	PrimeArmourEffect.BuildPersistentEffect(1, true, false, false);
	PrimeArmourEffect.EffectName = 'BoundArmourEffect';
	PrimeArmourEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.PrimeBindArmour);
	PrimeArmourEffect.TargetConditions.AddItem(IsPrimeTemplate);
	Template.AddShooterEffect(PrimeArmourEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(PrimeArmourEffect.EffectName);

	EliteArmourEffect = new class'X2Effect_PersistentStatChange';
	EliteArmourEffect.BuildPersistentEffect(1, true, false, false);
	EliteArmourEffect.EffectName = 'BoundArmourEffect';
	EliteArmourEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.EliteBindArmour);
	EliteArmourEffect.TargetConditions.AddItem(IsEliteTemplate);
	Template.AddShooterEffect(EliteArmourEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(EliteArmourEffect.EffectName);

	BoaDefenseEffect = new class'X2Effect_PersistentStatChange';
	BoaDefenseEffect.BuildPersistentEffect(1, true, false, false);
	BoaDefenseEffect.EffectName = 'BoundDefenseEffect';
	BoaDefenseEffect.AddPersistentStatChange(eStat_Defense, default.BoaBindDefense);
	BoaDefenseEffect.TargetConditions.AddItem(IsBoaTemplate);
	Template.AddShooterEffect(BoaDefenseEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(BoaDefenseEffect.EffectName);

	PrimeDefenseEffect = new class'X2Effect_PersistentStatChange';
	PrimeDefenseEffect.BuildPersistentEffect(1, true, false, false);
	PrimeDefenseEffect.EffectName = 'BoundDefenseEffect';
	PrimeDefenseEffect.AddPersistentStatChange(eStat_Defense, default.PrimeBindDefense);
	PrimeDefenseEffect.TargetConditions.AddItem(IsPrimeTemplate);
	Template.AddShooterEffect(PrimeDefenseEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(PrimeDefenseEffect.EffectName);

	EliteDefenseEffect = new class'X2Effect_PersistentStatChange';
	EliteDefenseEffect.BuildPersistentEffect(1, true, false, false);
	EliteDefenseEffect.EffectName = 'BoundDefenseEffect';
	EliteDefenseEffect.AddPersistentStatChange(eStat_Defense, default.EliteBindDefense);
	EliteDefenseEffect.TargetConditions.AddItem(IsEliteTemplate);
	Template.AddShooterEffect(EliteDefenseEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(EliteDefenseEffect.EffectName);

	BoaStrengthEffect = new class'X2Effect_PersistentStatChange';
	BoaStrengthEffect.BuildPersistentEffect(1, true, false, false);
	BoaStrengthEffect.EffectName = 'BoundStrengthEffect';
	BoaStrengthEffect.AddPersistentStatChange(eStat_Strength, default.BoaBindStrength);
	BoaStrengthEffect.TargetConditions.AddItem(IsBoaTemplate);
	Template.AddShooterEffect(BoaStrengthEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(BoaStrengthEffect.EffectName);

	PrimeStrengthEffect = new class'X2Effect_PersistentStatChange';
	PrimeStrengthEffect.BuildPersistentEffect(1, true, false, false);
	PrimeStrengthEffect.EffectName = 'BoundStrengthEffect';
	PrimeStrengthEffect.AddPersistentStatChange(eStat_Strength, default.PrimeBindStrength);
	PrimeStrengthEffect.TargetConditions.AddItem(IsPrimeTemplate);
	Template.AddShooterEffect(PrimeStrengthEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(PrimeStrengthEffect.EffectName);

	EliteStrengthEffect = new class'X2Effect_PersistentStatChange';
	EliteStrengthEffect.BuildPersistentEffect(1, true, false, false);
	EliteStrengthEffect.EffectName = 'BoundStrengthEffect';
	EliteStrengthEffect.AddPersistentStatChange(eStat_Strength, default.EliteBindStrength);
	EliteStrengthEffect.TargetConditions.AddItem(IsEliteTemplate);
	Template.AddShooterEffect(EliteStrengthEffect);
	SustainedEffect.EffectsToRemoveFromSource.AddItem(EliteStrengthEffect.EffectName);

	Template.ActivationSpeech = 'HackUnitSuccess';

	// All child effects to the sustained effect have been added, submit
	Template.AddTargetEffect(SustainedEffect);

	return Template;
}

static function X2AbilityTemplate CreateBindSustainedAbility()
{
	local X2AbilityTemplate                 				Template;
	local X2AbilityTrigger_SustainedEffect  				InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource 			UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        				ActionPointCost;
	local X2AbilityTarget_Single            				SingleTarget;
	local X2Effect_ImmediateAbilityActivation          		RemoveBind;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit 			StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BindSustained');
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
	UnitEffectsCondition.AddRequireEffect(default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// May only target a single unit
	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_SustainedEffect';
	Template.AbilityTriggers.AddItem(InputTrigger);

	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate BindSustainedCrush()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_PlayerInput  InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_ApplyWeaponDamage        PhysicalDamageEffect;
	local X2Effect_ImmediateAbilityActivation          RemoveBind;
	local X2AbilityCooldown                 Cooldown;
	local AdditionalCooldownInfo 			SubdueCooldown;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;
	local X2Condition_UnitTemplateCheck				ExcudeCharacterCondition;
	local X2Condition_UnitType				ExcludeCharacterGroupCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BindSustainedCrush');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindCrush";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = -1;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.BindCrushActionCost;
	ActionPointCost.bFreeCost = default.BindCrushFreeAction;
	ActionPointCost.bConsumeAllPoints = default.BindCrushEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BindCrushCooldown;

	SubdueCooldown.AbilityName = 'BindSustainedSubdue';
	SubdueCooldown.NumTurns = default.BindCrushCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(SubdueCooldown);

	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.BindCrushStrengthBonus;
	Template.AbilityToHitCalc = StatCheck;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	ExcudeCharacterCondition = new class'X2Condition_UnitTemplateCheck';
	ExcudeCharacterCondition.ExcludeTypes = default.CharactersThatCanNotBeCrushed;
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
	RemoveBind.AbilityName = 'EndBind';
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
	Template.BuildVisualizationFn = BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate BindSustainedSubdue()
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
	local AdditionalCooldownInfo 			CrushCooldown;
	local X2Condition_UnitEffects           UnconsciousEffectsCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BindSustainedSubdue');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindSubdue";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = -2;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.BindSubdueActionCost;
	ActionPointCost.bFreeCost = default.BindSubdueFreeAction;
	ActionPointCost.bConsumeAllPoints = default.BindSubdueEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BindSubdueCooldown;

	CrushCooldown.AbilityName = 'BindSustainedCrush';
	CrushCooldown.NumTurns = default.BindSubdueCooldown;
	Cooldown.AditionalAbilityCooldowns.AddItem(CrushCooldown);

	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.BindSubdueStrengthBonus;
	Template.AbilityToHitCalc = StatCheck;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// May only target a single unit
	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	RemoveBind = new class 'X2Effect_ImmediateAbilityActivation';
	RemoveBind.EffectName = 'ImmediateBindEnd';
	RemoveBind.AbilityName = 'EndBind';
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
	RemoveBind.AbilityName = 'EndBindAlt';
	RemoveBind.TargetConditions.AddItem(UnconsciousEffectsCondition);
	Template.AddTargetEffect(RemoveBind);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate CreateEndBindAbility(name TemplateName)
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_RemoveEffects            RemoveEffects;
	local AdditionalCooldownInfo 			CooldownInfo, RushAndBindCooldown, BoaRushAndBindCooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
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

	CooldownInfo.AbilityName = 'Bind';
	CooldownInfo.NumTurns = 2;
	Cooldown.AditionalAbilityCooldowns.AddItem(CooldownInfo);

	RushAndBindCooldown.AbilityName = 'AdderRushAndBind';
	RushAndBindCooldown.NumTurns = 2;
	Cooldown.AditionalAbilityCooldowns.AddItem(RushAndBindCooldown);
	Template.AbilityCooldown = Cooldown;

	BoaRushAndBindCooldown.AbilityName = 'BoaRushAndBind';
	BoaRushAndBindCooldown.NumTurns = 2;
	Cooldown.AditionalAbilityCooldowns.AddItem(BoaRushAndBindCooldown);
	Template.AbilityCooldown = Cooldown;

	Template.AbilityToHitCalc = default.DeadEye;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// Remove the bind/bound effects from the Target
	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(default.BindSustainedEffectName);
	Template.AddTargetEffect(RemoveEffects);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = BindEnd_BuildVisualization;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate CreateEndBindAltAbility(name TemplateName)
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_RemoveEffects            RemoveEffects;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
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

	return Template;
}

static function X2AbilityTemplate CreateGetOverHereAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown_LocalAndGlobal  Cooldown;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2Condition_UnblockedNeighborTile UnblockedNeighborTileCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Effect_GetOverHere				GetOverHereEffect;
	local X2Effect_GrantActionPoints        ActionPointsEffect;
	local X2Condition_TargetIsHighCovered	CoverCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.GetOverHereAbilityName);
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_getoverhere";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.ActionCostToTonguePull;
	ActionPointCost.bConsumeAllPoints = default.TonguePullEndsTurn;
	ActionPointCost.bFreeCost = default.TonguePullIsFreeAction;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown_LocalAndGlobal';
	Cooldown.iNumTurns = default.TonguePullUnitCooldown;
	Cooldown.NumGlobalTurns = default.TonguePullGlobalCooldown;
	Template.AbilityCooldown = Cooldown;

	CoverCondition = new class'X2Condition_TargetIsHighCovered';
	CoverCondition.bBlockedByHighCover = default.TonguePullBlockedByHighCover;
	Template.AbilityTargetConditions.AddItem(CoverCondition);

	// Source cannot be dead
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
	Template.AddShooterEffectExclusions();

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
	UnitPropertyCondition.WithinMinRange = default.TonguePullMinRange;
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = default.TonguePullMaxRange;
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

	GetOverHereEffect = new class'X2Effect_GetOverHere';
	Template.AddTargetEffect(GetOverHereEffect);

	// The shooter gets a free point that can be used bind
	ActionPointsEffect = new class'X2Effect_GrantActionPoints';
	ActionPointsEffect.NumActionPoints = default.ActionPointsFromTonguePull;
	ActionPointsEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddShooterEffect(ActionPointsEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = GetOverhere_BuildVisualization;
	Template.CinescriptCameraType = "Viper_StranglePull";

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.ActivationSpeech = 'TonguePull';

	return Template;
}

static  function GetOverhere_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory			History;
	local XComGameStateContext_Ability  Context;
	local X2AbilityTemplate             AbilityTemplate;
	local StateObjectReference          InteractingUnitRef;
	local X2Action_ViperWeaponsGetOverHere		GetOverHereAction;
	local X2Action_PlaySoundAndFlyOver	SoundAndFlyover;
	local X2VisualizerInterface			Visualizer;
	local XComGameState_Unit            TargetUnit;

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;
	local VisualizationActionMetadata        SourceMetadata;

	local int							EffectIndex;

	local X2Action_ExitCover			ExitCoverAction;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(Context.InputContext.AbilityTemplateName);

	
	//If we hit the target, then there should be a game state where we apply our free bind attack to the target. Collect visualization track actions
	//for this bind attack so we can sequence them into the grab + pull visualization

	//Configure the visualization track for the shooter
	//****************************************************************************************
	InteractingUnitRef = Context.InputContext.SourceObject;
	SourceMetadata = EmptyTrack;
	SourceMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	SourceMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	ExitCoverAction = X2Action_ExitCover(class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceMetadata, Context, false, SourceMetadata.LastActionAdded));
	ExitCoverAction.bUsePreviousGameState = true;
	GetOverHereAction = X2Action_ViperWeaponsGetOverHere(class'X2Action_ViperWeaponsGetOverHere'.static.AddToVisualizationTree(SourceMetadata, Context, false, SourceMetadata.LastActionAdded));
	GetOverHereAction.SetFireParameters(Context.IsResultContextHit());
	class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceMetadata, Context, false, SourceMetadata.LastActionAdded);

	Visualizer = X2VisualizerInterface(SourceMetadata.VisualizeActor);
	if(Visualizer != none)
	{
		Visualizer.BuildAbilityEffectsVisualization(VisualizeGameState, SourceMetadata);
	}

		//****************************************************************************************

	//Configure the visualization track for the target
	//****************************************************************************************
	InteractingUnitRef = Context.InputContext.PrimaryTarget;
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	TargetUnit = XComGameState_Unit(ActionMetadata.StateObject_OldState);
	if( (TargetUnit != none) && (TargetUnit.IsUnitApplyingEffectName('Suppression')))
	{
		class'X2Action_StopSuppression'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
	}

	for (EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityTargetEffects.Length; ++EffectIndex)
	{
		AbilityTemplate.AbilityTargetEffects[EffectIndex].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, Context.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[EffectIndex]));
	}

	if (Context.IsResultContextMiss() && AbilityTemplate.LocMissMessage != "")
	{
		SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
		SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocMissMessage, '', eColor_Bad);
	}
}

simulated function Bind_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory			History;
	local XComGameStateContext_Ability  Context;
	local X2AbilityTemplate				AbilityTemplate;
	local StateObjectReference          InteractingUnitRef;
	local X2Action_PlaySoundAndFlyOver  FlyOver;

	local VisualizationActionMetadata			EmptyTrack;
	local VisualizationActionMetadata			ActionMetadata;

	local int                           EffectIndex;
	local int							SearchHistoryIndex;

	local XComGameStateContext			TestContext;
	local XComGameStateContext_TacticalGameRule TestGameRuleContext;
	local XComGameStateContext_Ability  GetOverHereAbilityContext;
	local bool                          bGetOverHereWasHit;
	local bool                          bDisplayAnimations;
	local X2VisualizerInterface         TargetVisualizerInterface;
	local bool                          bIsContextHit;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(Context.InputContext.AbilityTemplateName);

	if( Context.InterruptionStatus == eInterruptionStatus_Interrupt )
	{
		// Only visualize InterruptionStatus eInterruptionStatus_None or eInterruptionStatus_Resume,
		// if eInterruptionStatus_Interrupt then the Viper was killed (or removed)
		return;
	}

	bIsContextHit = Context.IsResultContextHit();   // If this missed, there is no need to display animations

	bDisplayAnimations = Context.IsResultContextHit();

	// If this missed, there is no need to display animations
	if( bDisplayAnimations &&
		Context.InterruptionStatus == eInterruptionStatus_None )
	{
		// Look backwards for a turn begin, Bind, or GetOverHere
		for( SearchHistoryIndex = VisualizeGameState.HistoryIndex - 1; SearchHistoryIndex >= 0; --SearchHistoryIndex )
		{
			TestContext = History.GetGameStateFromHistory(SearchHistoryIndex).GetContext();
			TestGameRuleContext = XComGameStateContext_TacticalGameRule(TestContext);
			if( (TestGameRuleContext != none) && ( TestGameRuleContext.GameRuleType == eGameRule_PlayerTurnBegin ) )
			{
				// Found a begin turn, so no need to keep looking for GetOverHere
				break;
			}

			GetOverHereAbilityContext = XComGameStateContext_Ability(TestContext);
			bGetOverHereWasHit = GetOverHereAbilityContext != none && class'XComGameStateContext_Ability'.static.IsHitResultHit(GetOverHereAbilityContext.ResultContext.HitResult);

			if( bGetOverHereWasHit &&
				default.BIND_ABILITY_ALIASES.Find(GetOverHereAbilityContext.InputContext.AbilityTemplateName) != INDEX_NONE &&
				GetOverHereAbilityContext.InputContext.SourceObject.ObjectID == Context.InputContext.SourceObject.ObjectID )
			{
				// A Bind with the same source was found, so this can't be a Bind due to GetOverHere
				break;
			}
			else if( bGetOverHereWasHit &&
					 default.GET_OVER_HERE_ABILITY_ALIASES.Find(GetOverHereAbilityContext.InputContext.AbilityTemplateName) != INDEX_NONE &&
					 GetOverHereAbilityContext.InputContext.SourceObject.ObjectID == Context.InputContext.SourceObject.ObjectID )
			{
				// An associated GetOverHere Ability was found, so we won't need to show the animations
				bDisplayAnimations = true;
				break;
			}
		}
	}

	//Configure the visualization track for the shooter
	//****************************************************************************************
	InteractingUnitRef = Context.InputContext.SourceObject;
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	//If we were interrupted, insert a marker node for the interrupting visualization code to use. In the move path version above, it is expected for interrupts to be 
	//done during the move.
	if (Context.InterruptionStatus != eInterruptionStatus_None)
	{
		//Insert markers for the subsequent interrupt to insert into
		class'X2Action'.static.AddInterruptMarkerPair(ActionMetadata, Context, `XCOMVISUALIZATIONMGR.BuildVisTree);
	}

	if( bDisplayAnimations && bIsContextHit )
	{
		BindSourceAnimationVisualization(ActionMetadata, Context);
	}
	
	if( !bIsContextHit && (AbilityTemplate.LocMissMessage != "") )
	{
		FlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
		FlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocMissMessage, '', eColor_Bad);
	}

		//****************************************************************************************

	//Configure the visualization track for the target
	//****************************************************************************************
	if( bIsContextHit )
	{
		InteractingUnitRef = Context.InputContext.PrimaryTarget;
		ActionMetadata = EmptyTrack;
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
		ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

		if( bDisplayAnimations )
		{
			BindTargetAnimationVisualization(ActionMetadata, Context);
		}

		for(EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityTargetEffects.Length; ++EffectIndex)
		{
			AbilityTemplate.AbilityTargetEffects[EffectIndex].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, Context.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[EffectIndex]));
		}

		TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}

	}
}

static simulated function BindSourceAnimationVisualization(out VisualizationActionMetadata ActionMetadata, XComGameStateContext Context, bool bSyncAction = false)
{
	local X2Action_PersistentEffect PersistentEffectAction;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local XComGameState_Unit BindSourceUnit;
	local XComGameState_Effect BindEffectState;
	local Actor PartnerVisualizer;
	local XComGameStateVisualizationMgr VisMgr;
	local X2Action_ViperWeaponsGetOverHereTarget GetOverHereTarget;
	local Array<X2Action> ParentActions;
	local X2Action_ViperWeaponsBind ViperBind;

	History = `XCOMHISTORY;
	VisMgr = `XCOMVISUALIZATIONMGR;

	AbilityContext = XComGameStateContext_Ability(Context);
	if( AbilityContext != none )
	{
		PartnerVisualizer = History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID).GetVisualizer();
	}
	else
	{
		// The StateChangeContext is not a XComGameStateContext_Ability, so we need to get the primary target's ID another way
		BindSourceUnit = XComGameState_Unit(ActionMetadata.StateObject_NewState);
		BindEffectState = BindSourceUnit.GetUnitAffectedByEffectState(class'X2AbilityTemplateManager'.default.BoundName);

		PartnerVisualizer = History.GetGameStateForObjectID(BindEffectState.ApplyEffectParameters.AbilityInputContext.PrimaryTarget.ObjectID).GetVisualizer();
	}

	if( PartnerVisualizer != None && ActionMetadata.AdditionalVisualizeActors.Length == 0 )
	{
		ActionMetadata.AdditionalVisualizeActors.AddItem(PartnerVisualizer);
		
	}
	
	if( PartnerVisualizer != None )
	{
		GetOverHereTarget = X2Action_ViperWeaponsGetOverHereTarget(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_ViperWeaponsGetOverHereTarget', PartnerVisualizer));
		if( GetOverHereTarget != none )
			ParentActions.AddItem(GetOverHereTarget);
	}
	 
	if(ActionMetadata.LastActionAdded != none)
		ParentActions.AddItem(ActionMetadata.LastActionAdded);

	ViperBind = X2Action_ViperWeaponsBind( class'X2Action_ViperWeaponsBind'.static.AddToVisualizationTree( ActionMetadata, Context, false, None, ParentActions ) );
	ViperBind.bIsCaster = true;

	PersistentEffectAction = X2Action_PersistentEffect(class'X2Action_PersistentEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PersistentEffectAction.IdleAnimName = default.ViperBindCastLoop;
}

static simulated function BindTargetAnimationVisualization(out VisualizationActionMetadata ActionMetadata, XComGameStateContext Context)
{
	local X2Action_PersistentEffect		PersistentEffectAction;

	PersistentEffectAction = X2Action_PersistentEffect(class'X2Action_PersistentEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PersistentEffectAction.IdleAnimName = default.ViperBindLoop;
}

simulated function BindSustained_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory			History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference          InteractingUnitRef;
	local bool                          bTargetIsDead, bTargetIsUnconscious;
	local int                           i;

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	//Configure the visualization track for the target
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	InteractingUnitRef = Context.InputContext.PrimaryTarget;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	bTargetIsDead = XComGameState_Unit(ActionMetadata.StateObject_NewState).IsDead() ||
					XComGameState_Unit(ActionMetadata.StateObject_NewState).bBleedingOut;

	bTargetIsUnconscious = XComGameState_Unit(ActionMetadata.StateObject_NewState).IsUnconscious();

	if (bTargetIsDead || bTargetIsUnconscious)
	{
		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
	}

	for( i = 0; i < Context.ResultContext.TargetEffectResults.Effects.Length; ++i )
	{
		Context.ResultContext.TargetEffectResults.Effects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, Context.ResultContext.TargetEffectResults.ApplyResults[i]);
	}

	if( bTargetIsDead || bTargetIsUnconscious)
	{
		class'X2Action_Death'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
	}

	//****************************************************************************************
}

static function BindEndSource_BuildVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local XComGameStateHistory			History;
	local XComGameState_Effect          BindSustainedEffectState;
	local XComGameState_Unit            OldUnitState, BindTarget, NewUnitState;
	local X2Action_ViperWeaponsBindEnd         BindEnd;
	local XComGameStateContext			Context;

	History = `XCOMHISTORY;

	if (ActionMetadata.VisualizeActor != None)
	{
		Context = VisualizeGameState.GetContext();

		OldUnitState = XComGameState_Unit(ActionMetadata.StateObject_OldState);
		NewUnitState = XComGameState_Unit(ActionMetadata.StateObject_NewState);
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
		else if (NewUnitState.IsDead() ||
			NewUnitState.IsBleedingOut() ||
			NewUnitState.IsUnconscious())
		{
			// The caster is dead, wait for it to die and inform the source
			class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		}
		else
		{
			//class 'X2StatusEffects'.static.AddEffectCameraPanToAffectedUnitToTrack(ActionMetadata, VisualizeGameState.GetContext());
			ActionMetadata.AdditionalVisualizeActors.AddItem(History.GetVisualizer(BindSustainedEffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
			BindEnd = X2Action_ViperWeaponsBindEnd(class'X2Action_ViperWeaponsBindEnd'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
			BindEnd.PartnerUnitRef = BindSustainedEffectState.ApplyEffectParameters.TargetStateObjectRef;
			BindEnd.bIsCaster = true;
		}
	}
}

simulated function BindEndTarget_BuildVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{	
	local XComGameState_Effect          BindSustainedEffectState;
	local XComGameState_Unit            OldUnitState, BindSourceState, NewUnitState;
	local X2Action_ViperWeaponsBindEnd         BindEnd;
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
			NewUnitState.IsUnconscious() ||
			BindSourceState.IsDead() ||
			BindSourceState.IsBleedingOut() ||
			BindSourceState.IsUnconscious())
		{
			ActionMetadata.AdditionalVisualizeActors.AddItem(History.GetVisualizer(BindSourceState.ObjectID));
			class 'X2StatusEffects'.static.AddEffectCameraPanToAffectedUnitToTrack(ActionMetadata, VisualizeGameState.GetContext());
			BindEnd = X2Action_ViperWeaponsBindEnd(class'X2Action_ViperWeaponsBindEnd'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
			BindEnd.PartnerUnitRef = BindSustainedEffectState.ApplyEffectParameters.SourceStateObjectRef;
			BindEnd.bIsCaster = false;
		}
		//else
		//{
		//	class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		//}
	}
}

simulated function BindEnd_BuildVisualization(XComGameState VisualizeGameState)
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

	BindEndSource_BuildVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');
		//****************************************************************************************

	//Configure the visualization track for the target
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	InteractingUnitRef = Context.InputContext.PrimaryTarget;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	BindEndTarget_BuildVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');
		//****************************************************************************************
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


static simulated function BindUnit_BuildAffectedVisualization(name EffectName, XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata )
{
	local XComGameState_Unit NewGameState;
	local XComGameState_Effect BindEffectState;
	local VisualizationActionMetadata TargetMetadata;
	local XComGameStateHistory History;

	History = `XCOMHISTORY;

	if( EffectName == class'X2AbilityTemplateManager'.default.BoundName )
	{
		NewGameState = XComGameState_Unit(ActionMetadata.StateObject_NewState);
		BindEffectState = NewGameState.GetUnitAffectedByEffectState(EffectName);

		if( BindEffectState.ApplyEffectParameters.SourceStateObjectRef == NewGameState.GetReference() )
		{
			BindSourceAnimationVisualization(ActionMetadata, VisualizeGameState.GetContext(), true);
			TargetMetadata.VisualizeActor = History.GetVisualizer(BindEffectState.ApplyEffectParameters.AbilityInputContext.PrimaryTarget.ObjectID);
			TargetMetadata.StateObject_OldState = History.GetGameStateForObjectID(BindEffectState.ApplyEffectParameters.AbilityInputContext.PrimaryTarget.ObjectID);
			TargetMetadata.StateObject_NewState = TargetMetadata.StateObject_OldState;
			TargetMetadata.LastActionAdded = ActionMetadata.LastActionAdded;
			BindTargetAnimationVisualization(TargetMetadata, VisualizeGameState.GetContext());
		}
	}
}

DefaultProperties
{
	BindSustainedEffectName="BindSustainedEffect"	
	GetOverHereAbilityName="GetOverHere"
	BindAbilityName="Bind"

	ViperBindStart="NO_BindStart"
	ViperBindLoop="NO_BindLoop"
	ViperBindEnd="NO_BindStop"
	ViperBindCastStart="NO_BindCastStart"
	ViperBindCastLoop="NO_BindCastLoop"
	ViperBindCastEnd="NO_BindCastStop"
}
