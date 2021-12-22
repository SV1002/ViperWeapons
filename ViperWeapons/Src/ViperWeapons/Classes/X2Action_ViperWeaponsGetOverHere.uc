//-----------------------------------------------------------
// Used by the visualizer system to control a Visualization Actor
//-----------------------------------------------------------
class X2Action_ViperWeaponsGetOverHere extends X2Action_Fire;

//Cached info for the unit performing the action
//*************************************
var private CustomAnimParams Params;
var bool		ProjectileHit;
var XGWeapon	UseWeapon;
var XComWeapon	PreviousWeapon;
var XComUnitPawn FocusUnitPawn;
var bool		bPullingEnemy;
//*************************************

function Init()
{
	local XComGameState_Unit PrimaryTargetState;

	super.Init();

	History = `XCOMHISTORY;

	if( AbilityContext.InputContext.ItemObject.ObjectID > 0 )
	{
		UseWeapon = XGWeapon(History.GetGameStateForObjectID( AbilityContext.InputContext.ItemObject.ObjectID ).GetVisualizer());
	}	

	SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));
	PrimaryTargetState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));

	bPullingEnemy = SourceUnitState.GetTeam() != PrimaryTargetState.GetTeam();
}

function bool CheckInterrupted()
{
	return VisualizationBlockContext.InterruptionStatus == eInterruptionStatus_Interrupt;
}

function NotifyTargetsAbilityApplied()
{
	super.NotifyTargetsAbilityApplied();
	ProjectileHit = true;
}

simulated state Executing
{
	function StartTargetFaceViper()
	{
		local Vector FaceVector;
		
		FocusUnitPawn = XGUnit(PrimaryTarget).GetPawn();

		FaceVector = UnitPawn.Location - FocusUnitPawn.Location;
		FaceVector = Normal(FaceVector);

		FocusUnitPawn.m_kGameUnit.IdleStateMachine.ForceHeading(FaceVector);
	}

Begin:
	PreviousWeapon = XComWeapon(UnitPawn.Weapon);
	UnitPawn.SetCurrentWeapon(XComWeapon(UseWeapon.m_kEntity));

	Unit.CurrentFireAction = self;
	Params.AnimName = (bPullingEnemy) ? 'NO_Strangle_CastStartA' : 'NO_Strangle_AllyCastStartA';
	UnitPawn.GetAnimTreeController().PlayFullBodyDynamicAnim(Params);

	//Make the target face us
	StartTargetFaceViper();
	Sleep(0.1f);

	//Wait for our turn to complete so that we are facing mostly the right direction when the target's RMA animation starts
	while(FocusUnitPawn.m_kGameUnit.IdleStateMachine.IsEvaluatingStance())
	{
		Sleep(0.01f);
	}

	while (!ProjectileHit)
	{
		Sleep(0.01f);
	}

	Params.AnimName = (bPullingEnemy) ? 'NO_Strangle_CastStopA' : 'NO_Strangle_AllyCastStopA';
	FinishAnim(UnitPawn.GetAnimTreeController().PlayFullBodyDynamicAnim(Params));

	FocusUnitPawn.m_kGameUnit.IdleStateMachine.CheckForStanceUpdateOnIdle();

	UnitPawn.SetCurrentWeapon(PreviousWeapon);

	CompleteAction();
}

event bool BlocksAbilityActivation()
{
	return true;
}