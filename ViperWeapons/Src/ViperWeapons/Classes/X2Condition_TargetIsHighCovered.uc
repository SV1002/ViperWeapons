//---------------------------------------------------------------------------------------
//  FILE:    X2Condition_Stealth.uc
//  AUTHOR:  Joshua Bouscher  --  2/5/2015
//  PURPOSE: Special condition for activating the Ranger Stealth ability.
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class X2Condition_TargetIsHighCovered extends X2Condition;

var bool bBlockedByHighCover;

event name CallMeetsConditionWithSource(XComGameState_BaseObject kTarget, XComGameState_BaseObject kSource)
{ 
	local XComGameState_Unit UnitState, ViperState;
	local GameRulesCache_VisibilityInfo CurrentVisibility;

	UnitState = XComGameState_Unit(kTarget);
	ViperState = XComGameState_Unit(kSource);

	if (UnitState == none)
		return 'AA_NotAUnit';


	if (`TACTICALRULES.VisibilityMgr.GetVisibilityInfo(ViperState.ObjectID, UnitState.ObjectID, CurrentVisibility) && CurrentVisibility.TargetCover == CT_Standing)
	{
		if (default.bBlockedByHighCover)
		{
			return 'AA_UnitIsImmune';
		}
	}

	return 'AA_Success';
}

DefaultProperties
{
	bBlockedByHighCover=true
}
