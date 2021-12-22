
class UICustomize_ViperInfo extends UICustomize_Info;

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
	local int i;

	ColorState = bIsSuperSoldier ? eUIState_Disabled : eUIState_Normal;

	// FIRST NAME
	//-----------------------------------------------------------------------------------------
	GetListItem(i++)
		.UpdateDataDescription(m_strFirstNameLabel, OpenFirstNameInputBox)
		.SetDisabled(bIsSuperSoldier, m_strIsSuperSoldier);

	// LAST NAME
	//-----------------------------------------------------------------------------------------
	GetListItem(i++)
		.UpdateDataDescription(m_strLastNameLabel, OpenLastNameInputBox)
		.SetDisabled(bIsSuperSoldier, m_strIsSuperSoldier);

	// NICKNAME
	//-----------------------------------------------------------------------------------------
	ColorState = (bIsSuperSoldier || (!Unit.IsVeteran() && !InShell())) ? eUIState_Disabled : eUIState_Normal;
	GetListItem(i++)
		.UpdateDataDescription(m_strNickNameLabel, OpenNickNameInputBox)
		.SetDisabled(bIsSuperSoldier || (!Unit.IsVeteran() && !InShell()), bIsSuperSoldier ? m_strIsSuperSoldier : m_strNeedsVeteranStatus); // Don't disable in the shell. 

	ColorState = bIsSuperSoldier ? eUIState_Disabled : eUIState_Normal;

	// BIO
	//-----------------------------------------------------------------------------------------
	GetListItem(i++)
		.UpdateDataDescription(m_strEditBiography, OpenBiographyInputBox)
		.SetDisabled(bIsSuperSoldier, m_strIsSuperSoldier);

	// NATIONALITY
	//-----------------------------------------------------------------------------------------
	GetListItem(i++)
		.UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Country)$ m_strNationality, CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Country, ColorState, FontSize), CustomizeCountry)
		.SetDisabled(bIsSuperSoldier || bIsXPACSoldier, bIsSuperSoldier ? m_strIsSuperSoldier : m_strNoNationality);

	// GENDER
	//-----------------------------------------------------------------------------------------
	GetListItem(i++)
		.UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Gender)$ m_strGender, CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Gender, ColorState, FontSize), CustomizeGender)
		.SetDisabled(bIsSuperSoldier, m_strIsSuperSoldier);

	// VOICE
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Voice)$ m_strVoice, CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Voice, eUIState_Normal, FontSize), CustomizeVoice);

		// ATTITUDE (VETERAN)
	//-----------------------------------------------------------------------------------------
	GetListItem(i++, bDisableVeteranOptions).UpdateDataValue(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_Personality)$ m_strAttitude,
		CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Personality, ColorState, FontSize), CustomizePersonality);
}