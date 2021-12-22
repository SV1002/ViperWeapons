//---------------------------------------------------------------------------------------
//  FILE:    X2Condition_Stealth.uc
//  AUTHOR:  Joshua Bouscher  --  2/5/2015
//  PURPOSE: Special condition for activating the Ranger Stealth ability.
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class X2Condition_ViperCondition extends X2Condition;

var array<name> ExcludeTypes;

event name CallMeetsCondition(XComGameState_BaseObject kTarget) 
{ 
    local XComGameState_Unit UnitState;

    UnitState = XComGameState_Unit(kTarget);
    
    `LOG("X2Condition_CharacterTemplate running for" @ UnitState.GetFullName() @ UnitState.GetMyTemplateName());
    
    
    if (UnitState == none || ExcludeTypes.Find(UnitState.GetMyTemplateName()) != INDEX_NONE)
    {
        `LOG("Unit is excluded, condition failed");
        return 'AA_UnitIsWrongType';    
    }
    
    `LOG("Unit is NOT excluded, condition succeeds");
    return 'AA_Success';
}