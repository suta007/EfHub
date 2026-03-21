local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("CollectionService")
local v_u_4 = require(v1.Modules.UpdateService)
local v_u_5 = v1.GameEvents.ChristmasEvent.ChristmasGiftNPC
local v_u_6 = v2.LocalPlayer
local v_u_7 = v_u_6.Character or v_u_6.CharacterAdded:Wait()
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = {}
local function v_u_11()
	-- upvalues: (ref) v_u_8, (ref) v_u_9, (copy) v_u_5
	if v_u_8 then
		return v_u_8
	end
	v_u_8 = Instance.new("ProximityPrompt")
	v_u_8.Name = "ChristmasGiftProx"
	v_u_8.ActionText = "Gift"
	v_u_8.ObjectText = "NPC"
	v_u_8.HoldDuration = 1
	v_u_8.RequiresLineOfSight = false
	v_u_8.MaxActivationDistance = 11
	v_u_8.Enabled = false
	v_u_8.Style = Enum.ProximityPromptStyle.Custom
	v_u_8:SetAttribute("Theme", "ShadowedPrompt")
	v_u_8.Triggered:Connect(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_5
		if v_u_9 then
			v_u_5:FireServer(v_u_9, v_u_9.Name)
		else
			warn("No closest feedable found!")
		end
	end)
	return v_u_8
end
local v_u_12 = false
local function v14()
	-- upvalues: (copy) v_u_7, (ref) v_u_12
	local v13 = v_u_7:FindFirstChildWhichIsA("Tool")
	if v13 then
		v13 = v13:HasTag("FruitTool")
	end
	v_u_12 = v13
end
v_u_7.ChildAdded:Connect(v14)
v_u_7.ChildRemoved:Connect(v14)
local v15 = v_u_7:FindFirstChildWhichIsA("Tool")
if v15 then
	v15 = v15:HasTag("FruitTool")
end
v_u_12 = v15
task.spawn(function()
	-- upvalues: (ref) v_u_10, (copy) v_u_4, (ref) v_u_8, (copy) v_u_3, (copy) v_u_6, (ref) v_u_9, (ref) v_u_12, (copy) v_u_11
	while true do
		task.wait(0.1)
		for v16, v17 in v_u_10 do
			if v17 then
				v16.Enabled = true
			end
		end
		v_u_10 = {}
		if v_u_4:IsHiddenFromUpdate("Christmas Gift Counter") then
			if v_u_8 then
				v_u_8.Enabled = false
			end
		else
			local v18 = (1 / 0)
			local v19 = nil
			local v20 = "NPC"
			for _, v21 in v_u_3:GetTagged("ChristmasGiftable") do
				local v22 = nil
				if v21:IsA("BasePart") then
					v22 = v21
				elseif v21:IsA("Model") then
					v22 = v21.PrimaryPart
				end
				if v22 then
					local v23 = (v_u_6.Character:GetPivot().Position - v22.Position).Magnitude
					if v23 < 20 and v23 < v18 then
						v_u_9 = v21
						v20 = v21.Name
						v19 = v22
						v18 = v23
					end
				else
					warn((("ChristmasGiftable %* has no BasePart!"):format((v21:GetFullName()))))
				end
			end
			if v19 and v_u_12 then
				local v24 = 10
				for _, v25 in v_u_9:GetDescendants() do
					if v25:IsA("ProximityPrompt") and (not v_u_10[v25] and v25 ~= v_u_8) then
						v_u_10[v25] = v25.Enabled
						v25.Enabled = false
						if v24 < v25.MaxActivationDistance then
							v24 = v25.MaxActivationDistance
						end
					end
				end
				v_u_11().Parent = v19
				v_u_11().Enabled = true
				v_u_11().ObjectText = v20
				v_u_11().MaxActivationDistance = v24
			elseif v_u_8 then
				v_u_8.Enabled = false
			end
		end
	end
end)