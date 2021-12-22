class XGCharacterGenerator_ViperVIP extends XGCharacterGenerator
	dependson(X2StrategyGameRulesetDataStructures);

var localized array<string> m_arrViperMFirstNames;
var localized array<string> m_arrViperFFirstNames;
var localized array<string> m_arrViperLastNames;

function TSoldier CreateTSoldier( optional name CharacterTemplateName, optional EGender eForceGender, optional name nmCountry = '', optional int iRace = -1, optional name ArmorName )
{
	local XComLinearColorPalette ArmorPalette, EyeColourPalette;
	local int SkinRandom;
	local int ArmourRandom;

	SkinRandom = `SYNC_RAND(4);
	ArmourRandom = `SYNC_RAND(2);
	//kSoldier.kAppearance.nmHaircut = '';
	kSoldier.nmCountry = 'Country_Vipern';
	kSoldier.kAppearance.nmFlag = kSoldier.nmCountry; // needs to be copied here for pawns -- jboswell
	kSoldier.kAppearance.iRace = 0;
	kSoldier.kAppearance.iGender = (Rand(2) == 0) ? eGender_Female : eGender_Male;
	//kSoldier.kAppearance.nmEye= '';
	//kSoldier.kAppearance.nmTeeth= '';
	//kSoldier.kAppearance.nmFacePropLower= '';
	kSoldier.kAppearance.nmPatterns= 'Pat_Nothing';
	kSoldier.kAppearance.nmWeaponPattern= 'Pat_Nothing';
	kSoldier.iRank = 0;
	kSoldier.kAppearance.iHairColor = Rand(18);
	kSoldier.kAppearance.iSkinColor = 0;
	kSoldier.kAppearance.nmVoice = '';
	kSoldier.kAppearance.iAttitude = Rand(6);
	//kSoldier.kAppearance.nmFacePropUpper='';
	//kSoldier.kAppearance.nmTattoo_RightArm='';
	//kSoldier.kAppearance.nmTattoo_LeftArm='';
	//kSoldier.kAppearance.nmBeard ='';
	EyeColourPalette = XComContentManager(class'Engine'.static.GetEngine().GetContentManager()).GetColorPalette(ePalette_EyeColor);
	kSoldier.kAppearance.iEyeColor = (class'Engine'.static.GetEngine().SyncRand(EyeColourPalette.Entries.length,string(Name)@string(GetStateName())@string(GetFuncName())));
	ArmorPalette = XComContentManager(class'Engine'.static.GetEngine().GetContentManager()).GetColorPalette(ePalette_ArmorTint);
	kSoldier.kAppearance.iWeaponTint = -1;
	kSoldier.kAppearance.iArmorTint = (class'Engine'.static.GetEngine().SyncRand(ArmorPalette.Entries.length - 10,string(Name)@string(GetStateName())@string(GetFuncName())));
	kSoldier.kAppearance.iArmorTintSecondary = (class'Engine'.static.GetEngine().SyncRand(ArmorPalette.Entries.length - 10,string(Name)@string(GetStateName())@string(GetFuncName())));
	kSoldier.kAppearance.nmFacePropUpper = '';

	if(kSoldier.kAppearance.iGender == eGender_Male)
	{
		kSoldier.kAppearance.nmShins = 'VW_Shins_Invisible_M';
		kSoldier.kAppearance.nmHelmet = 'VW_Helmet_NoHelmet_M';
		if(SkinRandom == 0)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Viper_M';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Viper_M';
			if(ArmourRandom == 0)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Viper_M';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Viper_M';
				kSoldier.kAppearance.nmThighs = 'VW_Thighs_Viper_M';
			}
			if(ArmourRandom == 1)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Underlay_Viper_M';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Underlay_M';
			}
		}
		if(SkinRandom == 1)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Neonate_M';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Neonate_M';
			if(ArmourRandom == 0)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Neonate_M';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Neonate_M';
				kSoldier.kAppearance.nmThighs = 'VW_Thighs_Viper_M';
			}
			if(ArmourRandom == 1)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Underlay_Neonate_M';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Underlay_M';
			}
		}
		if(SkinRandom == 2)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Naja_M';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Naja_M';
			if(ArmourRandom == 0)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Naja_M';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Naja_M';
				kSoldier.kAppearance.nmThighs = 'VW_Thighs_Viper_M';
			}
			if(ArmourRandom == 1)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Underlay_Naja_M';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Underlay_M';
			}
		}
		if(SkinRandom == 3)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Sidewinder_M';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Sidewinder_M';
			if(ArmourRandom == 0)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Sidewinder_M';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Sidewinder_M';
				kSoldier.kAppearance.nmThighs = 'VW_Thighs_Viper_M';
			}
			if(ArmourRandom == 2)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Underlay_Sidewinder_M';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Underlay_M';
			}
		}
	}

	if(kSoldier.kAppearance.iGender == eGender_Female)
	{
		kSoldier.kAppearance.nmShins = 'VW_Shins_Invisible_F';
		kSoldier.kAppearance.nmHelmet = 'VW_Helmet_NoHelmet_F';
		if(SkinRandom == 0)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Viper_F';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Viper_F';
			if(ArmourRandom == 0)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Viper_F';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Viper_F';
				kSoldier.kAppearance.nmThighs = 'VW_Thighs_Viper_F';
			}
			if(ArmourRandom == 1)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Underlay_Viper_F';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Underlay_F';
			}
		}
		if(SkinRandom == 1)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Neonate_F';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Neonate_F';
			if(ArmourRandom == 0)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Neonate_F';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Neonate_F';
				kSoldier.kAppearance.nmThighs = 'VW_Thighs_Viper_F';
			}
			if(ArmourRandom == 1)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Underlay_Neonate_F';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Underlay_F';
			}
		}
		if(SkinRandom == 2)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Naja_F';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Naja_F';
			if(ArmourRandom == 0)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Naja_F';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Naja_F';
				kSoldier.kAppearance.nmThighs = 'VW_Thighs_Viper_F';
			}
			if(ArmourRandom == 1)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Underlay_Naja_F';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Underlay_F';
			}
		}
		if(SkinRandom == 3)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Sidewinder_F';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Sidewinder_F';
			if(ArmourRandom == 0)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Sidewinder_F';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Sidewinder_F';
				kSoldier.kAppearance.nmThighs = 'VW_Thighs_Viper_F';
			}
			if(ArmourRandom == 2)
			{
				kSoldier.kAppearance.nmArms = 'VW_Arms_Underlay_Sidewinder_F';
				kSoldier.kAppearance.nmTorso = 'VW_Torso_Underlay_F';
			}
		}
	}

	kSoldier.kAppearance.nmTorso_Underlay = kSoldier.kAppearance.nmTorso;
	kSoldier.kAppearance.nmLegs_Underlay = kSoldier.kAppearance.nmLegs;
	kSoldier.kAppearance.nmArms_Underlay = kSoldier.kAppearance.nmArms;
	
	GenerateViperName( kSoldier.kAppearance.iGender, kSoldier.strFirstName, kSoldier.strLastName);

	return kSoldier;
}


function GenerateViperName( int iGender, out string strFirst, out string strLast, optional int iRace = -1 )
{

		if(iGender == eGender_Female)
		{
			strFirst = m_arrViperFFirstNames[`SYNC_RAND(m_arrViperFFirstNames.Length)];
		}
		else
		{
			strFirst = m_arrViperMFirstNames[`SYNC_RAND(m_arrViperMFirstNames.Length)];
		}

		strLast = m_arrViperLastNames[`SYNC_RAND(m_arrViperLastNames.Length)];
	
}