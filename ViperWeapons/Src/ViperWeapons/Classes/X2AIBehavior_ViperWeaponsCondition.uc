//---------------------------------------------------------------------------------------
//  *********   FIRAXIS SOURCE CODE   ******************
//  FILE:    XGAIBehavior.uc    
//  AUTHOR:  Alex Cheng  --  2/17/2009
//  PURPOSE: Used for coding AI-specific behavior applied to an individual XGUnit actor.
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2AIBehavior_ViperWeaponsCondition extends X2AIBTDefaultConditions;

var ability_target m_kBTCurrTarget;

static event bool FindBTConditionDelegate(name strName, optional out delegate<BTConditionDelegate> dOutFn, optional out Name NameParam)
{
	dOutFn = None;
	switch( strName )
	{
		case 'TargetIsHumanoidAlien':
			dOutFn = IsTargetHumanoidAlien;
			return true;
		break;

		default:
		break;
	}

	return super.FindBTConditionDelegate(strName, dOutFn, NameParam);
}

function bt_status IsTargetHumanoidAlien()
{
	local XComGameState_Unit TargetState;
	if (m_kBehavior.BT_GetTarget(TargetState))
	{
		if (TargetState.IsNonHumanoidAlien())
		{
			return BTS_SUCCESS;
		}
	}
	return BTS_FAILURE;
}