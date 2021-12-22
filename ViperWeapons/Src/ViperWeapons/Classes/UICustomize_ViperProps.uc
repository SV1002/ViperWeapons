//---------------------------------------------------------------------------------------
//  FILE:    UICustomize_SparkProps.uc
//  AUTHOR:  Joe Weinhoffer --  2/22/2016
//  PURPOSE: Spark gear options list. 
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class UICustomize_ViperProps extends UICustomize_Props;

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
