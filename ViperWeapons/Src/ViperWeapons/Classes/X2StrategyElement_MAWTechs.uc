//---------------------------------------------------------------------------------------
//  FILE:    X2StrategyElement_MAWTechs.uc
//  AUTHOR:  Mr Danger Dude (Losu)  --  16/12/2021
//  PURPOSE: Create M.A.W tech templates
//---------------------------------------------------------------------------------------
class X2StrategyElement_MAWTechs extends X2StrategyElement config(ViperMAWConfig);

var config int MAW_I_PointsToComplete;
var config int MAW_II_PointsToComplete;
var config int MAW_III_PointsToComplete;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	// M.A.W Tier Unlocks
	Techs.AddItem(CreateMAWTech_I());
	Techs.AddItem(CreateMAWTech_II());
	Techs.AddItem(CreateMAWTech_III());

	return Techs;
}

// #######################################################################################
// -------------------- TECHS ---------------------------------------------------
// #######################################################################################

static function X2DataTemplate CreateMAWTech_I()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'MAWTech_I');
	Template.PointsToComplete = default.MAW_I_PointsToComplete;
	Template.strImage = "img:///UILibrary_Viper.Research_MAW_I";
	Template.bWeaponTech = true;
	Template.SortingTier = 2;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AlienBiotech');

	return Template;
}

static function X2DataTemplate CreateMAWTech_II()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'MAWTech_II');
	Template.PointsToComplete = default.MAW_II_PointsToComplete;
	Template.strImage = "img:///UILibrary_Viper.Research_MAW_II";
	Template.bWeaponTech = true;
	Template.SortingTier = 2;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MAWTech_I');
	Template.Requirements.RequiredTechs.AddItem('GaussWeapons');

	return Template;
}

static function X2DataTemplate CreateMAWTech_III()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'MAWTech_III');
	Template.PointsToComplete = default.MAW_III_PointsToComplete;
	Template.strImage = "img:///UILibrary_Viper.Research_MAW_II";
	Template.bWeaponTech = true;
	Template.SortingTier = 2;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MAWTech_II');
	Template.Requirements.RequiredTechs.AddItem('Tech_Elerium');

	return Template;
}