local v_u_1 = game:GetService("Stats")
local v2 = game:GetService("Players")
game:GetService("UserInputService")
local v3 = game:GetService("ReplicatedStorage")
require(v3.Modules.PlatformProvider)
local v_u_4 = require(v3.Modules.Settings.SettingsService)
local v_u_5 = require(v3.Modules.OptimisationControllers.IsMobile)
local v_u_6 = require(v3.Modules.ConfirmationPromptController)
require(v3.Modules.OptimisationControllers.IsBadDeviceHeuristic)
local v_u_7 = require(v3.Modules.OptimisationControllers.FPSHandler)
local v_u_8 = v2.LocalPlayer
local v_u_9 = { 224410 }
local v_u_11 = {
	["IsLowEndDevice"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_9, (copy) v_u_8
		if UserSettings().GameSettings.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
			return false
		end
		local v10 = v_u_5()
		if v10 then
			if v_u_1:GetTotalMemoryUsageMb() <= 1500 then
				v10 = UserSettings().GameSettings.SavedQualityLevel.Value <= Enum.SavedQualitySetting.QualityLevel3.Value
			else
				v10 = false
			end
		end
		return table.find(v_u_9, v_u_8.UserId) and true or v10
	end,
	["OpenPrompt"] = function(_)
		-- upvalues: (copy) v_u_6, (copy) v_u_4
		v_u_6:Open({
			["Title"] = "Performance Mode",
			["Header"] = "We\'ve detected your device to be running on low FPS, would you like to enable Performance Mode?",
			["Middle"] = "This should increase FPS but will disable most Mutation, Plant, and Weather VFX.",
			["Footer"] = "(This can be turned off in the Settings menu, but you will need to rejoin to fully disable Performance Mode)"
		}, {
			["ConfirmCallback"] = function()
				-- upvalues: (ref) v_u_4
				v_u_4:SetSetting("PerformanceMode", true)
			end
		})
	end
}
task.defer(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_11
	if not v_u_4:GetSetting("PerformanceMode") then
		task.wait(10)
		local v12 = 0
		while not v_u_8:GetAttribute("FarmFullyLoaded") and v12 < 300 do
			task.wait(1)
			v12 = v12 + 1
		end
		v_u_7:EnableFPSTracker()
		local v13 = v_u_5() and 15 or 10
		local v14 = workspace:GetServerTimeNow()
		local v15 = 0
		local v16 = 0
		local v17 = 0
		local v18 = 0
		local v19 = 0
		while workspace:GetServerTimeNow() <= v14 + 90 do
			local v20 = v_u_7:GetCurrentFPS()
			workspace:GetServerTimeNow()
			v15 = v15 + 0.5
			if v20 <= v13 then
				v16 = v16 + 1
				if workspace:GetServerTimeNow() <= v14 + 30 then
					v17 = v17 + 1
				end
			end
			v18 = v18 + 1
			v19 = v19 + v20
			task.wait(0.5)
		end
		local v21 = v19 / v18
		local v22 = math.floor(v21)
		if v16 >= 135 then
			v_u_8:SetAttribute("PerformanceMode", true)
			v_u_4:SetSetting("CropMutationVFX", false)
			v_u_4:SetSetting("PetMutationVFX", false)
			v_u_4:SetSetting("PetScaling", false)
			v_u_4:SetSetting("KeepPetOnGround", true)
			v_u_4:SetSetting("LowerPlantFXQuality", true)
			v_u_4:SetSetting("PerformanceMode", true)
		elseif v17 >= 45 then
			v_u_11:OpenPrompt()
		end
		v_u_8:SetAttribute("AverageFPSAfterLoad", v22)
		v_u_7:DisableFPSTracker()
	end
end)
return v_u_11