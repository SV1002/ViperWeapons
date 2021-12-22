//---------------------------------------------------------------------------------------
//  *********   FIRAXIS SOURCE CODE   ******************
//  FILE:    XComCharacterCustomization_Spark.uc
//  AUTHOR:  Joe Weinhoffer 2/19/2016
//  PURPOSE: Container of static helper functions for customizing character screens 
//			 and visual updates for SPARK soldiers. 
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//--------------------------------------------------------------------------------------- 

class XComCharacterCustomization_Viper extends XComCharacterCustomization;

//==============================================================================

// direction will either be -1 (left arrow), or 1 (right arrow)xcom
simulated function OnCategoryValueChange(int categoryIndex, int direction, optional int specificIndex = -1)
{
	local X2BodyPartTemplate BodyPart;
	local int categoryValue;	
	local name RequestTemplate;
	local TSoldier NewSoldier;

	UpdateBodyPartFilterForNewUnit(Unit);	
	BodyPartFilter.Set(EGender(UpdatedUnitState.kAppearance.iGender), ECharacterRace(UpdatedUnitState.kAppearance.iRace), UpdatedUnitState.kAppearance.nmTorso, !UpdatedUnitState.IsSoldier(), UpdatedUnitState.IsVeteran() || InShell());
	switch (categoryIndex)
	{
	case eUICustomizeCat_Helmet:
		UpdateCategorySimple("Helmets", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmHelmet, specificIndex);
		break;
	case eUICustomizeCat_Torso:       
		UpdateCategory("Torso", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmTorso, specificIndex);

		if(UpdatedUnitState.kAppearance.nmArms != '' && !ValidatePartSelection("Arms", UpdatedUnitState.kAppearance.nmArms))
		{
			UpdatedUnitState.kAppearance.nmArms = '';

			//Dual arm selection was not valid, choose individual arms
			BodyPart = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager().GetRandomUberTemplate("LeftArm", BodyPartFilter, BodyPartFilter.FilterByGenderAndCharacterExclusive);
			if(BodyPart != none)
			{
				UpdatedUnitState.kAppearance.nmLeftArm = BodyPart.DataName;
			}

			BodyPart = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager().GetRandomUberTemplate("RightArm", BodyPartFilter, BodyPartFilter.FilterByGenderAndCharacterExclusive);
			if(BodyPart != none)
			{
				UpdatedUnitState.kAppearance.nmRightArm = BodyPart.DataName;
			}


		}

		if(!ValidatePartSelection("Legs", UpdatedUnitState.kAppearance.nmLegs))
		{			
			BodyPart = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager().GetRandomUberTemplate("Legs", BodyPartFilter, BodyPartFilter.FilterByGenderAndCharacterExclusive);
			if(BodyPart != none)
			{
				UpdatedUnitState.kAppearance.nmLegs = BodyPart.DataName;
			}
		}

		XComHumanPawn(ActorPawn).SetAppearance(UpdatedUnitState.kAppearance);
		UpdatedUnitState.StoreAppearance();
		break;
	case eUICustomizeCat_Arms:
		UpdateCategory("Arms", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmArms, specificIndex);
		//Set individual arm options to none when setting dual arms
		UpdatedUnitState.kAppearance.nmLeftArm = '';
		UpdatedUnitState.kAppearance.nmRightArm = '';
		UpdatedUnitState.kAppearance.nmLeftArmDeco = '';
		UpdatedUnitState.kAppearance.nmRightArmDeco = '';
		XComHumanPawn(ActorPawn).SetAppearance(UpdatedUnitState.kAppearance);
		break;
	case eUICustomizeCat_Legs:                  
		UpdateCategory("Legs", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmLegs, specificIndex);
		break;

	case eUICustomizeCat_Gender:					 
		categoryValue = UpdatedUnitState.kAppearance.iGender;

		UpdatedUnitState.StoreAppearance();

		UpdatedUnitState.kAppearance.iGender = (EGender(specificIndex + 1) == eGender_Male )? eGender_Male : eGender_Female;

		// only update if the gender actually changed
		if (UpdatedUnitState.kAppearance.iGender != categoryValue)
		{
			//Weirdism of the CreateTSoldier interface: don't request a soldier template
			RequestTemplate = '';
			if( !UpdatedUnitState.IsSoldier() )
			{
				RequestTemplate = UpdatedUnitState.GetMyTemplateName();
			}

			//Gender re-assignment requires lots of changes...		
			NewSoldier = CharacterGenerator.CreateTSoldier(RequestTemplate, EGender(UpdatedUnitState.kAppearance.iGender), UpdatedUnitState.GetCountryTemplate().DataName, -1, UpdatedUnitState.GetItemInSlot(eInvSlot_Armor).GetMyTemplateName());

			// If the selected armor has a specific matching helmet, add it to the appearance
		//	BodyPartFilter.Set(EGender(NewSoldier.kAppearance.iGender), ECharacterRace(NewSoldier.kAppearance.iRace), NewSoldier.kAppearance.nmTorso, !UpdatedUnitState.IsASoldier(), UpdatedUnitState.IsVeteran() || InShell());
		//	BodyPart = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager().GetRandomUberTemplate("Helmets", BodyPartFilter, BodyPartFilter.FilterByGenderAndCharacterAndNonSpecialized);
		//	if (BodyPart != none)
		//	{
		//		NewSoldier.kAppearance.nmHelmet = BodyPart.DataName;
		//	}

			if (UpdatedUnitState.HasStoredAppearance(UpdatedUnitState.kAppearance.iGender))
			{
				UpdatedUnitState.GetStoredAppearance(NewSoldier.kAppearance, UpdatedUnitState.kAppearance.iGender);
			}

			UpdatedUnitState.SetTAppearance(NewSoldier.kAppearance);
		
			//Gender changes everything, so re-get all the pieces
			ReCreatePawnVisuals(ActorPawn, true);
		}

		//TODO category.SetValue(string(UpdatedUnitState.kAppearance.iGender));
		break;
	case eUICustomizeCat_Legs:                  
		UpdateCategory("Legs", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmLegs, specificIndex);
		break;
	case eUICustomizeCat_Voice:
		UpdateCategorySimple("Voice", direction, BodyPartFilter.FilterByGenderAndNonSpecialized, UpdatedUnitState.kAppearance.nmVoice, specificIndex);
		XComHumanPawn(ActorPawn).SetVoice(UpdatedUnitState.kAppearance.nmVoice);
		UpdatedUnitState.StoreAppearance();
		break;
	case eUICustomizeCat_Helmet:  
		UpdateCategory("Helmets", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmHelmet, specificIndex);
		break;
	case eUICustomizeCat_LeftArm:
		UpdateCategory("LeftArm", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmLeftArm, specificIndex);
		if(UpdatedUnitState.kAppearance.nmRightArm == '')
		{
			BodyPart = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager().GetRandomUberTemplate("RightArm", BodyPartFilter, BodyPartFilter.FilterByGenderAndCharacterExclusive);
			if(BodyPart != none)
			{
				UpdatedUnitState.kAppearance.nmRightArm = BodyPart.DataName;
			}
		}		
		UpdatedUnitState.kAppearance.nmArms = ''; //Clear dual arms selection
		XComHumanPawn(ActorPawn).SetAppearance(UpdatedUnitState.kAppearance);
		UpdatedUnitState.StoreAppearance();
		break;
	case eUICustomizeCat_RightArm:
		UpdateCategory("RightArm", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmRightArm, specificIndex);
		if(UpdatedUnitState.kAppearance.nmLeftArm == '')
		{
			BodyPart = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager().GetRandomUberTemplate("LeftArm", BodyPartFilter, BodyPartFilter.FilterByGenderAndCharacterExclusive);
			if(BodyPart != none)
			{
				UpdatedUnitState.kAppearance.nmLeftArm = BodyPart.DataName;
			}
		}
		UpdatedUnitState.kAppearance.nmArms = ''; //Clear dual arms selection
		XComHumanPawn(ActorPawn).SetAppearance(UpdatedUnitState.kAppearance);
		UpdatedUnitState.StoreAppearance();
		break;
	case eUICustomizeCat_LeftArmDeco:
		UpdateCategory("LeftArmDeco", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmLeftArmDeco, specificIndex);
		break;
	case eUICustomizeCat_RightArmDeco:
		UpdateCategory("RightArmDeco", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmRightArmDeco, specificIndex);
		break;
	case eUICustomizeCat_Face:		
		UpdateCategorySimple("Head", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmHead, specificIndex);
		break;
	case eUICustomizeCat_TorsoDeco:
		UpdateCategory("TorsoDeco", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmTorsoDeco, specificIndex);
		break;
	case eUICustomizeCat_LeftForearm:
		UpdateCategory("LeftForearm", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmLeftForearm, specificIndex);
		break;
	case eUICustomizeCat_RightForearm:
		UpdateCategory("RightForearm", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmRightForearm, specificIndex);
		break;
	case eUICustomizeCat_Thighs:
		UpdateCategory("Thighs", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmThighs, specificIndex);
		break;
	case eUICustomizeCat_Shins:
		UpdateCategory("Shins", direction, BodyPartFilter.FilterByGenderAndCharacterExclusive, UpdatedUnitState.kAppearance.nmShins, specificIndex);
		break;
	default:
		super.OnCategoryValueChange(categoryIndex, direction, specificIndex);
		break;
	}	

	// Only update the camera when editing a unit, not when customizing weapons
	if(`SCREENSTACK.HasInstanceOf(class'UICustomize'))
		UpdateCamera(categoryIndex);

}

simulated function string GetCategoryDisplay(int catType)
{
	local string Result;

	switch (catType)
	{
	case eUICustomizeCat_Helmet:
		Result = GetCategoryDisplayName("Helmets", UpdatedUnitState.kAppearance.nmHelmet, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Voice:
		Result = GetCategoryDisplayName("Voice", UpdatedUnitState.kAppearance.nmVoice, BodyPartFilter.FilterByGenderAndNonSpecialized);
		break;
	case eUICustomizeCat_Torso:  
		Result = string(GetCategoryValue("Torso", UpdatedUnitState.kAppearance.nmTorso, BodyPartFilter.FilterByGenderAndCharacterExclusive));
		break;
	case eUICustomizeCat_Hairstyle:		
		Result = GetCategoryDisplayName("Hair", UpdatedUnitState.kAppearance.nmHaircut, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_FacialHair:			 
		Result = GetCategoryDisplayName("Beards", UpdatedUnitState.kAppearance.nmBeard, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_LeftArm:
		Result = GetCategoryDisplayName("LeftArm", UpdatedUnitState.kAppearance.nmLeftArm, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_RightArm:
		Result = GetCategoryDisplayName("RightArm", UpdatedUnitState.kAppearance.nmRightArm, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_LeftArmDeco:
		Result = GetCategoryDisplayName("LeftArmDeco", UpdatedUnitState.kAppearance.nmLeftArmDeco, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_RightArmDeco:
		Result = GetCategoryDisplayName("RightArmDeco", UpdatedUnitState.kAppearance.nmRightArmDeco, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_LeftForearm:
		Result = GetCategoryDisplayName("LeftForearm", UpdatedUnitState.kAppearance.nmLeftForearm, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_RightForearm:
		Result = GetCategoryDisplayName("RightForearm", UpdatedUnitState.kAppearance.nmRightForearm, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Legs:              
		Result = string(GetCategoryValue("Legs", UpdatedUnitState.kAppearance.nmLegs, BodyPartFilter.FilterByGenderAndCharacterExclusive));
		break;
	case eUICustomizeCat_Thighs:
		Result = GetCategoryDisplayName("Thighs", UpdatedUnitState.kAppearance.nmThighs, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Shins:
		Result = string(GetCategoryValue("Shins", UpdatedUnitState.kAppearance.nmShins, BodyPartFilter.FilterByGenderAndCharacterExclusive));
		break;
	case eUICustomizeCat_TorsoDeco:
		Result = GetCategoryDisplayName("TorsoDeco", UpdatedUnitState.kAppearance.nmTorsoDeco, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Arms:              
		if(UpdatedUnitState.kAppearance.nmArms == '')
		{
			Result = "";
		}
		else
		{
			Result = string(GetCategoryValue("Arms", UpdatedUnitState.kAppearance.nmArms, BodyPartFilter.FilterByGenderAndCharacterExclusive));
		}
		break;
	default:
		Result = super.GetCategoryDisplay(catType);
		break;
	}
	
	return Result;
}

//==============================================================================

reliable client function array<string> GetCategoryList(int categoryIndex)
{
	local array<string> Items;
	
	switch (categoryIndex)
	{
	case eUICustomizeCat_Face:
		GetGenericCategoryList(Items, "Head", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Head'.default.m_strFace);
		return Items;
	case eUICustomizeCat_Helmet:
		GetGenericCategoryList(Items, "Helmets", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Head'.default.m_strHelmet);
		return Items;
	case eUICustomizeCat_Torso:  
		GetGenericCategoryList(Items, "Torso", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strTorso);
		return Items;
	case eUICustomizeCat_Voice:
		GetGenericCategoryList(Items, "Voice", BodyPartFilter.FilterByGenderAndNonSpecialized, class'UICustomize_Info'.default.m_strVoice);
		return Items;
	case eUICustomizeCat_Arms:
		GetGenericCategoryList(Items, "Arms", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strArms);
		return Items;
	case eUICustomizeCat_LeftArm:
		GetGenericCategoryList(Items, "LeftArm", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strLeftArm);
		return Items;		
	case eUICustomizeCat_RightArm:
		GetGenericCategoryList(Items, "RightArm", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strRightArm);
		return Items;
	case eUICustomizeCat_LeftArmDeco:
		GetGenericCategoryList(Items, "LeftArmDeco", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strLeftArmDeco);
		return Items;		
	case eUICustomizeCat_RightArmDeco:
		GetGenericCategoryList(Items, "RightArmDeco", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strRightArmDeco);
		return Items;
	case eUICustomizeCat_Legs:
		GetGenericCategoryList(Items, "Legs", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strLegs);
		return Items;
	case eUICustomizeCat_FaceDecorationUpper:
		GetGenericCategoryList(Items, "FacePropsUpper", BodyPartFilter.FilterByGender, class'UICustomize_Head'.default.m_strUpperFaceProps);
		return Items;
	case eUICustomizeCat_FaceDecorationLower:
		GetGenericCategoryList(Items, "FacePropsLower", BodyPartFilter.FilterByGender, class'UICustomize_Head'.default.m_strLowerFaceProps);
		return Items;
	case eUICustomizeCat_LeftForearm:
		GetGenericCategoryList(Items, "LeftForearm", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strLeftForearm);
		return Items;
	case eUICustomizeCat_RightForearm:
		GetGenericCategoryList(Items, "RightForearm", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strRightForearm);
		return Items;
	case eUICustomizeCat_TorsoDeco:
		GetGenericCategoryList(Items, "TorsoDeco", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strTorsoDeco);
		return Items;
	case eUICustomizeCat_Legs:
		GetGenericCategoryList(Items, "Legs", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strLegs);
		return Items;
	case eUICustomizeCat_Thighs:
		GetGenericCategoryList(Items, "Thighs", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strThighs);
		return Items;
	case eUICustomizeCat_Shins:
		GetGenericCategoryList(Items, "Shins", BodyPartFilter.FilterByGenderAndCharacterExclusive, class'UICustomize_Body'.default.m_strShins);
		return Items;
	default:
		return super.GetCategoryList(categoryIndex);
	}
}

simulated function int GetCategoryIndex(int catType)
{
	local int Result;
	
	Result = -1;

	switch (catType)
	{
	case eUICustomizeCat_Face:
		Result = GetCategoryValue("Head", UpdatedUnitState.kAppearance.nmHead, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Helmet:
		Result = GetCategoryValue("Helmets", UpdatedUnitState.kAppearance.nmHelmet, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Torso:  
		Result = GetCategoryValue("Torso", UpdatedUnitState.kAppearance.nmTorso, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_TorsoDeco:
		Result = GetCategoryValue("TorsoDeco", UpdatedUnitState.kAppearance.nmTorsoDeco, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Arms:              
		Result = GetCategoryValue("Arms", UpdatedUnitState.kAppearance.nmArms, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_LeftArm:
		Result = GetCategoryValue("LeftArm", UpdatedUnitState.kAppearance.nmLeftArm, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;		
	case eUICustomizeCat_RightArm:
		Result = GetCategoryValue("RightArm", UpdatedUnitState.kAppearance.nmRightArm, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_LeftArmDeco:
		Result = GetCategoryValue("LeftArmDeco", UpdatedUnitState.kAppearance.nmLeftArmDeco, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_RightArmDeco:
		Result = GetCategoryValue("RightArmDeco", UpdatedUnitState.kAppearance.nmRightArmDeco, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Legs:              
		Result = GetCategoryValue("Legs", UpdatedUnitState.kAppearance.nmLegs, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Hairstyle:		
		Result = GetCategoryValue("Hair", UpdatedUnitState.kAppearance.nmHaircut, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_FaceDecorationUpper:
		Result = GetCategoryValue("FacePropsUpper", UpdatedUnitState.kAppearance.nmFacePropUpper, BodyPartFilter.FilterByGenderAndNonSpecialized);
		break;
	case eUICustomizeCat_FaceDecorationLower:
		Result = GetCategoryValue("FacePropsLower", UpdatedUnitState.kAppearance.nmFacePropLower, BodyPartFilter.FilterByGenderAndNonSpecialized);
		break;
	case eUICustomizeCat_FacialHair:			 
		Result = GetCategoryValue("Beards", UpdatedUnitState.kAppearance.nmBeard, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Voice:
		Result = GetCategoryValue("Voice", UpdatedUnitState.kAppearance.nmVoice, BodyPartFilter.FilterByGenderAndNonSpecialized);
		break;
	case eUICustomizeCat_Helmet:              
		Result = GetCategoryValue("Helmets", UpdatedUnitState.kAppearance.nmHelmet, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Thighs:
		Result = GetCategoryValue("Thighs", UpdatedUnitState.kAppearance.nmThighs, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_Shins:
		Result = GetCategoryValue("Shins", UpdatedUnitState.kAppearance.nmShins, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_LeftForearm:
		Result = GetCategoryValue("LeftForearm", UpdatedUnitState.kAppearance.nmLeftForearm, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	case eUICustomizeCat_RightForearm:
		Result = GetCategoryValue("RightForearm", UpdatedUnitState.kAppearance.nmRightForearm, BodyPartFilter.FilterByGenderAndCharacterExclusive);
		break;
	default:
		Result = super.GetCategoryIndex(catType);
		break;
	}

	return Result;
}


//This method will check whether a given part selection is valid given the current torso.
function bool ValidatePartSelection(string PartType, name PartSelection)
{
	local array<X2BodyPartTemplate> BodyParts;
	local int Index;	
	local X2BodyPartTemplateManager PartTemplateManager;

	PartTemplateManager = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager();
	//Retrieve a list of valid parts for the specified part type
	BodyPartFilter.Set(EGender(UpdatedUnitState.kAppearance.iGender), ECharacterRace(UpdatedUnitState.kAppearance.iRace), UpdatedUnitState.kAppearance.nmTorso, !UpdatedUnitState.IsSoldier(), UpdatedUnitState.IsVeteran() || InShell());
	PartTemplateManager.GetFilteredUberTemplates(PartType, BodyPartFilter, BodyPartFilter.FilterByGenderAndCharacterExclusive, BodyParts);

	if(PartType == "Voice")
	{
		PartTemplateManager.GetFilteredUberTemplates(PartType, BodyPartFilter, BodyPartFilter.FilterByGenderAndNonSpecialized, BodyParts);

	}

	//See if the part selection is in the list of filtered templates. If it is, the part selection is valid.
	for(Index = 0; Index < BodyParts.Length; ++Index)
	{
		if(BodyParts[Index].DataName == PartSelection)
		{
			return true;
		}
	}
	
	return false;
}
