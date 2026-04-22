local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("SoundService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = v2.LocalPlayer
local v6 = require(v_u_1.Modules.DataService)
local v7 = require(v_u_1.Data.SettingsRegistry)
local v_u_8 = require(v_u_1.Modules.Settings.SettingsService)
require(v_u_1.Modules.CreateTagHandler)
local v_u_9 = require(v_u_1.Modules.ConfirmationPromptController)
require(v_u_1.Modules.userprint)("dev_josep")
local v28 = {
	["GearShopButton"] = function(_) end,
	["PetShopButton"] = function(_) end,
	["Audio"] = function(p10)
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		v_u_4:Create(v_u_3.Music, TweenInfo.new(0.25), {
			["Volume"] = p10 and 1 or 0
		}):Play()
	end,
	["Sounds"] = function(p11)
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		v_u_4:Create(v_u_3.Music.SFX, TweenInfo.new(0.25), {
			["Volume"] = p11 and 1 or 0
		}):Play()
	end,
	["Music"] = function(p12)
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		v_u_4:Create(v_u_3.Music.Tunes, TweenInfo.new(0.25), {
			["Volume"] = p12 and 1 or 0
		}):Play()
	end,
	["FavoriteIcons"] = function(p13)
		-- upvalues: (copy) v_u_5
		if v_u_5:GetAttribute("FavoriteIconsEnabled") == nil then
			v_u_5:SetAttribute("FavoriteIconsEnabled", true)
		end
		v_u_5:SetAttribute("FavoriteIconsEnabled", p13)
	end,
	["YourFarmIcon"] = function(p14)
		-- upvalues: (copy) v_u_1
		require(v_u_1.Modules.OwnerTagHandler):SettingUpdated(p14)
	end,
	["AutoCloseActivePetsUI"] = function(p15)
		game:GetService("Players").LocalPlayer:SetAttribute("AutoCloseActivePetsUI", p15)
	end,
	["CropMutationVFX"] = function(p16)
		-- upvalues: (copy) v_u_8
		local v17 = game:GetService("Players").LocalPlayer
		if v_u_8:GetSetting("PerformanceMode") and p16 == true then
			v17:SetAttribute("CropMutationVFX", false)
		else
			v17:SetAttribute("CropMutationVFX", p16)
		end
	end,
	["PetMutationVFX"] = function(p18)
		-- upvalues: (copy) v_u_8
		local v19 = game:GetService("Players").LocalPlayer
		if v_u_8:GetSetting("PerformanceMode") and p18 == true then
			v19:SetAttribute("PetMutationVFX", false)
		else
			v19:SetAttribute("PetMutationVFX", p18)
		end
	end,
	["PetScaling"] = function(p20)
		game:GetService("Players").LocalPlayer:SetAttribute("PetScaling", p20)
	end,
	["KeepPetOnGround"] = function(p21)
		-- upvalues: (copy) v_u_8
		local v22 = game:GetService("Players").LocalPlayer
		if v_u_8:GetSetting("PerformanceMode") and p21 == true then
			v22:SetAttribute("KeepPetOnGround", false)
		else
			v22:SetAttribute("KeepPetOnGround", p21)
		end
	end,
	["LowerPlantFXQuality"] = function(p23)
		-- upvalues: (copy) v_u_8
		local v24 = game:GetService("Players").LocalPlayer
		if v_u_8:GetSetting("PerformanceMode") and p23 == true then
			v24:SetAttribute("LowerPlantFXQuality", false)
		else
			v24:SetAttribute("LowerPlantFXQuality", p23)
		end
	end,
	["PerformanceMode"] = function(p25)
		-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_9
		local v_u_26 = game:GetService("Players").LocalPlayer
		if not p25 and v_u_26:GetAttribute("PerformanceMode") == true then
			require(game.ReplicatedStorage.Modules.Notification):CreateNotification("Please rejoin for Performance Mode to be fully disabled!")
		end
		if p25 then
			if p25 == true and (v_u_5:GetAttribute("PerformanceMode") == false and v_u_8:GetSetting("PerformanceMode") == true) then
				v_u_9:Open({
					["Title"] = "Performance Mode",
					["Header"] = "Are you sure you want to enable Performance Mode?",
					["Middle"] = "This should increase FPS but will disable most Mutation, Plant, and Weather VFX!",
					["Footer"] = "(NOTE: If you turn off this mode, You will have to rejoin to fully disable Performance Mode)"
				}, {
					["ConfirmCallback"] = function()
						-- upvalues: (copy) v_u_26, (ref) v_u_8
						v_u_26:SetAttribute("PerformanceMode", true)
						v_u_8:SetSetting("KeepPetOnGround", true)
						v_u_8:SetSetting("LowerPlantFXQuality", true)
						v_u_8:SetSetting("CropMutationVFX", false)
						v_u_8:SetSetting("PetMutationVFX", false)
					end,
					["RejectCallback"] = function()
						-- upvalues: (ref) v_u_8
						v_u_8:SetSetting("PerformanceMode", false)
					end
				})
			elseif p25 == true and v_u_8:GetSetting("PerformanceMode") == true then
				v_u_26:SetAttribute("PerformanceMode", true)
				v_u_8:SetSetting("KeepPetOnGround", true)
				v_u_8:SetSetting("LowerPlantFXQuality", true)
				v_u_8:SetSetting("CropMutationVFX", false)
				v_u_8:SetSetting("PetMutationVFX", false)
			end
		else
			v_u_26:SetAttribute("PerformanceMode", false)
			return
		end
	end,
	["ToggleNotifications"] = function(p27)
		game:GetService("Players").LocalPlayer:SetAttribute("ToggleNotifications", p27)
	end
}
local v29 = {}
for v_u_30 in v7 do
	local v_u_31 = v28[v_u_30]
	if v_u_31 then
		v6:GetPathSignal((("Settings/%*"):format(v_u_30))):Connect(function()
			-- upvalues: (copy) v_u_31, (copy) v_u_8, (copy) v_u_30
			v_u_31(v_u_8:GetSetting(v_u_30))
		end)
		if v_u_30 ~= "ShowDetails" then
			v_u_31((v_u_8:GetSetting(v_u_30)))
		end
	end
end
return v29