class X2StrategyElement_MAWSlot extends CHItemSlotSet config (ViperMAWConfig);

var localized string strMAWFirstLetter;

var config array<name> AllowedMAWWeaponCategories;
var config array<name> AllowedViperCharacterTemplates;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(CreateMAWSlotTemplate());
	return Templates;
}

static function X2DataTemplate CreateMAWSlotTemplate()
{
	local CHItemSlot Template;

	`CREATE_X2TEMPLATE(class'CHItemSlot', Template, 'MAWSlot');

	Template.InvSlot = eInvSlot_ViperMAW;
	Template.SlotCatMask = Template.SLOT_WEAPON | Template.SLOT_ITEM;
	// Unused for now
	Template.IsUserEquipSlot = true;
	// Uses unique rule
	Template.IsEquippedSlot = true;
	// Does not bypass unique rule
	Template.BypassesUniqueRule = false;
	Template.IsMultiItemSlot = false;
	Template.IsSmallSlot = false;

	Template.CanAddItemToSlotFn = CanAddItemToMAWSlot;
	Template.UnitHasSlotFn = HasMAWSlot;
	Template.GetPriorityFn = MAWGetPriority;
	Template.ShowItemInLockerListFn = ShowItemInLockerList;
	Template.ValidateLoadoutFn = MAWValidateLoadout;
	Template.GetSlotUnequipBehaviorFn = MAWGetUnequipBehavior;

	return Template;
}

function ECHSlotUnequipBehavior MAWGetUnequipBehavior(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState)
{
	return eCHSUB_AllowEmpty;
}

static function bool CanAddItemToMAWSlot(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate ItemTemplate, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	local string strDummy;
	local X2WeaponTemplate	WeaponTemplate;

	WeaponTemplate = X2WeaponTemplate(ItemTemplate);

	if (default.AllowedViperCharacterTemplates.Find(Unit.GetMyTemplateName()) == INDEX_NONE)
	{
		return false;
	}

	if (!Slot.UnitHasSlot(Unit, strDummy, CheckGameState) || Unit.GetItemInSlot(Slot.InvSlot, CheckGameState) != none)
	{
		return false;
	}

	if (default.AllowedMAWWeaponCategories.Find(WeaponTemplate.WeaponCat) != INDEX_NONE)
	{
		return true;
	}

	return false;
}

static function bool HasMAWSlot(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState)
{
	//`log(GetFuncName() @ "called",, 'Augmentations');
	return default.AllowedViperCharacterTemplates.Find(UnitState.GetMyTemplateName()) != INDEX_NONE;
}

static function int MAWGetPriority(CHItemSlot Slot, XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	return 50; // Ammo Pocket is 110 
}

static function bool ShowItemInLockerList(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	local X2WeaponTemplate	WeaponTemplate;

	WeaponTemplate = X2WeaponTemplate(ItemTemplate);

	return default.AllowedMAWWeaponCategories.Find(WeaponTemplate.WeaponCat) != INDEX_NONE;
}

static function MAWValidateLoadout(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState)
{
	local XComGameState_Item EquippedMAW;
	local string strDummy;
	local bool HasSlot;
	EquippedMAW = Unit.GetItemInSlot(Slot.InvSlot, NewGameState);
	HasSlot = Slot.UnitHasSlot(Unit, strDummy, NewGameState);
	if(EquippedMAW == none && HasSlot)
	{
		//EquippedSecondaryWeapon = GetBestSecondaryWeapon(NewGameState);
		//AddItemToInventory(EquippedSecondaryWeapon, eInvSlot_SecondaryWeapon, NewGameState);
	}
	else if(EquippedMAW != none && !HasSlot)
	{
		EquippedMAW = XComGameState_Item(NewGameState.ModifyStateObject(class'XComGameState_Item', EquippedMAW.ObjectID));
		Unit.RemoveItemFromInventory(EquippedMAW, NewGameState);
		XComHQ.PutItemInInventory(NewGameState, EquippedMAW);
		EquippedMAW = none;
	}
}