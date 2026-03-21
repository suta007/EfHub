local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = v_u_2.LocalPlayer
local v_u_4 = v_u_3.Character or v_u_3.CharacterAdded:Wait()
v_u_3.CharacterAdded:Connect(function(p5)
	-- upvalues: (ref) v_u_4
	v_u_4 = p5
end)
local v_u_6 = require(v1.Modules.PetServices.PetGiftingService)
require(v1.Modules.PetServices.PetUtilities)
local v_u_7 = require(v1.Modules.PetServices.ActivePetsService)
local v8 = require(v1.Data.PetRegistry)
local v_u_9 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
require(v1.Data.EnumRegistry.ItemTypeEnums)
local v_u_10 = v8.PetConfig.PET_GIFTING_CONFIG.MINIMUM_DISTANCE_FOR_GIFTING
local function v_u_18()
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_2, (ref) v_u_4, (copy) v_u_10
	v_u_7:GetClientPetState(v_u_3.Name)
	local v11 = nil
	local v12 = (1 / 0)
	local v13 = v_u_2:GetPlayers()
	local v14 = table.find(v13, v_u_3)
	if v14 then
		table.remove(v13, v14)
	end
	for _, v15 in v13 do
		local v16 = v15.Character
		if v16 then
			local v17 = (v16:GetPivot().Position - v_u_4:GetPivot().Position).Magnitude
			if v12 > v17 and v_u_10 > v17 then
				v11 = v16
				v12 = v17
			end
		end
	end
	return v11
end
local v_u_19 = Instance.new("ProximityPrompt")
v_u_19.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
v_u_19.KeyboardKeyCode = Enum.KeyCode.E
v_u_19.RequiresLineOfSight = false
v_u_19.HoldDuration = 0.5
v_u_19.MaxActivationDistance = (1 / 0)
v_u_19.Style = Enum.ProximityPromptStyle.Custom
v_u_19:SetAttribute("Theme", "ShadowedPrompt")
local v_u_20 = nil
v_u_19.Triggered:Connect(function()
	-- upvalues: (ref) v_u_20, (copy) v_u_2, (copy) v_u_6
	if not v_u_20 then
		return warn("No Closest")
	end
	local v21 = v_u_2:GetPlayerFromCharacter(v_u_20)
	if not v21 then
		return warn("No player")
	end
	v_u_6:GivePet(v21)
end)
require(v1.Data.DecimalNumberFormat)
task.spawn(function()
	-- upvalues: (ref) v_u_4, (copy) v_u_19, (copy) v_u_9, (copy) v_u_18, (ref) v_u_20
	while true do
		while true do
			task.wait(0.5)
			local v22 = v_u_4:FindFirstChildWhichIsA("Tool")
			if not v22 then
				break
			end
			if v22:GetAttribute("PET_UUID") then
				if v22:GetAttribute(v_u_9.Favorite) == true then
					v_u_19.Enabled = false
				else
					local v23 = v_u_18()
					v_u_20 = v23
					if v23 then
						v_u_19.ObjectText = v23.Name
						v_u_19.ActionText = ("Gift Pet %*"):format(v22.Name)
						v_u_19.Enabled = true
						v_u_19.Parent = v23.PrimaryPart or v23:FindFirstChildWhichIsA("BasePart", true)
					else
						v_u_19.Enabled = false
					end
				end
			else
				v_u_19.Enabled = false
			end
		end
		v_u_19.Enabled = false
	end
end)
return {}