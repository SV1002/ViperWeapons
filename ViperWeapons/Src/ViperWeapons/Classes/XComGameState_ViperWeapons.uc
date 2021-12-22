//---------------------------------------------------------------------------------------
//  FILE:    X2Condition_Stealth.uc
//  AUTHOR:  Joshua Bouscher  --  2/5/2015
//  PURPOSE: Special condition for activating the Ranger Stealth ability.
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class XComGameState_ViperWeapons extends XComGameState_Unit;

simulated function bool IsImmuneToCrush()
{
	return IsImmuneToDamage('ViperCrush');
}

simulated function bool IsViper()
{
	return GetMyTemplateName() == 'Viper' || GetMyTemplateName() == 'ViperMP' || GetMyTemplateName() == 'ViperNeonate' || GetMyTemplateName() == 'ViperKing' || GetMyTemplateName() == 'ViperSoldier' || GetMyTemplateName() == 'ViperTemplarSoldier' || GetMyTemplateName() == 'ViperSoldierMP' || GetMyTemplateGroupName() == 'Viper' || GetMyTemplateGroupName() == 'ViperKing' || GetMyTemplateGroupName() == 'ViperNeonate';
}