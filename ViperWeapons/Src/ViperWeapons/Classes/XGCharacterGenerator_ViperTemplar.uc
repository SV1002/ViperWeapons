class XGCharacterGenerator_ViperTemplar extends XGCharacterGenerator
	dependson(X2StrategyGameRulesetDataStructures);

// American
var localized array<string> m_arrViperMFirstNames;
var localized array<string> m_arrViperFFirstNames;
var localized array<string> m_arrViperLastNames;

function TSoldier CreateTSoldier( optional name CharacterTemplateName, optional EGender eForceGender, optional name nmCountry = '', optional int iRace = -1, optional name ArmorName )
{
	local XComLinearColorPalette ArmorPalette, EyeColourPalette;
	local int SkinRandom;
	local int TorsoDecoRandom;
	local int TailWrapRandom;
	local int FacePropUpperRandom;
	local int HelmetRandom;
	local int ArmDecoRandom;

	SkinRandom = `SYNC_RAND(4);
	TorsoDecoRandom = `SYNC_RAND(2);
	TailWrapRandom = `SYNC_RAND(4);
	FacePropUpperRandom = `SYNC_RAND(11);
	HelmetRandom = `SYNC_RAND(7);
	ArmDecoRandom = `SYNC_RAND(5);
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

	if(kSoldier.kAppearance.iGender == eGender_Male)
	{
		if(SkinRandom == 0)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Viper_M_T';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Viper_M_T';
			kSoldier.kAppearance.nmLeftArm = 'VW_LeftArm_HOR_LT_Viper_M_T';
			kSoldier.kAppearance.nmRightArm = 'VW_RightArm_HOR_LT_Viper_M_T';
			kSoldier.kAppearance.nmTorso = 'VW_Torso_HOR_Cnv_A_M_T';
			if(TorsoDecoRandom == 0)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_A_M_T';
			}
			if(TorsoDecoRandom == 1)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_B_M_T';
			}
		}
		if(SkinRandom == 1)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Neonate_M_T';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Neonate_M_T';
			kSoldier.kAppearance.nmLeftArm = 'VW_LeftArm_HOR_LT_Neonate_M_T';
			kSoldier.kAppearance.nmRightArm = 'VW_RightArm_HOR_LT_Neonate_M_T';
			kSoldier.kAppearance.nmTorso = 'VW_Torso_HOR_Cnv_A_M_T';
			if(TorsoDecoRandom == 0)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_A_M_T';
			}
			if(TorsoDecoRandom == 1)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_B_M_T';
			}
		}
		if(SkinRandom == 2)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Naja_M_T';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Naja_M_T';
			kSoldier.kAppearance.nmLeftArm = 'VW_LeftArm_HOR_LT_Naja_M_T';
			kSoldier.kAppearance.nmRightArm = 'VW_RightArm_HOR_LT_Naja_M_T';
			kSoldier.kAppearance.nmTorso = 'VW_Torso_HOR_Cnv_A_M_T';
			if(TorsoDecoRandom == 0)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_A_M_T';
			}
			if(TorsoDecoRandom == 1)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_B_M_T';
			}
		}
		if(SkinRandom == 3)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Sidewinder_M_T';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Sidewinder_M_T';
			kSoldier.kAppearance.nmLeftArm = 'VW_LeftArm_HOR_LT_Sidewinder_M_T';
			kSoldier.kAppearance.nmRightArm = 'VW_RightArm_HOR_LT_Sidewinder_M_T';
			kSoldier.kAppearance.nmTorso = 'VW_Torso_HOR_Cnv_A_M_T';
			if(TorsoDecoRandom == 0)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_A_M_T';
			}
			if(TorsoDecoRandom == 1)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_B_M_T';
			}
		}
		if(TailWrapRandom == 0)
		{
			kSoldier.kAppearance.nmShins = 'VW_Shins_Invisible_M_T';
		}
		if(TailWrapRandom == 1)
		{
			kSoldier.kAppearance.nmShins = 'VW_Shins_CS_A_M_T';
		}
		if(TailWrapRandom == 2)
		{
			kSoldier.kAppearance.nmShins = 'VW_Shins_CS_B_M_T';
		}
		if(TailWrapRandom == 3)
		{
			kSoldier.kAppearance.nmShins = 'VW_Shins_Chopper_M_T';
		}
		if(FacePropUpperRandom == 0)
		{
			kSoldier.kAppearance.nmFacePropUpper = '';
		}
		if(FacePropUpperRandom == 1)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_NerdGlasses_M_T';
		}
		if(FacePropUpperRandom == 2)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_Aviators_M_T';
		}
		if(FacePropUpperRandom == 3)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_ClassySunglasses_M_T';
		}
		if(FacePropUpperRandom == 4)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_Eyepatch_M_T';
		}
		if(FacePropUpperRandom == 5)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_FancyGlasses_M_T';
		}
		if(FacePropUpperRandom == 6)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_HippyGlasses_M_T';
		}
		if(FacePropUpperRandom == 7)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_HippySunglasses_M_T';
		}
		if(FacePropUpperRandom == 8)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_Monocle_M_T';
		}
		if(FacePropUpperRandom == 9)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_PlainGlasses_M_T';
		}
		if(FacePropUpperRandom == 10)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_SportSunglasses_M_T';
		}
		if(HelmetRandom == 0)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_NoHelmet_M_T';
		}
		if(HelmetRandom == 1)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Viper_A_M_T';
		}
		if(HelmetRandom == 2)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Viper_B_M_T';
		}
		if(HelmetRandom == 3)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Viper_C_M_T';
		}
		if(HelmetRandom == 4)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Torque_A_M_T';
		}
		if(HelmetRandom == 5)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Torque_B_M_T';
		}
		if(HelmetRandom == 6)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Torque_C_M_T';
		}
		if(ArmDecoRandom == 0)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_Invisible_M_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_Invisible_M_T';
		}
		if(ArmDecoRandom == 1)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_HOR_Tmp_A_M_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_HOR_Tmp_A_M_T';
		}
		if(ArmDecoRandom == 2)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_HOR_Tmp_B_M_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_HOR_Tmp_B_M_T';
		}
		if(ArmDecoRandom == 3)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_HOR_Tmp_C_M_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_HOR_Tmp_C_M_T';
		}
		if(ArmDecoRandom == 4)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_HOR_Cnv_A_M_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_HOR_Cnv_A_M_T';
		}
	}

	if(kSoldier.kAppearance.iGender == eGender_Female)
	{
		if(SkinRandom == 0)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Viper_F_T';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Viper_F_T';
			kSoldier.kAppearance.nmLeftArm = 'VW_LeftArm_HOR_LT_Viper_F_T';
			kSoldier.kAppearance.nmRightArm = 'VW_RightArm_HOR_LT_Viper_F_T';
			kSoldier.kAppearance.nmTorso = 'VW_Torso_HOR_Cnv_A_F_T';
			if(TorsoDecoRandom == 0)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_A_F_T';
			}
			if(TorsoDecoRandom == 1)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_B_F_T';
			}
		}
		if(SkinRandom == 1)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Neonate_F_T';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Neonate_F_T';
			kSoldier.kAppearance.nmLeftArm = 'VW_LeftArm_HOR_LT_Neonate_F_T';
			kSoldier.kAppearance.nmRightArm = 'VW_RightArm_HOR_LT_Neonate_F_T';
			kSoldier.kAppearance.nmTorso = 'VW_Torso_HOR_Cnv_A_F_T';
			if(TorsoDecoRandom == 0)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_A_F_T';
			}
			if(TorsoDecoRandom == 1)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_B_F_T';
			}
		}
		if(SkinRandom == 2)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Naja_F_T';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Naja_F_T';
			kSoldier.kAppearance.nmLeftArm = 'VW_LeftArm_HOR_LT_Naja_F_T';
			kSoldier.kAppearance.nmRightArm = 'VW_RightArm_HOR_LT_Naja_F_T';
			kSoldier.kAppearance.nmTorso = 'VW_Torso_HOR_Cnv_A_F_T';
			if(TorsoDecoRandom == 0)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_A_F_T';
			}
			if(TorsoDecoRandom == 1)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_B_F_T';
			}
		}
		if(SkinRandom == 3)
		{
			kSoldier.kAppearance.nmHead = 'VW_Head_Sidewinder_F_T';
			kSoldier.kAppearance.nmLegs = 'VW_Legs_Sidewinder_F_T';
			kSoldier.kAppearance.nmLeftArm = 'VW_LeftArm_HOR_LT_Sidewinder_F_T';
			kSoldier.kAppearance.nmRightArm = 'VW_RightArm_HOR_LT_Sidewinder_F_T';
			kSoldier.kAppearance.nmTorso = 'VW_Torso_HOR_Cnv_A_F_T';
			if(TorsoDecoRandom == 0)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_A_F_T';
			}
			if(TorsoDecoRandom == 1)
			{
				kSoldier.kAppearance.nmTorsoDeco = 'VW_TorsoDeco_HOR_Tmp_B_F_T';
			}
		}
		if(TailWrapRandom == 0)
		{
			kSoldier.kAppearance.nmShins = 'VW_Shins_Invisible_F_T';
		}
		if(TailWrapRandom == 1)
		{
			kSoldier.kAppearance.nmShins = 'VW_Shins_CS_A_F_T';
		}
		if(TailWrapRandom == 2)
		{
			kSoldier.kAppearance.nmShins = 'VW_Shins_CS_B_F_T';
		}
		if(TailWrapRandom == 3)
		{
			kSoldier.kAppearance.nmShins = 'VW_Shins_Chopper_F_T';
		}
		if(FacePropUpperRandom == 0)
		{
			kSoldier.kAppearance.nmFacePropUpper = '';
		}
		if(FacePropUpperRandom == 1)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_NerdGlasses_F_T';
		}
		if(FacePropUpperRandom == 2)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_Aviators_F_T';
		}
		if(FacePropUpperRandom == 3)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_ClassySunglasses_F_T';
		}
		if(FacePropUpperRandom == 4)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_Eyepatch_F_T';
		}
		if(FacePropUpperRandom == 5)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_FancyGlasses_F_T';
		}
		if(FacePropUpperRandom == 6)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_HippyGlasses_F_T';
		}
		if(FacePropUpperRandom == 7)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_HippySunglasses_F_T';
		}
		if(FacePropUpperRandom == 8)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_Monocle_F_T';
		}
		if(FacePropUpperRandom == 9)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_PlainGlasses_F_T';
		}
		if(FacePropUpperRandom == 10)
		{
			kSoldier.kAppearance.nmFacePropUpper = 'VW_FacePropsUpper_SportSunglasses_F_T';
		}
		if(HelmetRandom == 0)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_NoHelmet_F_T';
		}
		if(HelmetRandom == 1)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Viper_A_F_T';
		}
		if(HelmetRandom == 2)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Viper_B_F_T';
		}
		if(HelmetRandom == 3)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Viper_C_F_T';
		}
		if(HelmetRandom == 4)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Torque_A_F_T';
		}
		if(HelmetRandom == 5)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Torque_B_F_T';
		}
		if(HelmetRandom == 6)
		{
			kSoldier.kAppearance.nmHelmet = 'VW_Helmet_Torque_C_F_T';
		}
		if(ArmDecoRandom == 0)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_Invisible_F_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_Invisible_F_T';
		}
		if(ArmDecoRandom == 1)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_HOR_Tmp_A_F_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_HOR_Tmp_A_F_T';
		}
		if(ArmDecoRandom == 2)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_HOR_Tmp_B_F_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_HOR_Tmp_B_F_T';
		}
		if(ArmDecoRandom == 3)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_HOR_Tmp_C_F_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_HOR_Tmp_C_F_T';
		}
		if(ArmDecoRandom == 4)
		{
			kSoldier.kAppearance.nmLeftArmDeco = 'VW_LeftArmDeco_HOR_Cnv_A_F_T';
			kSoldier.kAppearance.nmRightArmDeco = 'VW_RightArmDeco_HOR_Cnv_A_F_T';
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