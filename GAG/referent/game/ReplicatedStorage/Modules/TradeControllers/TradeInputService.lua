local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = v_u_2.LocalPlayer
local v_u_4 = v_u_3.Character or v_u_3.CharacterAdded:Wait()
v_u_3.CharacterAdded:Connect(function(p5)
	-- upvalues: (ref) v_u_4
	v_u_4 = p5
end)
local v_u_6 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_7 = require(v1.Modules.TradeControllers.TradeRequestController)
local v_u_8 = require(v1.Data.EnumRegistry.ItemTypeEnums)
local function v_u_16()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (ref) v_u_4
	local v9 = nil
	local v10 = (1 / 0)
	local v11 = v_u_2:GetPlayers()
	local v12 = table.find(v11, v_u_3)
	if v12 then
		table.remove(v11, v12)
	end
	for _, v13 in v11 do
		local v14 = v13.Character
		if v14 then
			local v15 = (v14:GetPivot().Position - v_u_4:GetPivot().Position).Magnitude
			if v10 > v15 and v15 < 8 then
				v9 = v14
				v10 = v15
			end
		end
	end
	return v9
end
local v_u_17 = Instance.new("ProximityPrompt")
v_u_17.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
v_u_17.KeyboardKeyCode = Enum.KeyCode.E
v_u_17.RequiresLineOfSight = false
v_u_17.HoldDuration = 0.5
v_u_17.MaxActivationDistance = (1 / 0)
local v_u_18 = nil
v_u_17.Triggered:Connect(function()
	-- upvalues: (ref) v_u_18, (copy) v_u_2, (copy) v_u_7
	if not v_u_18 then
		return warn("No Closest")
	end
	local v19 = v_u_2:GetPlayerFromCharacter(v_u_18)
	if not v19 then
		return warn("No player")
	end
	v_u_7:SendRequest(v19)
end)
require(v1.Data.DecimalNumberFormat)
task.spawn(function()
	-- upvalues: (ref) v_u_4, (copy) v_u_17, (copy) v_u_6, (copy) v_u_8, (copy) v_u_16, (ref) v_u_18
	while true do
		while true do
			task.wait(0.5)
			local v20 = v_u_4:FindFirstChildWhichIsA("Tool")
			if not v20 then
				break
			end
			if v20:GetAttribute(v_u_6.ITEM_TYPE) == v_u_8["Trading Ticket"] then
				local v21 = v_u_16()
				v_u_18 = v21
				if v21 then
					v_u_17.ObjectText = v21.Name
					v_u_17.ActionText = "Send Trade Request"
					v_u_17.Enabled = true
					v_u_17.Parent = v21.PrimaryPart or v21:FindFirstChildWhichIsA("BasePart", true)
				else
					v_u_17.Enabled = false
				end
			else
				v_u_17.Enabled = false
			end
		end
		v_u_17.Enabled = false
	end
end)
return {}