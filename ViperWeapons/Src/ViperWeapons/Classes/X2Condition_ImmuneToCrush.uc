//---------------------------------------------------------------------------------------
//  FILE:    X2Condition_Stealth.uc
//  AUTHOR:  Joshua Bouscher  --  2/5/2015
//  PURPOSE: Special condition for activating the Ranger Stealth ability.
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class X2Condition_ImmuneToCrush extends X2Condition;

event name CallMeetsCondition(XComGameState_BaseObject kTarget) 
{ 
	local XComGameState_ViperWeapons UnitState;

	UnitState = XComGameState_ViperWeapons(kTarget);

	if (UnitState == none)
		return 'AA_NotAUnit';

	if (UnitState.IsImmuneToCrush() || UnitState.IsViper())
		return 'AA_UnitIsImmune';

	return 'AA_Success'; 
}
