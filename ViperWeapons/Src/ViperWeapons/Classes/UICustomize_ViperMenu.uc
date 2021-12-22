
class UICustomize_ViperMenu extends UICustomize_Menu;

var localized string m_strHips;
var localized string m_strTail;
var localized string m_strTailWrap;

//----------------------------------------------------------------------------
// FUNCTIONS

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
	local int currentSel;
	local bool bBasicSoldierClass;
	currentSel = List.SelectedIndex;

	super.UpdateData();

	// Hide all existing options since the number of options can change if player switches genders
	HideListItems();

	CustomizeManager.UpdateBodyPartFilterForNewUnit(CustomizeManager.Unit);

	// INFO
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataDescription(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_FirstName)$ m_strEditInfo, OnCustomizeInfo);

	// HEAD
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataDescription(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_NickName)$ m_strEditHead, OnCustomizeHead);
	
	// BODY
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataDescription(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_NickName)$ m_strEditBody, OnCustomizeBody);

	// WEAPON
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataDescription(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_NickName)$ m_strEditWeapon, OnCustomizeWeapon);

	//  CHARACTER POOL OPTIONS
	//-----------------------------------------------------------------------------------------
	//If in the armory, allow exporting character to the pool
	if (bInArmory) 
	{
		GetListItem(i++).UpdateDataDescription(m_strExportCharacter, OnExportSoldier);
	}
	else //Otherwise, allow customizing their potential appearances
	{
		if(!bInMP)
		{
			if (Unit.IsSoldier())
			{
				GetListItem(i++).UpdateDataValue(m_strCustomizeClass,
					CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Class, eUIState_Normal, FontSize), CustomizeClass, true);

				bBasicSoldierClass = (Unit.GetSoldierClassTemplate().RequiredCharacterClass == '');
				GetListItem(i++, !bBasicSoldierClass, m_strNoClassVariants).UpdateDataValue(m_strViewClass,
					CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_ViewClass, bBasicSoldierClass ? eUIState_Normal : eUIState_Disabled, FontSize), CustomizeViewClass, true);
			}
			
			// re-enable VIP lines but turn them into text boxes and use GetListItem to disable and explain. Unit generation randomizes AllowedType, so set to false.
			GetListItem(i++).UpdateDataCheckbox(m_strAllowTypeSoldier, m_strAllowed, CustomizeManager.UpdatedUnitState.bAllowedTypeSoldier, OnCheckbox_Type_Soldier);
			GetListItem(i++, true, "Only humans can be VIPs!").UpdateDataDescription(m_strAllowTypeVIP);
			CustomizeManager.UpdatedUnitState.bAllowedTypeVIP = false;
			GetListItem(i++, true, "Only humans can be Dark VIPs!").UpdateDataDescription(m_strAllowTypeDarkVIP);
			CustomizeManager.UpdatedUnitState.bAllowedTypeDarkVIP = false;

			GetListItem(i).UpdateDataDescription(m_strTimeAdded @ CustomizeManager.UpdatedUnitState.PoolTimestamp, None);
			GetListItem(i++).SetDisabled(true);
		}
	}
	
	List.OnItemClicked = OnListOptionClicked;

	Navigator.SetSelected(List);

	if (currentSel > -1 && currentSel < List.ItemCount)
	{
		//Don't use GetItem(..), because it overwrites enable.disable option indiscriminately. 
		List.Navigator.SetSelected(List.GetItem(currentSel));
	}
	else
	{
		//Don't use GetItem(..), because it overwrites enable.disable option indiscriminately. 
		List.Navigator.SelectFirstAvailable();
	}
}