
class UICustomize_ViperHead extends UICustomize_Head;

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



//----------------------------------------------------------------------------
// FUNCTIONS

simulated function CreateDataListItems()
{
	local EUIState ColorState;
	local bool bIsObstructed;
	local int i;

	ColorState = bIsSuperSoldier ? eUIState_Disabled : eUIState_Normal;
		

	// FACE
	//-----------------------------------------------------------------------------------------
	ColorState = bIsSuperSoldier ? eUIState_Disabled : eUIState_Normal;
	GetListItem(i++)
		.UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Face)$ m_strFace, CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Face, ColorState, FontSize), CustomizeFace)
		.SetDisabled(bIsSuperSoldier, m_strIsSuperSoldier);

	// EYE COLOR
	//-----------------------------------------------------------------------------------------
	GetListItem(i++)
		.UpdateDataColorChip(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_EyeColor)$m_strEyeColor, CustomizeManager.GetCurrentDisplayColorHTML(eUICustomizeCat_EyeColor), EyeColorSelector)
		.SetDisabled(bIsSuperSoldier, m_strIsSuperSoldier);

	// HELMET
	//-----------------------------------------------------------------------------------------
	GetListItem(i++)
		.UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Helmet) $ m_strHelmet, CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Helmet, ColorState, FontSize), CustomizeHelmet)
		.SetDisabled(bIsSuperSoldier, m_strIsSuperSoldier);


	// UPPER FACE PROPS
	//-----------------------------------------------------------------------------------------
	bIsObstructed = XComHumanPawn(CustomizeManager.ActorPawn).HelmetContent.bHideUpperFacialProps;
	ColorState = bIsObstructed ? eUIState_Disabled : eUIState_Normal;

	GetListItem(i++, bIsObstructed, m_strRemoveHelmet).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_FaceDecorationUpper) $ m_strUpperFaceProps,
		CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_FaceDecorationUpper, ColorState, FontSize), CustomizeUpperFaceProps);

	// LOWER FACE PROPS
	//-----------------------------------------------------------------------------------------
	bIsObstructed = XComHumanPawn(CustomizeManager.ActorPawn).HelmetContent.bHideLowerFacialProps;
	ColorState = bIsObstructed ? eUIState_Disabled : eUIState_Normal;

	GetListItem(i++, bIsObstructed, m_strRemoveHelmet).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_FaceDecorationLower) $ m_strLowerFaceProps,
		CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_FaceDecorationLower, ColorState, FontSize), CustomizeLowerFaceProps);

	// FACE PAINT
	//-----------------------------------------------------------------------------------------

	//Check whether any face paint is available...	
	if (CustomizeManager.HasPartsForPartType("Facepaint", `XCOMGAME.SharedBodyPartFilter.FilterByGenderAndCharacterExclusive))
	{
		GetListItem(i++).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_FacePaint) $ m_strFacePaint,
			CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_FacePaint, eUIState_Normal, FontSize), CustomizeFacePaint);
	}

	// SCARS (VETERAN ONLY)
	//-----------------------------------------------------------------------------------------
	GetListItem(i++, bDisableVeteranOptions).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Scars) $ m_strScars,
		CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Scars, ColorState, FontSize), CustomizeScars);
}