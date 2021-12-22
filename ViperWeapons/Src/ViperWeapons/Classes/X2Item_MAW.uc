class X2Item_MAW extends X2Item config(ViperMAWConfig);

var config int MAW_I_Range;
var config int MAW_II_Range;
var config int MAW_III_Range;

var config int MAW_I_Radius;
var config int MAW_II_Radius;
var config int MAW_III_Radius;

var config int Acid_RadiusModifier;
var config int Electric_RadiusModifier;
var config int Fire_RadiusModifier;
var config int Heal_RadiusModifier;
var config int Ice_RadiusModifier;
var config int Poison_RadiusModifier;

var config int MAW_I_Accuracy;
var config int MAW_II_Accuracy;
var config int MAW_III_Accuracy;

var config int MAW_I_CritChance;
var config int MAW_II_CritChance;
var config int MAW_III_CritChance;

var config int MAW_I_Strength;
var config int MAW_II_Strength;
var config int MAW_III_Strength;


var config WeaponDamageValue Neutral_BiteDamage;

var config WeaponDamageValue Poison_I_BiteDamage;
var config WeaponDamageValue Poison_II_BiteDamage;
var config WeaponDamageValue Poison_III_BiteDamage;

var config WeaponDamageValue Acid_I_BiteDamage;
var config WeaponDamageValue Acid_II_BiteDamage;
var config WeaponDamageValue Acid_III_BiteDamage;

var config WeaponDamageValue Heal_I_BiteDamage;
var config WeaponDamageValue Heal_II_BiteDamage;
var config WeaponDamageValue Heal_III_BiteDamage;

var config WeaponDamageValue Electric_I_BiteDamage;
var config WeaponDamageValue Electric_II_BiteDamage;
var config WeaponDamageValue Electric_III_BiteDamage;

var config WeaponDamageValue Fire_I_BiteDamage;
var config WeaponDamageValue Fire_II_BiteDamage;
var config WeaponDamageValue Fire_III_BiteDamage;

var config WeaponDamageValue Ice_I_BiteDamage;
var config WeaponDamageValue Ice_II_BiteDamage;
var config WeaponDamageValue Ice_III_BiteDamage;


var config array<name> Poison_I_Cost_Type;
var config array<name> Poison_II_Cost_Type;
var config array<name> Poison_III_Cost_Type;

var config array<name> Acid_I_Cost_Type;
var config array<name> Acid_II_Cost_Type;
var config array<name> Acid_III_Cost_Type;

var config array<name> Heal_I_Cost_Type;
var config array<name> Heal_II_Cost_Type;
var config array<name> Heal_III_Cost_Type;

var config array<name> Electric_I_Cost_Type;
var config array<name> Electric_II_Cost_Type;
var config array<name> Electric_III_Cost_Type;

var config array<name> Fire_I_Cost_Type;
var config array<name> Fire_II_Cost_Type;
var config array<name> Fire_III_Cost_Type;

var config array<name> Ice_I_Cost_Type;
var config array<name> Ice_II_Cost_Type;
var config array<name> Ice_III_Cost_Type;


var config array<int> Poison_I_Cost_Ammount;
var config array<int> Poison_II_Cost_Ammount;
var config array<int> Poison_III_Cost_Ammount;

var config array<int> Acid_I_Cost_Ammount;
var config array<int> Acid_II_Cost_Ammount;
var config array<int> Acid_III_Cost_Ammount;

var config array<int> Heal_I_Cost_Ammount;
var config array<int> Heal_II_Cost_Ammount;
var config array<int> Heal_III_Cost_Ammount;

var config array<int> Electric_I_Cost_Ammount;
var config array<int> Electric_II_Cost_Ammount;
var config array<int> Electric_III_Cost_Ammount;

var config array<int> Fire_I_Cost_Ammount;
var config array<int> Fire_II_Cost_Ammount;
var config array<int> Fire_III_Cost_Ammount;

var config array<int> Ice_I_Cost_Ammount;
var config array<int> Ice_II_Cost_Ammount;
var config array<int> Ice_III_Cost_Ammount;


var config array<name> Poison_I_RequiredResearch;
var config array<name> Poison_II_RequiredResearch;
var config array<name> Poison_III_RequiredResearch;

var config array<name> Acid_I_RequiredResearch;
var config array<name> Acid_II_RequiredResearch;
var config array<name> Acid_III_RequiredResearch;

var config array<name> Heal_I_RequiredResearch;
var config array<name> Heal_II_RequiredResearch;
var config array<name> Heal_III_RequiredResearch;

var config array<name> Electric_I_RequiredResearch;
var config array<name> Electric_II_RequiredResearch;
var config array<name> Electric_III_RequiredResearch;

var config array<name> Fire_I_RequiredResearch;
var config array<name> Fire_II_RequiredResearch;
var config array<name> Fire_III_RequiredResearch;

var config array<name> Ice_I_RequiredResearch;
var config array<name> Ice_II_RequiredResearch;
var config array<name> Ice_III_RequiredResearch;


var config int Poison_I_MarketValue;
var config int Poison_II_MarketValue;
var config int Poison_III_MarketValue;

var config int Acid_I_MarketValue;
var config int Acid_II_MarketValue;
var config int Acid_III_MarketValue;

var config int Heal_I_MarketValue;
var config int Heal_II_MarketValue;
var config int Heal_III_MarketValue;

var config int Electric_I_MarketValue;
var config int Electric_II_MarketValue;
var config int Electric_III_MarketValue;

var config int Fire_I_MarketValue;
var config int Fire_II_MarketValue;
var config int Fire_III_MarketValue;

var config int Ice_I_MarketValue;
var config int Ice_II_MarketValue;
var config int Ice_III_MarketValue;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(EmptyPrimaryViper());
	Weapons.AddItem(BoaWeapon());
	Weapons.AddItem(MAW_Neutral());

	Weapons.AddItem(MAW_I_Template('MAW_Poison_I', "UILibrary_Viper.UIInv_MAW_Poison_I", "WP_Viper_MAW.WP_Spit_Poison", 'MAW_PoisonBite_I', 'MAW_PoisonSpit_I', default.MAW_I_Range, default.Poison_RadiusModifier + default.MAW_I_Radius, default.Poison_I_BiteDamage, default.MAW_I_Accuracy, default.MAW_I_CritChance, default.Poison_I_Cost_Type, default.Poison_I_Cost_Ammount, default.Poison_I_RequiredResearch, default.Poison_I_MarketValue));
	Weapons.AddItem(MAW_II_Template('MAW_Poison_II', "UILibrary_Viper.UIInv_MAW_Poison_II", "WP_Viper_MAW.WP_Spit_Poison", 'MAW_PoisonBite_II', 'MAW_PoisonSpit_II', default.MAW_II_Range, default.Poison_RadiusModifier + default.MAW_II_Radius, default.Poison_II_BiteDamage, default.MAW_II_Accuracy, default.MAW_II_CritChance, default.Poison_II_Cost_Type, default.Poison_II_Cost_Ammount, default.Poison_II_RequiredResearch, default.Poison_II_MarketValue));
	Weapons.AddItem(MAW_III_Template('MAW_Poison_III', "UILibrary_Viper.UIInv_MAW_Poison_III", "WP_Viper_MAW.WP_Spit_Poison", 'MAW_PoisonBite_III', 'MAW_PoisonSpit_III', default.MAW_III_Range, default.Poison_RadiusModifier + default.MAW_III_Radius, default.Poison_III_BiteDamage, default.MAW_III_Accuracy, default.MAW_III_CritChance, default.Poison_III_Cost_Type, default.Poison_III_Cost_Ammount, default.Poison_III_RequiredResearch, default.Poison_III_MarketValue));
	
	Weapons.AddItem(MAW_I_Template('MAW_Acid_I', "UILibrary_Viper.UIInv_MAW_Acid_I", "WP_Viper_MAW.WP_Spit_Acid", 'MAW_AcidBite_I', 'MAW_AcidSpit_I', default.MAW_I_Range, default.Acid_RadiusModifier + default.MAW_I_Radius, default.Acid_I_BiteDamage, default.MAW_I_Accuracy, default.MAW_I_CritChance, default.Acid_I_Cost_Type, default.Acid_I_Cost_Ammount, default.Acid_I_RequiredResearch, default.Acid_I_MarketValue));
	Weapons.AddItem(MAW_II_Template('MAW_Acid_II', "UILibrary_Viper.UIInv_MAW_Acid_II", "WP_Viper_MAW.WP_Spit_Acid", 'MAW_AcidBite_II', 'MAW_AcidSpit_II', default.MAW_II_Range, default.Acid_RadiusModifier + default.MAW_II_Radius, default.Acid_II_BiteDamage, default.MAW_II_Accuracy, default.MAW_II_CritChance, default.Acid_II_Cost_Type, default.Acid_II_Cost_Ammount, default.Acid_II_RequiredResearch, default.Acid_II_MarketValue));
	Weapons.AddItem(MAW_III_Template('MAW_Acid_III', "UILibrary_Viper.UIInv_MAW_Acid_III", "WP_Viper_MAW.WP_Spit_Acid", 'MAW_AcidBite_III', 'MAW_AcidSpit_III', default.MAW_III_Range, default.Acid_RadiusModifier + default.MAW_III_Radius, default.Acid_III_BiteDamage, default.MAW_III_Accuracy, default.MAW_III_CritChance, default.Acid_III_Cost_Type, default.Acid_III_Cost_Ammount, default.Acid_III_RequiredResearch, default.Acid_III_MarketValue));
	
	Weapons.AddItem(MAW_I_Template('MAW_Heal_I', "UILibrary_Viper.UIInv_MAW_Heal_I", "WP_Viper_MAW.WP_Spit_Heal", 'MAW_HealBite_I', 'MAW_HealSpit_I', default.MAW_I_Range, default.Heal_RadiusModifier + default.MAW_I_Radius, default.Heal_I_BiteDamage, default.MAW_I_Accuracy, default.MAW_I_CritChance, default.Heal_I_Cost_Type, default.Heal_I_Cost_Ammount, default.Heal_I_RequiredResearch, default.Heal_I_MarketValue));
	Weapons.AddItem(MAW_II_Template('MAW_Heal_II', "UILibrary_Viper.UIInv_MAW_Heal_II", "WP_Viper_MAW.WP_Spit_Heal", 'MAW_HealBite_II', 'MAW_HealSpit_II', default.MAW_II_Range, default.Heal_RadiusModifier + default.MAW_II_Radius, default.Heal_II_BiteDamage, default.MAW_II_Accuracy, default.MAW_II_CritChance, default.Heal_II_Cost_Type, default.Heal_II_Cost_Ammount, default.Heal_II_RequiredResearch, default.Heal_II_MarketValue));
	Weapons.AddItem(MAW_III_Template('MAW_Heal_III', "UILibrary_Viper.UIInv_MAW_Heal_III", "WP_Viper_MAW.WP_Spit_Heal", 'MAW_HealBite_III', 'MAW_HealSpit_III', default.MAW_III_Range, default.Heal_RadiusModifier + default.MAW_III_Radius, default.Heal_III_BiteDamage, default.MAW_III_Accuracy, default.MAW_III_CritChance, default.Heal_III_Cost_Type, default.Heal_III_Cost_Ammount, default.Heal_III_RequiredResearch, default.Heal_III_MarketValue));
	
	Weapons.AddItem(MAW_I_Template('MAW_Electric_I', "UILibrary_Viper.UIInv_MAW_Electric_I", "WP_Viper_MAW.WP_Spit_Electric", 'MAW_ElectricBite_I', 'MAW_ElectricSpit_I', default.MAW_I_Range, default.Electric_RadiusModifier + default.MAW_I_Radius, default.Electric_I_BiteDamage, default.MAW_I_Accuracy, default.MAW_I_CritChance, default.Electric_I_Cost_Type, default.Electric_I_Cost_Ammount, default.Electric_I_RequiredResearch, default.Electric_I_MarketValue));
	Weapons.AddItem(MAW_II_Template('MAW_Electric_II', "UILibrary_Viper.UIInv_MAW_Electric_II", "WP_Viper_MAW.WP_Spit_Electric", 'MAW_ElectricBite_II', 'MAW_ElectricSpit_II', default.MAW_II_Range, default.Electric_RadiusModifier + default.MAW_II_Radius, default.Electric_II_BiteDamage, default.MAW_II_Accuracy, default.MAW_II_CritChance, default.Electric_II_Cost_Type, default.Electric_II_Cost_Ammount, default.Electric_II_RequiredResearch, default.Electric_II_MarketValue));
	Weapons.AddItem(MAW_III_Template('MAW_Electric_III', "UILibrary_Viper.UIInv_MAW_Electric_III", "WP_Viper_MAW.WP_Spit_Electric", 'MAW_ElectricBite_III', 'MAW_ElectricSpit_III', default.MAW_III_Range, default.Electric_RadiusModifier + default.MAW_III_Radius, default.Electric_III_BiteDamage, default.MAW_III_Accuracy, default.MAW_III_CritChance, default.Electric_III_Cost_Type, default.Electric_III_Cost_Ammount, default.Electric_III_RequiredResearch, default.Electric_III_MarketValue));
	
	Weapons.AddItem(MAW_I_Template('MAW_Fire_I', "UILibrary_Viper.UIInv_MAW_Fire_I", "WP_Viper_MAW.WP_Spit_Fire", 'MAW_FireBite_I', 'MAW_FireSpit_I', default.MAW_I_Range, default.Fire_RadiusModifier + default.MAW_I_Radius, default.Fire_I_BiteDamage, default.MAW_I_Accuracy, default.MAW_I_CritChance, default.Fire_I_Cost_Type, default.Fire_I_Cost_Ammount, default.Fire_I_RequiredResearch, default.Fire_I_MarketValue));
	Weapons.AddItem(MAW_II_Template('MAW_Fire_II', "UILibrary_Viper.UIInv_MAW_Fire_II", "WP_Viper_MAW.WP_Spit_Fire", 'MAW_FireBite_II', 'MAW_FireSpit_II', default.MAW_II_Range, default.Fire_RadiusModifier + default.MAW_II_Radius, default.Fire_II_BiteDamage, default.MAW_II_Accuracy, default.MAW_II_CritChance, default.Fire_II_Cost_Type, default.Fire_II_Cost_Ammount, default.Fire_II_RequiredResearch, default.Fire_II_MarketValue));
	Weapons.AddItem(MAW_III_Template('MAW_Fire_III', "UILibrary_Viper.UIInv_MAW_Fire_III", "WP_Viper_MAW.WP_Spit_Fire", 'MAW_FireBite_III', 'MAW_FireSpit_III', default.MAW_III_Range, default.Fire_RadiusModifier + default.MAW_III_Radius, default.Fire_III_BiteDamage, default.MAW_III_Accuracy, default.MAW_III_CritChance, default.Fire_III_Cost_Type, default.Fire_III_Cost_Ammount, default.Fire_III_RequiredResearch, default.Fire_III_MarketValue));
	
	Weapons.AddItem(MAW_I_Template('MAW_Ice_I', "UILibrary_Viper.UIInv_MAW_Ice_I", "WP_Viper_MAW.WP_Spit_Ice", 'MAW_IceBite_I', 'MAW_IceSpit_I', default.MAW_I_Range, default.Ice_RadiusModifier + default.MAW_I_Radius, default.Ice_I_BiteDamage, default.MAW_I_Accuracy, default.MAW_I_CritChance, default.Ice_I_Cost_Type, default.Ice_I_Cost_Ammount, default.Ice_I_RequiredResearch, default.Ice_I_MarketValue));
	Weapons.AddItem(MAW_II_Template('MAW_Ice_II', "UILibrary_Viper.UIInv_MAW_Ice_II", "WP_Viper_MAW.WP_Spit_Ice", 'MAW_IceBite_II', 'MAW_IceSpit_II', default.MAW_II_Range, default.Ice_RadiusModifier + default.MAW_II_Radius, default.Ice_II_BiteDamage, default.MAW_II_Accuracy, default.MAW_II_CritChance, default.Ice_II_Cost_Type, default.Ice_II_Cost_Ammount, default.Ice_II_RequiredResearch, default.Ice_II_MarketValue));
	Weapons.AddItem(MAW_III_Template('MAW_Ice_III', "UILibrary_Viper.UIInv_MAW_Ice_III", "WP_Viper_MAW.WP_Spit_Ice", 'MAW_IceBite_III', 'MAW_IceSpit_III', default.MAW_III_Range, default.Ice_RadiusModifier + default.MAW_III_Radius, default.Ice_III_BiteDamage, default.MAW_III_Accuracy, default.MAW_III_CritChance, default.Ice_III_Cost_Type, default.Ice_III_Cost_Ammount, default.Ice_III_RequiredResearch, default.Ice_III_MarketValue));
	
	return Weapons;
}

static function X2DataTemplate EmptyPrimaryViper()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'EmptyPrimaryViper');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Viper.Inv_Empty";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "";
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.NumUpgradeSlots = 0;

	Template.iRange = 1;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate BoaWeapon()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BoaWeapon');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Viper.Inv_Empty";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "";
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.NumUpgradeSlots = 0;

	Template.iRange = 1;

	Template.BaseDamage = class'X2Ability_ModdedViperPullAndBinds'.default.BoaBiteDamage;
	Template.Aim = class'X2Ability_ModdedViperPullAndBinds'.default.BoaBiteAccuracy;
	Template.CritChance = class'X2Ability_ModdedViperPullAndBinds'.default.BoaBiteCritChance;
	
	Template.Abilities.AddItem('BoaBite');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate MAW_Neutral()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MAW_Neutral');

	Template.ItemCat = 'utility';
	Template.WeaponCat = 'maw';
	Template.strImage = "img:///UILibrary_Viper.UIInv_MAW_Neutral";
	Template.EquipSound = "StrategyUI_Skulljack_Equip";
	Template.GameArchetype = "WP_Viper_MAW.WP_Spit_Poison";
	Template.TradingPostValue = 0;
	Template.iRange = default.MAW_I_Range;
	Template.iRadius = default.MAW_I_Radius;
	Template.Tier = -1;

	Template.iClipSize = 7;
	Template.InfiniteAmmo = true;
	Template.bHideClipSizeStat = true;
	Template.iSoundRange = 6;
	Template.bSoundOriginatesFromOwnerLocation = true;

	Template.InventorySlot = eInvSlot_ViperMAW;
	Template.StowedLocation = eSlot_None;

	Template.BaseDamage = default.Neutral_BiteDamage;
	Template.Aim = default.MAW_I_Accuracy;
	Template.CritChance = default.MAW_I_CritChance;

	Template.Abilities.AddItem('MAW_NeutralBite');
	Template.Abilities.AddItem('VW_GetOverHere');

	Template.WeaponPrecomputedPathData.InitialPathTime = 0.5;
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.0;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate MAW_I_Template(name TemplateName, string ImagePath, string TemplateArchetype, name BiteAbility, name SpitAbility, int Range, int Radius, WeaponDamageValue Damage, int Accuracy, int CritChance, array<name> RequiredResourcesType, array<int> RequiredResourcesAmmount, array<name> RequiredResearch, int BlackMarketValue)
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);

	Template.ItemCat = 'utility';
	Template.WeaponCat = 'maw';
    Template.strImage = "img:///" $ImagePath; 
	Template.EquipSound = "StrategyUI_Skulljack_Equip";
	Template.GameArchetype = TemplateArchetype;
	Template.TradingPostValue = BlackMarketValue;
	Template.iRange = Range;
	Template.iRadius = Radius;
	Template.Tier = 1;

	Template.iClipSize = 7;
	Template.InfiniteAmmo = true;
	Template.bHideClipSizeStat = true;
	Template.iSoundRange = 6;
	Template.bSoundOriginatesFromOwnerLocation = true;

	Template.InventorySlot = eInvSlot_ViperMAW;
	Template.StowedLocation = eSlot_None;

	Template.BaseDamage = Damage;
	Template.Aim = Accuracy;
	Template.CritChance = CritChance;

	Template.Abilities.AddItem(BiteAbility);
	Template.Abilities.AddItem(SpitAbility);
	Template.Abilities.AddItem('VW_GetOverHere');
	Template.Abilities.AddItem('Viper_MAW_I_Bonus');

	Template.WeaponPrecomputedPathData.InitialPathTime = 0.5;
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.0;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	
	for (i = 0; i < RequiredResourcesType.Length; i++)
	{
		if (RequiredResourcesAmmount[i] > 0)
		{
			Resources.ItemTemplateName = RequiredResourcesType[i];
			Resources.Quantity = RequiredResourcesAmmount[i];
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.Requirements.RequiredTechs = RequiredResearch;

	return Template;
}

static function X2DataTemplate MAW_II_Template(name TemplateName, string ImagePath, string TemplateArchetype, name BiteAbility, name SpitAbility, int Range, int Radius, WeaponDamageValue Damage, int Accuracy, int CritChance, array<name> RequiredResourcesType, array<int> RequiredResourcesAmmount, array<name> RequiredResearch, int BlackMarketValue)
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);

	Template.ItemCat = 'utility';
	Template.WeaponCat = 'maw';
    Template.strImage = "img:///" $ImagePath; 
	Template.EquipSound = "StrategyUI_Skulljack_Equip";
	Template.GameArchetype = TemplateArchetype;
	Template.TradingPostValue = BlackMarketValue;
	Template.iRange = Range;
	Template.iRadius = Radius;
	Template.Tier = 3;

	Template.iClipSize = 7;
	Template.InfiniteAmmo = true;
	Template.bHideClipSizeStat = true;
	Template.iSoundRange = 6;
	Template.bSoundOriginatesFromOwnerLocation = true;

	Template.InventorySlot = eInvSlot_ViperMAW;
	Template.StowedLocation = eSlot_None;

	Template.BaseDamage = Damage;
	Template.Aim = Accuracy;
	Template.CritChance = CritChance;

	Template.Abilities.AddItem(BiteAbility);
	Template.Abilities.AddItem(SpitAbility);
	Template.Abilities.AddItem('VW_GetOverHere');
	Template.Abilities.AddItem('Viper_MAW_II_Bonus');

	Template.WeaponPrecomputedPathData.InitialPathTime = 0.5;
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.0;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	
	for (i = 0; i < RequiredResourcesType.Length; i++)
	{
		if (RequiredResourcesAmmount[i] > 0)
		{
			Resources.ItemTemplateName = RequiredResourcesType[i];
			Resources.Quantity = RequiredResourcesAmmount[i];
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.Requirements.RequiredTechs = RequiredResearch;

	return Template;
}

static function X2DataTemplate MAW_III_Template(name TemplateName, string ImagePath, string TemplateArchetype, name BiteAbility, name SpitAbility, int Range, int Radius, WeaponDamageValue Damage, int Accuracy, int CritChance, array<name> RequiredResourcesType, array<int> RequiredResourcesAmmount, array<name> RequiredResearch, int BlackMarketValue)
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);

	Template.ItemCat = 'utility';
	Template.WeaponCat = 'maw';
    Template.strImage = "img:///" $ImagePath; 
	Template.EquipSound = "StrategyUI_Skulljack_Equip";
	Template.GameArchetype = TemplateArchetype;
	Template.TradingPostValue = BlackMarketValue;
	Template.iRange = Range;
	Template.iRadius = Radius;
	Template.Tier = 5;

	Template.iClipSize = 7;
	Template.InfiniteAmmo = true;
	Template.bHideClipSizeStat = true;
	Template.iSoundRange = 6;
	Template.bSoundOriginatesFromOwnerLocation = true;

	Template.InventorySlot = eInvSlot_ViperMAW;
	Template.StowedLocation = eSlot_None;

	Template.BaseDamage = Damage;
	Template.Aim = Accuracy;
	Template.CritChance = CritChance;

	Template.Abilities.AddItem(BiteAbility);
	Template.Abilities.AddItem(SpitAbility);
	Template.Abilities.AddItem('VW_GetOverHere');
	Template.Abilities.AddItem('Viper_MAW_III_Bonus');

	Template.WeaponPrecomputedPathData.InitialPathTime = 0.5;
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.0;
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0;

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	
	for (i = 0; i < RequiredResourcesType.Length; i++)
	{
		if (RequiredResourcesAmmount[i] > 0)
		{
			Resources.ItemTemplateName = RequiredResourcesType[i];
			Resources.Quantity = RequiredResourcesAmmount[i];
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.Requirements.RequiredTechs = RequiredResearch;

	return Template;
}