class X2Condition_ViperHasAbility extends X2Condition;

var name RequiredAbilityNameOnSource;
var bool bFlipCondition; // instead of requiring the ability, exclude the ability 

event name CallMeetsConditionWithSource(XComGameState_BaseObject kTarget, XComGameState_BaseObject kSource) 
{ 
	local XComGameState_Unit UnitState;
	local bool bResult;

	UnitState = XComGameState_Unit(kSource);

	if (RequiredAbilityNameOnSource != '' && UnitState.FindAbility(RequiredAbilityNameOnSource).ObjectID > 0)
	{
		bResult = true;
	}

	if (bFlipCondition)
	{
		bResult = !bResult;
	}

	return bResult ? 'AA_Success' : 'AA_AbilityNotFound';
}
