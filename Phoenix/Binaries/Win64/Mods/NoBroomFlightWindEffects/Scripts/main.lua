--Author: yakuzadeso

function NoBroomFlightWindEffects()
	local broomflightwind = StaticFindObject(
		"/Game/VFX/Mechanics/Broom/BP_BroomFlightVFXActor.BP_BroomFlightVFXActor_C:PostProcess_GEN_VARIABLE")

	if not broomflightwind:IsValid() then
		ExecuteWithDelay(2000, NoBroomFlightWindEffects)
		return
	end
	print("NoBroomFlightWindEffects is On!")
	broomflightwind.bVisible = false
	broomflightwind.bEnabled = false
	broomflightwind.bHiddenInGame = true
end

local shouldInitTheMod = false

NotifyOnNewObject("/Script/Phoenix.Loadingcreen", function(self)
	shouldInitTheMod = true
	print("NoBroomFlightWindEffects is starting up!")
end)

RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context, NewPawn)
	if shouldInitTheMod then
		shouldInitTheMod = false

		print("NoBroomFlightWindEffects hooked on load/reload succesfully!")

		NoBroomFlightWindEffects()
	end
end)
