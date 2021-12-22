class X2Ability_ModdedViperPullAndBinds extends X2Ability
	config(ViperAbilities);

var config WeaponDamageValue BoaBiteDamage;
var config int BoaBiteAccuracy;
var config int BoaBiteCritChance;
var config int BoaBiteCost;
var config bool BoaBiteEndsTurn;
var config int BoaBiteCooldown;

var config float BoaPullMinRange;
var config float BoaPullMaxRange;
var config int BoaPullCooldown;
var config bool BoaPullBlockedByHighCover;
var config int BoaPullBonusHitChance;

var config int BoaCrushStrengthBonus;
var config int BoaSubdueStrengthBonus;

var config int BoaCrushMinResultForWeakDamage;
var config int BoaCrushMaxResultForWeakDamage;
var config int BoaCrushMinResultForBaseDamage;
var config int BoaCrushMaxResultForBaseDamage;
var config int BoaCrushMinResultForStrongDamage;
var config WeaponDamageValue BoaCrush_WeakDamage;
var config WeaponDamageValue BoaCrush_BaseDamage;
var config WeaponDamageValue BoaCrush_StrongDamage;

var config int BoaSubdueDisorientedTurns;
var config int BoaSubdueMinResultForDisoriented;
var config int BoaSubdueMaxResultForDisoriented;
var config int BoaSubdueStrongDisorientedTurns;
var config int BoaSubdueMinResultForStrongDisoriented;
var config int BoaSubdueMaxResultForStrongDisoriented;
var config int BoaSubdueStunnedTurns;
var config int BoaSubdueMinResultForStunned;
var config int BoaSubdueMaxResultForStunned;
var config int BoaSubdueMinResultForUnconscious;

var config float PrimePullMinRange;
var config float PrimePullMaxRange;
var config int PrimePullCooldown;
var config bool PrimePullBlockedByHighCover;
var config int PrimePullBonusHitChance;

var config int PrimeChokeStrengthBonus;
var config int PrimeSubdueStrengthBonus;

var config int PrimeChokeDisorientedTurns;
var config int PrimeChokeDisorientedChance;
var config int PrimeChokeMinResultForWeakDamage;
var config int PrimeChokeMaxResultForWeakDamage;
var config int PrimeChokeMinResultForBaseDamage;
var config int PrimeChokeMaxResultForBaseDamage;
var config int PrimeChokeMinResultForStrongDamage;
var config int PrimeChokeMaxResultForStrongDamage;
var config int PrimeChokeMinResultForUnconscious;
var config WeaponDamageValue PrimeChoke_WeakDamage;
var config WeaponDamageValue PrimeChoke_BaseDamage;
var config WeaponDamageValue PrimeChoke_StrongDamage;

var config int PrimeSubdueDisorientedTurns;
var config int PrimeSubdueMinResultForDisoriented;
var config int PrimeSubdueMaxResultForDisoriented;
var config int PrimeSubdueStrongDisorientedTurns;
var config int PrimeSubdueMinResultForStrongDisoriented;
var config int PrimeSubdueMaxResultForStrongDisoriented;
var config int PrimeSubdueStunnedTurns;
var config int PrimeSubdueMinResultForStunned;
var config int PrimeSubdueMaxResultForStunned;
var config int PrimeSubdueMinResultForUnconscious;

var config float ElitePullMinRange;
var config float ElitePullMaxRange;
var config int ElitePullCooldown;
var config bool ElitePullBlockedByHighCover;
var config int ElitePullBonusHitChance;

var config int EliteChokeStrengthBonus;
var config int EliteSubdueStrengthBonus;

var config int EliteChokeDisorientedTurns;
var config int EliteChokeDisorientedChance;
var config int EliteChokeMinResultForWeakDamage;
var config int EliteChokeMaxResultForWeakDamage;
var config int EliteChokeMinResultForBaseDamage;
var config int EliteChokeMaxResultForBaseDamage;
var config int EliteChokeMinResultForStrongDamage;
var config int EliteChokeMaxResultForStrongDamage;
var config int EliteChokeMinResultForUnconscious;
var config WeaponDamageValue EliteChoke_WeakDamage;
var config WeaponDamageValue EliteChoke_BaseDamage;
var config WeaponDamageValue EliteChoke_StrongDamage;

var config int EliteSubdueDisorientedTurns;
var config int EliteSubdueMinResultForDisoriented;
var config int EliteSubdueMaxResultForDisoriented;
var config int EliteSubdueStrongDisorientedTurns;
var config int EliteSubdueMinResultForStrongDisoriented;
var config int EliteSubdueMaxResultForStrongDisoriented;
var config int EliteSubdueStunnedTurns;
var config int EliteSubdueMinResultForStunned;
var config int EliteSubdueMaxResultForStunned;
var config int EliteSubdueMinResultForUnconscious;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(BiteAbilityTemplate('BoaBite', default.BoaBiteCost, default.BoaBiteEndsTurn, default.BoaBiteCooldown));
	Templates.AddItem(BoaRushAndBind());
	Templates.AddItem(AdderRushAndBind());

	Templates.AddItem(BoaGetOverHere_VW());
	Templates.AddItem(PrimeGetOverHere_VW());
	Templates.AddItem(EliteGetOverHere_VW());

	Templates.AddItem(BoaBindSustainedCrush());
	Templates.AddItem(PrimeBindSustainedChoke());
	Templates.AddItem(EliteBindSustainedChoke());

	Templates.AddItem(BoaBindSustainedSubdue());
	Templates.AddItem(PrimeBindSustainedSubdue());
	Templates.AddItem(EliteBindSustainedSubdue());

	return Templates;
}

static function X2AbilityTemplate BiteAbilityTemplate(name TemplateName, int BiteCost, bool BiteEndsTurn, int BiteCooldown)
{
	local X2AbilityTemplate						Template;
	local X2AbilityCooldown  					Cooldown;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		StandardMelee;
	local X2Effect_ApplyWeaponDamage			DamageEffect;
	local array<name> SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_Bite";
	Template.ShotHUDPriority = 1;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.bCrossClassEligible = false;
	Template.bDisplayInUITooltip = true;
    Template.bDisplayInUITacticalText = true;
    Template.DisplayTargetHitChance = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = BiteCost;
	ActionPointCost.bConsumeAllPoints = BiteEndsTurn;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = BiteCooldown;
	Template.AbilityCooldown = Cooldown;

	StandardMelee = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = StandardMelee;
	Template.AbilityTargetStyle = new class'X2AbilityTarget_MovingMelee';
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);
	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(DamageEffect);

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipExitCoverWhenFiring = false;
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;	
	Template.CustomFireAnim = 'FF_BiteNormal';
	Template.CinescriptCameraType = "Viper_BiteAttack";
	Template.ActivationSpeech = 'ArcThrower';
	Template.SourceMissSpeech = 'SwordMiss';

	return Template;
}

static function SetupSharedPullAbilityData(out X2AbilityTemplate Template)
{
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2Condition_UnblockedNeighborTile UnblockedNeighborTileCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_GetOverHere				PullEffect;
	local X2Effect_GrantActionPoints        PullActionPointsEffect;

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;

	// Source cannot be dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

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
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// AP to pull a enemy
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	ActionPointCost.bFreeCost = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	// Standard animation for pulling enemies
	PullEffect = new class'X2Effect_GetOverHere';
	Template.AddTargetEffect(PullEffect);

	// The shooter gets a free point from pulling an enemy
	PullActionPointsEffect = new class'X2Effect_GrantActionPoints';
	PullActionPointsEffect.NumActionPoints = 1;
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
}

static function X2AbilityTemplate BoaGetOverHere_VW()
{
	local X2AbilityTemplate                 Template;
	local X2Condition_UnitProperty          UnitDistanceCondition;
	local X2AbilityCooldown  				Cooldown;
	local X2Condition_TargetIsHighCovered	CoverCondition;
	local X2AbilityToHitCalc_StandardAim    Pull;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BoaGetOverHere_VW');
	SetupSharedPullAbilityData(Template);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_getoverhere";

	Template.AdditionalAbilities.AddItem('BoaRushAndBind');
	Template.AdditionalAbilities.AddItem('BoaBindSustainedCrush');
	Template.AdditionalAbilities.AddItem('BoaBindSustainedSubdue');

	// The target must be alive and a humanoid and an enemy
	UnitDistanceCondition = new class'X2Condition_UnitProperty';
	UnitDistanceCondition.RequireWithinMinRange = true;
	UnitDistanceCondition.WithinMinRange = default.BoaPullMinRange;
	UnitDistanceCondition.RequireWithinRange = true;
	UnitDistanceCondition.WithinRange = default.BoaPullMaxRange;
	Template.AbilityTargetConditions.AddItem(UnitDistanceCondition);

	// Cooldown from pulling an enemy
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BoaPullCooldown;
	Template.AbilityCooldown = Cooldown;

	// Cannot pull an enemy out of high cover, unless flanking them
	CoverCondition = new class'X2Condition_TargetIsHighCovered';
	CoverCondition.bBlockedByHighCover = default.BoaPullBlockedByHighCover;
	Template.AbilityTargetConditions.AddItem(CoverCondition);

	// Standard aim roll for pulling enemies
	Pull = new class'X2AbilityToHitCalc_StandardAim';
	Pull.BuiltInHitMod = default.BoaPullBonusHitChance;
	Template.AbilityToHitCalc = Pull;

	return Template;
}

static function X2AbilityTemplate PrimeGetOverHere_VW()
{
	local X2AbilityTemplate                 Template;
	local X2Condition_UnitProperty          UnitDistanceCondition;
	local X2AbilityCooldown  				Cooldown;
	local X2Condition_TargetIsHighCovered	CoverCondition;
	local X2AbilityToHitCalc_StandardAim    Pull;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PrimeGetOverHere_VW');
	SetupSharedPullAbilityData(Template);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_getoverhere";

	Template.AdditionalAbilities.AddItem('PrimeBindSustainedChoke');
	Template.AdditionalAbilities.AddItem('PrimeBindSustainedSubdue');

	// The target must be alive and a humanoid and an enemy
	UnitDistanceCondition = new class'X2Condition_UnitProperty';
	UnitDistanceCondition.RequireWithinMinRange = true;
	UnitDistanceCondition.WithinMinRange = default.PrimePullMinRange;
	UnitDistanceCondition.RequireWithinRange = true;
	UnitDistanceCondition.WithinRange = default.PrimePullMaxRange;
	Template.AbilityTargetConditions.AddItem(UnitDistanceCondition);

	// Cooldown from pulling an enemy
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PrimePullCooldown;
	Template.AbilityCooldown = Cooldown;

	// Cannot pull an enemy out of high cover, unless flanking them
	CoverCondition = new class'X2Condition_TargetIsHighCovered';
	CoverCondition.bBlockedByHighCover = default.PrimePullBlockedByHighCover;
	Template.AbilityTargetConditions.AddItem(CoverCondition);

	// Standard aim roll for pulling enemies
	Pull = new class'X2AbilityToHitCalc_StandardAim';
	Pull.BuiltInHitMod = default.PrimePullBonusHitChance;
	Template.AbilityToHitCalc = Pull;

	return Template;
}

static function X2AbilityTemplate EliteGetOverHere_VW()
{
	local X2AbilityTemplate                 Template;
	local X2Condition_UnitProperty          UnitDistanceCondition;
	local X2AbilityCooldown  				Cooldown;
	local X2Condition_TargetIsHighCovered	CoverCondition;
	local X2AbilityToHitCalc_StandardAim    Pull;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'EliteGetOverHere_VW');
	SetupSharedPullAbilityData(Template);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_getoverhere";

	Template.AdditionalAbilities.AddItem('EliteBindSustainedChoke');
	Template.AdditionalAbilities.AddItem('EliteBindSustainedSubdue');

	// The target must be alive and a humanoid and an enemy
	UnitDistanceCondition = new class'X2Condition_UnitProperty';
	UnitDistanceCondition.RequireWithinMinRange = true;
	UnitDistanceCondition.WithinMinRange = default.ElitePullMinRange;
	UnitDistanceCondition.RequireWithinRange = true;
	UnitDistanceCondition.WithinRange = default.ElitePullMaxRange;
	Template.AbilityTargetConditions.AddItem(UnitDistanceCondition);

	// Cooldown from pulling an enemy
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.ElitePullCooldown;
	Template.AbilityCooldown = Cooldown;

	// Cannot pull an enemy out of high cover, unless flanking them
	CoverCondition = new class'X2Condition_TargetIsHighCovered';
	CoverCondition.bBlockedByHighCover = default.ElitePullBlockedByHighCover;
	Template.AbilityTargetConditions.AddItem(CoverCondition);

	// Standard aim roll for pulling enemies
	Pull = new class'X2AbilityToHitCalc_StandardAim';
	Pull.BuiltInHitMod = default.ElitePullBonusHitChance;
	Template.AbilityToHitCalc = Pull;

	return Template;
}

static function X2AbilityTemplate AdderRushAndBind()
{
	local X2AbilityTemplate                 	Template;
	local X2AbilityCost_ActionPoints        	ActionPointCost;
	local X2Condition_UnitProperty          	UnitPropertyCondition;
	local X2Condition_UnitEffects           	UnitEffectsCondition;
	local X2AbilityCooldown						Cooldown;
	local X2Effect_ImmediateAbilityActivation 	BindAbilityEffect;
	local X2Effect_GrantActionPoints        	ActionPointsEffect;
	local X2AbilityTarget_MovingMelee			MeleeTarget;
	local X2Condition_UnitType					UnitTypeCondition;
	local X2Condition_UnitTemplateCheck			ExcudeCharacterCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AdderRushAndBind');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.AdditionalAbilities.AddItem('AdderBindSustainedCrush');
	Template.AdditionalAbilities.AddItem('AdderBindSustainedSubdue');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
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

	UnitTypeCondition = new class'X2Condition_UnitType';
	UnitTypeCondition.ExcludeTypes.AddItem('ChosenAssassin');
	UnitTypeCondition.ExcludeTypes.AddItem('ChosenWarlock');
	UnitTypeCondition.ExcludeTypes.AddItem('ChosenSniper');
	UnitTypeCondition.ExcludeTypes.AddItem('PsiZombie');
	UnitTypeCondition.ExcludeTypes.AddItem('SpectralZombie');
	UnitTypeCondition.ExcludeTypes.AddItem('TheLost');
	UnitTypeCondition.ExcludeTypes.AddItem('BioLost');
	UnitTypeCondition.ExcludeTypes.AddItem('LostZombieHuman');
	UnitTypeCondition.ExcludeTypes.AddItem('TheLostBruiser');
	Template.AbilityTargetConditions.AddItem(UnitTypeCondition);

	ExcudeCharacterCondition = new class'X2Condition_UnitTemplateCheck';
	ExcudeCharacterCondition.ExcludeTypes = class'X2Ability_ViperWeapons'.default.CharactersThatCanNotBeBound;
	Template.AbilityTargetConditions.AddItem(ExcudeCharacterCondition);

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
	BindAbilityEffect.AbilityName = 'Bind';
	BindAbilityEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(BindAbilityEffect);

	// The shooter gets a free point that can be used bind
	ActionPointsEffect = new class'X2Effect_GrantActionPoints';
	ActionPointsEffect.NumActionPoints = 1;
	Template.AddShooterEffect(ActionPointsEffect);

	Template.bAllowBonusWeaponEffects = false;

	//Template.CustomFireAnim = 'FF_Melee';
	Template.bSkipFireAction = true;
	Template.bSkipMoveStop = false;

	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	return Template;
}

static function X2AbilityTemplate BoaRushAndBind()
{
	local X2AbilityTemplate                 	Template;
	local X2AbilityCost_ActionPoints        	ActionPointCost;
	local X2Condition_UnitProperty          	UnitPropertyCondition;
	local X2Condition_UnitEffects           	UnitEffectsCondition;
	local X2AbilityCooldown						Cooldown;
	local X2Effect_ImmediateAbilityActivation 	BindAbilityEffect;
	local X2Effect_GrantActionPoints        	ActionPointsEffect;
	local X2AbilityTarget_MovingMelee			MeleeTarget;
	local X2Condition_UnitType					UnitTypeCondition;
	local X2Condition_UnitTemplateCheck			ExcudeCharacterCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BoaRushAndBind');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.AdditionalAbilities.AddItem('AdderBindSustainedCrush');
	Template.AdditionalAbilities.AddItem('AdderBindSustainedSubdue');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
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

	UnitTypeCondition = new class'X2Condition_UnitType';
	UnitTypeCondition.ExcludeTypes.AddItem('ChosenAssassin');
	UnitTypeCondition.ExcludeTypes.AddItem('ChosenWarlock');
	UnitTypeCondition.ExcludeTypes.AddItem('ChosenSniper');
	UnitTypeCondition.ExcludeTypes.AddItem('PsiZombie');
	UnitTypeCondition.ExcludeTypes.AddItem('SpectralZombie');
	UnitTypeCondition.ExcludeTypes.AddItem('TheLost');
	UnitTypeCondition.ExcludeTypes.AddItem('BioLost');
	UnitTypeCondition.ExcludeTypes.AddItem('LostZombieHuman');
	UnitTypeCondition.ExcludeTypes.AddItem('TheLostBruiser');
	Template.AbilityTargetConditions.AddItem(UnitTypeCondition);

	ExcudeCharacterCondition = new class'X2Condition_UnitTemplateCheck';
	ExcudeCharacterCondition.ExcludeTypes = class'X2Ability_ViperWeapons'.default.CharactersThatCanNotBeBound;
	Template.AbilityTargetConditions.AddItem(ExcudeCharacterCondition);

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
	BindAbilityEffect.AbilityName = 'Bind';
	BindAbilityEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(BindAbilityEffect);

	// The shooter gets a free point that can be used bind
	ActionPointsEffect = new class'X2Effect_GrantActionPoints';
	ActionPointsEffect.NumActionPoints = 1;
	Template.AddShooterEffect(ActionPointsEffect);

	Template.bAllowBonusWeaponEffects = false;

	//Template.CustomFireAnim = 'FF_Melee';
	Template.bSkipFireAction = true;
	Template.bSkipMoveStop = false;

	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	return Template;
}

static function X2AbilityTemplate BoaBindSustainedCrush()
{
	local X2AbilityTemplate                 		Template;
	local X2AbilityTrigger_PlayerInput  			InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource 	UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        		ActionPointCost;
	local X2AbilityTarget_Single            		SingleTarget;
	local X2Effect_ApplyWeaponDamage       			PhysicalDamageEffect;
	local X2Effect_ImmediateAbilityActivation       RemoveBind;
	local X2AbilityCooldown                 		Cooldown;
	local AdditionalCooldownInfo 					SubdueCooldown;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit 	StatCheck;
	local X2Condition_UnitTemplateCheck				ExcudeCharacterCondition;
	local X2Condition_UnitType						ExcludeCharacterGroupCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BoaBindSustainedCrush');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindCrush";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 1;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 0;

	SubdueCooldown.AbilityName = 'BoaBindSustainedSubdue';
	SubdueCooldown.NumTurns = 0;
	Cooldown.AditionalAbilityCooldowns.AddItem(SubdueCooldown);
	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.BoaCrushStrengthBonus - class'X2Ability_ViperWeapons'.default.BoaBindStrength;
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
	RemoveBind.AbilityName = 'EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Deal small damage on 2-3 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.BoaCrush_WeakDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.BoaCrushMinResultForWeakDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.BoaCrushMaxResultForWeakDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal damage on 4-5 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.BoaCrush_BaseDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.BoaCrushMinResultForBaseDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.BoaCrushMaxResultForBaseDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal big damage on 6+ unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.BoaCrush_StrongDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.BoaCrushMinResultForStrongDamage;
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
    MinDamagePreview = default.BoaCrush_WeakDamage;
    MaxDamagePreview = default.BoaCrush_StrongDamage;

    return true;
}

static function X2AbilityTemplate PrimeBindSustainedChoke()
{
	local X2AbilityTemplate                 		Template;
	local X2AbilityTrigger_PlayerInput  			InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource 	UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        		ActionPointCost;
	local X2AbilityTarget_Single            		SingleTarget;
	local X2Effect_ApplyWeaponDamage        		PhysicalDamageEffect;
	local X2Effect_ImmediateAbilityActivation       RemoveBind;
	local X2Effect_Persistent               		UnconsciousEffect;
	local X2Condition_UnitEffects           		UnconsciousEffectsCondition;
	local X2Effect_PersistentStatChange 			DisorientedEffect;
	local X2AbilityCooldown                 		Cooldown;
	local AdditionalCooldownInfo 					SubdueCooldown;
	local X2Effect_Stunned							StunnedEffect;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit 	StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PrimeBindSustainedChoke');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindChoke";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 3;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;

	SubdueCooldown.AbilityName = 'PrimeBindSustainedSubdue';
	SubdueCooldown.NumTurns = 1;
	Cooldown.AditionalAbilityCooldowns.AddItem(SubdueCooldown);
	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.PrimeChokeStrengthBonus - class'X2Ability_ViperWeapons'.default.PrimeBindStrength;
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
	RemoveBind.AbilityName = 'EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Chance for Disoriented to proc on choke
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.PrimeChokeDisorientedTurns;
	DisorientedEffect.ApplyChance = default.PrimeChokeDisorientedChance;
	Template.AddTargetEffect(DisorientedEffect);

	// Deal small damage on 2-3 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.PrimeChoke_WeakDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.PrimeChokeMinResultForWeakDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.PrimeChokeMaxResultForWeakDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal damage on 4-5 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.PrimeChoke_BaseDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.PrimeChokeMinResultForBaseDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.PrimeChokeMaxResultForBaseDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal big damage on 6-7 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.PrimeChoke_StrongDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.PrimeChokeMinResultForStrongDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.PrimeChokeMaxResultForStrongDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);
	
	// K.O on 8+ unblocked str hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = default.PrimeChokeMinResultForUnconscious;
	StunnedEffect.MaxStatContestResult = 0;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);

	// K.O on 8+ unblocked str hit
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = default.PrimeChokeMinResultForUnconscious;
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
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.DamagePreviewFn = ChokeDamagePreview;

	Template.SourceMissSpeech = 'HackTurretSuccess';

	return Template;
}

function bool ChokeDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
    MinDamagePreview = default.PrimeChoke_WeakDamage;
    MaxDamagePreview = default.PrimeChoke_StrongDamage;

    return true;
}

static function X2AbilityTemplate EliteBindSustainedChoke()
{
	local X2AbilityTemplate                 		Template;
	local X2AbilityTrigger_PlayerInput  			InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource 	UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        		ActionPointCost;
	local X2AbilityTarget_Single            		SingleTarget;
	local X2Effect_ApplyWeaponDamage        		PhysicalDamageEffect;
	local X2Effect_ImmediateAbilityActivation       RemoveBind;
	local X2Effect_Persistent               		UnconsciousEffect;
	local X2Condition_UnitEffects           		UnconsciousEffectsCondition;
	local X2Effect_PersistentStatChange 			DisorientedEffect;
	local X2AbilityCooldown                 		Cooldown;
	local AdditionalCooldownInfo 					SubdueCooldown;
	local X2Effect_Stunned							StunnedEffect;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit 	StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'EliteBindSustainedChoke');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindChoke";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 3;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;

	SubdueCooldown.AbilityName = 'EliteBindSustainedSubdue';
	SubdueCooldown.NumTurns = 1;
	Cooldown.AditionalAbilityCooldowns.AddItem(SubdueCooldown);
	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.EliteChokeStrengthBonus - class'X2Ability_ViperWeapons'.default.EliteBindStrength;
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
	RemoveBind.AbilityName = 'EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Chance for Disoriented to proc on choke
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.EliteChokeDisorientedTurns;
	DisorientedEffect.ApplyChance = default.EliteChokeDisorientedChance;
	Template.AddTargetEffect(DisorientedEffect);

	// Deal small damage on 2-3 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.EliteChoke_WeakDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.EliteChokeMinResultForWeakDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.EliteChokeMaxResultForWeakDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal damage on 4-5 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.EliteChoke_BaseDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.EliteChokeMinResultForBaseDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.EliteChokeMaxResultForBaseDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Deal big damage on 6-7 unblocked str hit
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.EliteChoke_StrongDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.MinStatContestResult = default.EliteChokeMinResultForStrongDamage;
	PhysicalDamageEffect.MaxStatContestResult = default.EliteChokeMaxResultForStrongDamage;
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);
	
	// K.O on 8+ unblocked str hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = default.EliteChokeMinResultForUnconscious;
	StunnedEffect.MaxStatContestResult = 0;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);

	// K.O on 8+ unblocked str hit
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = default.EliteChokeMinResultForUnconscious;
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
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.DamagePreviewFn = EliteChokeDamagePreview;

	Template.SourceMissSpeech = 'HackTurretSuccess';

	return Template;
}

function bool EliteChokeDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
    MinDamagePreview = default.EliteChoke_WeakDamage;
    MaxDamagePreview = default.EliteChoke_StrongDamage;

    return true;
}

static function X2AbilityTemplate BoaBindSustainedSubdue()
{
	local X2AbilityTemplate                 		Template;
	local X2AbilityTrigger_PlayerInput  			InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource 	UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        		ActionPointCost;
	local X2AbilityTarget_Single            		SingleTarget;
	local X2Effect_PersistentStatChange 			DisorientedEffect;
	local X2Effect_Stunned							StunnedEffect;
	local X2Effect_Persistent               		UnconsciousEffect;
	local X2Effect_ImmediateAbilityActivation       RemoveBind;
	local X2AbilityCooldown                 		Cooldown;
	local AdditionalCooldownInfo 					CrushCooldown;
	local X2Condition_UnitEffects           		UnconsciousEffectsCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit 	StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BoaBindSustainedSubdue');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindSubdue";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 2;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 0;

	CrushCooldown.AbilityName = 'BoaBindSustainedCrush';
	CrushCooldown.NumTurns = 0;
	Cooldown.AditionalAbilityCooldowns.AddItem(CrushCooldown);
	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.BoaSubdueStrengthBonus - class'X2Ability_ViperWeapons'.default.BoaBindStrength;
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
	RemoveBind.AbilityName = 'EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Disorientate on 2-3 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.BoaSubdueDisorientedTurns;
	DisorientedEffect.MinStatContestResult = default.BoaSubdueMinResultForDisoriented;
	DisorientedEffect.MaxStatContestResult = default.BoaSubdueMaxResultForDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Disorientate longer on 4 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.BoaSubdueStrongDisorientedTurns;
	DisorientedEffect.MinStatContestResult = default.BoaSubdueMinResultForStrongDisoriented;
	DisorientedEffect.MaxStatContestResult = default.BoaSubdueMaxResultForStrongDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Stun on 5-7 unblocked str hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.BoaSubdueStunnedTurns, 100, false);
	StunnedEffect.MinStatContestResult = default.BoaSubdueMinResultForStunned;
	StunnedEffect.MaxStatContestResult = default.BoaSubdueMaxResultForStunned;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);

	// K.O on 8+ unblocked str hit (Stun)
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = default.BoaSubdueMinResultForUnconscious;
	StunnedEffect.MaxStatContestResult = 0;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);
	
	// K.O on 8+ unblocked str hit (Unconscious)
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = default.BoaSubdueMinResultForUnconscious;
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
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.SourceMissSpeech = 'HackTurretSuccess';

	return Template;
}

static function X2AbilityTemplate PrimeBindSustainedSubdue()
{
	local X2AbilityTemplate                 		Template;
	local X2AbilityTrigger_PlayerInput  			InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource 	UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        		ActionPointCost;
	local X2AbilityTarget_Single            		SingleTarget;
	local X2Effect_PersistentStatChange 			DisorientedEffect;
	local X2Effect_Stunned							StunnedEffect;
	local X2Effect_Persistent               		UnconsciousEffect;
	local X2Effect_ImmediateAbilityActivation       RemoveBind;
	local X2AbilityCooldown                 		Cooldown;
	local AdditionalCooldownInfo 					ChokeCooldown;
	local X2Condition_UnitEffects           		UnconsciousEffectsCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit 	StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PrimeBindSustainedSubdue');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindSubdue";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 2;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;

	ChokeCooldown.AbilityName = 'VW_BindSustainedChoke';
	ChokeCooldown.NumTurns = 1;
	Cooldown.AditionalAbilityCooldowns.AddItem(ChokeCooldown);
	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.PrimeSubdueStrengthBonus - class'X2Ability_ViperWeapons'.default.PrimeBindStrength;
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
	RemoveBind.AbilityName = 'EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Disorientate on 2-3 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.PrimeSubdueDisorientedTurns;
	DisorientedEffect.MinStatContestResult = default.PrimeSubdueMinResultForDisoriented;
	DisorientedEffect.MaxStatContestResult = default.PrimeSubdueMaxResultForDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Disorientate longer on 4 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.PrimeSubdueStrongDisorientedTurns;
	DisorientedEffect.MinStatContestResult = default.PrimeSubdueMinResultForStrongDisoriented;
	DisorientedEffect.MaxStatContestResult = default.PrimeSubdueMaxResultForStrongDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Stun on 5-7 unblocked str hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.PrimeSubdueStunnedTurns, 100, false);
	StunnedEffect.MinStatContestResult = default.PrimeSubdueMinResultForStunned;
	StunnedEffect.MaxStatContestResult = default.PrimeSubdueMaxResultForStunned;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);

	// K.O on 8+ unblocked str hit (Stun)
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = default.PrimeSubdueMinResultForUnconscious;
	StunnedEffect.MaxStatContestResult = 0;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);
	
	// K.O on 8+ unblocked str hit (Unconscious)
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = default.PrimeSubdueMinResultForUnconscious;
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
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.SourceMissSpeech = 'HackTurretSuccess';

	return Template;
}

static function X2AbilityTemplate EliteBindSustainedSubdue()
{
	local X2AbilityTemplate                 		Template;
	local X2AbilityTrigger_PlayerInput  			InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource 	UnitEffectsCondition;
	local X2AbilityCost_ActionPoints        		ActionPointCost;
	local X2AbilityTarget_Single            		SingleTarget;
	local X2Effect_PersistentStatChange 			DisorientedEffect;
	local X2Effect_Stunned							StunnedEffect;
	local X2Effect_Persistent               		UnconsciousEffect;
	local X2Effect_ImmediateAbilityActivation       RemoveBind;
	local X2AbilityCooldown                 		Cooldown;
	local AdditionalCooldownInfo 					ChokeCooldown;
	local X2Condition_UnitEffects           		UnconsciousEffectsCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit 	StatCheck;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'EliteBindSustainedSubdue');
	Template.IconImage = "img:///UILibrary_Viper.UIPerk_BindSubdue";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = 2;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;

	ChokeCooldown.AbilityName = 'VW_BindSustainedChoke';
	ChokeCooldown.NumTurns = 1;
	Cooldown.AditionalAbilityCooldowns.AddItem(ChokeCooldown);
	Template.AbilityCooldown = Cooldown;

	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.AttackerStat = eStat_Strength;
	StatCheck.DefenderStat = eStat_Strength;
	StatCheck.BaseValue = default.EliteSubdueStrengthBonus - class'X2Ability_ViperWeapons'.default.EliteBindStrength;
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
	RemoveBind.AbilityName = 'EndBind';
	RemoveBind.bApplyOnMiss = true;
	RemoveBind.bApplyOnHit = false;
	Template.AddTargetEffect(RemoveBind);

	// Disorientate on 2-3 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.EliteSubdueDisorientedTurns;
	DisorientedEffect.MinStatContestResult = default.EliteSubdueMinResultForDisoriented;
	DisorientedEffect.MaxStatContestResult = default.EliteSubdueMaxResultForDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Disorientate longer on 4 unblocked str hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect();
	DisorientedEffect.iNumTurns = default.EliteSubdueStrongDisorientedTurns;
	DisorientedEffect.MinStatContestResult = default.EliteSubdueMinResultForStrongDisoriented;
	DisorientedEffect.MaxStatContestResult = default.EliteSubdueMaxResultForStrongDisoriented;
	DisorientedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(DisorientedEffect);

	// Stun on 5-7 unblocked str hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.EliteSubdueStunnedTurns, 100, false);
	StunnedEffect.MinStatContestResult = default.EliteSubdueMinResultForStunned;
	StunnedEffect.MaxStatContestResult = default.EliteSubdueMaxResultForStunned;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);

	// K.O on 8+ unblocked str hit (Stun)
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = default.EliteSubdueMinResultForUnconscious;
	StunnedEffect.MaxStatContestResult = 0;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(StunnedEffect);
	
	// K.O on 8+ unblocked str hit (Unconscious)
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = default.EliteSubdueMinResultForUnconscious;
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
	Template.BuildVisualizationFn = class'X2Ability_ViperWeapons'.static.BindSustained_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.SourceMissSpeech = 'HackTurretSuccess';

	return Template;
}