class UICustomize_ViperBody extends UICustomize_Body;

//----------------------------------------------------------------------------
// FUNCTIONS

var localized string m_strHips;
var localized string m_strTail;
var localized string m_strTailWrap;

// Override to use correct menu class
simulated function UpdateCustomizationManager()
{
	if (Movie.Pres.m_kCustomizeManager == none)
	{
		Unit = UICustomize_ViperMenu(Movie.Stack.GetScreen(class'UICustomize_ViperMenu')).Unit;
		UnitRef = UICustomize_ViperMenu(Movie.Stack.GetScreen(class'UICustomize_ViperMenu')).UnitRef;
		Movie.Pres.InitializeCustomizeManager(Unit);
	}
}

simulated function UpdateData()
{
	local int i;
	local bool bHasOptions;
	local EUIState ColorState;
	local bool bCanSelectArmDeco;
	local bool bCanSelectForearmDeco;
	local bool bCanSelectDualArms;
	
	ResetMechaListItems();

	super.UpdateData();

	// ARMOR PRIMARY COLOR
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataColorChip(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_PrimaryArmorColor)$ m_strMainColor,
		CustomizeManager.GetCurrentDisplayColorHTML(eUICustomizeCat_PrimaryArmorColor), PrimaryArmorColorSelector);

	// ARMOR SECONDARY COLOR
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataColorChip(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_SecondaryArmorColor)$ m_strSecondaryColor,
		CustomizeManager.GetCurrentDisplayColorHTML(eUICustomizeCat_SecondaryArmorColor), SecondaryArmorColorSelector);

	ColorState = bIsSuperSoldier ? eUIState_Disabled : eUIState_Normal;
	
	// ARMOR PATTERN (VETERAN ONLY)
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_ArmorPatterns) $ m_strArmorPattern,
		CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_ArmorPatterns, ColorState, FontSize), CustomizeArmorPattern);

	// ARMS
	//-----------------------------------------------------------------------------------------
	bCanSelectDualArms = CustomizeManager.HasPartsForPartType("Arms", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive);
	if (CustomizeManager.HasMultiplePartsForPartType("Arms", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
	{
		GetListItem(i++, !bCanSelectDualArms, m_strIncompatibleStatus).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Arms) $ m_strArms,
			CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Arms, bCanSelectDualArms ? eUIState_Normal : eUIState_Disabled, FontSize), CustomizeArms, true);
	}

	if (CustomizeManager.HasPartsForPartType("LeftArm", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
	{
		//If they have parts for left arm, we assume that right arm parts are available too.
		if (CustomizeManager.HasMultiplePartsForPartType("LeftArm", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
		{
			GetListItem(i++).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_LeftArm) $ m_strLeftArm,
				CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_LeftArm, , FontSize), CustomizeLeftArm, true);
		}

		if (CustomizeManager.HasMultiplePartsForPartType("RightArm", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
		{
			GetListItem(i++).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_RightArm) $ m_strRightArm,
				CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_RightArm, , FontSize), CustomizeRightArm, true);
		}

		//Only show these options if there is no dual arm selection
		bCanSelectArmDeco = CustomizeManager.HasPartsForPartType("LeftArmDeco", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive);
		if (CustomizeManager.HasMultiplePartsForPartType("LeftArmDeco", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
		{
			GetListItem(i++, !bCanSelectArmDeco, m_strIncompatibleStatus).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_LeftArmDeco) $ m_strLeftArmDeco,
				CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_LeftArmDeco, bCanSelectArmDeco ? eUIState_Normal : eUIState_Disabled, FontSize), CustomizeLeftArmDeco, true);
		}
	
		bCanSelectArmDeco = CustomizeManager.HasPartsForPartType("RightArmDeco", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive);
		if (CustomizeManager.HasMultiplePartsForPartType("RightArmDeco", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
		{
			GetListItem(i++, !bCanSelectArmDeco, m_strIncompatibleStatus).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_RightArmDeco) $ m_strRightArmDeco,
				CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_RightArmDeco, bCanSelectArmDeco ? eUIState_Normal : eUIState_Disabled, FontSize), CustomizeRightArmDeco, true);
		}

		
		bCanSelectForearmDeco = (CustomizeManager.HasPartsForPartType("LeftForearm", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive) &&
			!XComHumanPawn(CustomizeManager.ActorPawn).LeftArmContent.bHideForearms);
		if (CustomizeManager.HasMultiplePartsForPartType("LeftForearm", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
		{
			GetListItem(i++, !bCanSelectForearmDeco, m_strIncompatibleStatus).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_LeftForearm) $ m_strLeftForearm,
				CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_LeftForearm, bCanSelectForearmDeco ? eUIState_Normal : eUIState_Disabled, FontSize), CustomizeLeftForearm, true);
		}
		
		bCanSelectForearmDeco = (CustomizeManager.HasPartsForPartType("RightForearm", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive) &&
			!XComHumanPawn(CustomizeManager.ActorPawn).RightArmContent.bHideForearms);
		if (CustomizeManager.HasMultiplePartsForPartType("RightForearm", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
		{
			GetListItem(i++, !bCanSelectForearmDeco, m_strIncompatibleStatus).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_RightForearm) $ m_strRightForearm,
				CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_RightForearm, bCanSelectForearmDeco ? eUIState_Normal : eUIState_Disabled, FontSize), CustomizeRightForearm, true);
		}
	}

	// TORSO
	//-----------------------------------------------------------------------------------------
	bHasOptions = CustomizeManager.HasMultipleCustomizationOptions(eUICustomizeCat_Torso);
	ColorState = bHasOptions ? eUIState_Normal : eUIState_Disabled;

	if (CustomizeManager.HasMultiplePartsForPartType("Torso", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
	{
		GetListItem(i++, !bHasOptions, m_strNoVariations).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Torso) $ m_strTorso,
			CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Torso, ColorState, FontSize), CustomizeTorso);
	}

	// TORSO DECO
	//-----------------------------------------------------------------------------------------
	if (CustomizeManager.HasMultiplePartsForPartType("TorsoDeco", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
	{
		GetListItem(i++).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_TorsoDeco) $ m_strTorsoDeco,
			CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_TorsoDeco, , FontSize), CustomizeTorsoDeco);
	}

	// LEGS
	//-----------------------------------------------------------------------------------------
	if (CustomizeManager.HasMultiplePartsForPartType("Legs", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
	{
		GetListItem(i++).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Legs) $ m_strTail,
			CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Legs, , FontSize), CustomizeLegs);
	}

	// THIGHS
	//-----------------------------------------------------------------------------------------
	if (CustomizeManager.HasMultiplePartsForPartType("Thighs", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
	{
		GetListItem(i++).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Thighs) $ m_strHips,
			CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Thighs, , FontSize), CustomizeThighs);
	}

	// SHINS
	//-----------------------------------------------------------------------------------------
	if (CustomizeManager.HasMultiplePartsForPartType("Shins", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
	{
		GetListItem(i++).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Shins) $ m_strTailWrap,
			CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Shins, , FontSize), CustomizeShins);
	}
}
