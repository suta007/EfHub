local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
game:GetService("CollectionService")
local v_u_3 = require(v1.Modules.UpdateService)
local v4 = require(v1.Modules.CreateTagHandler)
local v_u_5 = v1.GameEvents.FeedNPC_RE
require(v1.Data.NPCLevels.NPCLevelData.NPCLevelTypes)
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
	v_u_8.Name = "FeedProx"
	v_u_8.ActionText = "Feed"
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
			v_u_5:FireServer(v_u_9.Name)
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
		v13 = v13:HasTag("FoodTool")
	end
	v_u_12 = v13
end
local v_u_15 = {}
v4({
	["Tag"] = "Feedable",
	["OnInstanceAdded"] = function(p16)
		-- upvalues: (copy) v_u_15
		local v17 = v_u_15
		table.insert(v17, p16)
	end,
	["OnInstanceRemoved"] = function(p18)
		-- upvalues: (copy) v_u_15
		local v19 = table.find(v_u_15, p18)
		if v19 then
			table.remove(v_u_15, v19)
		end
	end
})
v_u_7.ChildAdded:Connect(v14)
v_u_7.ChildRemoved:Connect(v14)
local v20 = v_u_7:FindFirstChildWhichIsA("Tool")
if v20 then
	v20 = v20:HasTag("FoodTool")
end
v_u_12 = v20
task.spawn(function()
	-- upvalues: (ref) v_u_10, (copy) v_u_3, (ref) v_u_8, (copy) v_u_15, (copy) v_u_6, (ref) v_u_9, (ref) v_u_12, (copy) v_u_11
	while true do
		task.wait(0.1)
		for v21, v22 in v_u_10 do
			if v22 then
				v21.Enabled = true
			end
		end
		v_u_10 = {}
		if v_u_3:IsHiddenFromUpdate("NPCLevels") then
			if v_u_8 then
				v_u_8.Enabled = false
			end
		else
			local v23 = (1 / 0)
			local v24 = nil
			local v25 = "NPC"
			for _, v26 in v_u_15 do
				local v27 = nil
				if v26:IsA("BasePart") then
					v27 = v26
				elseif v26:IsA("Model") then
					v27 = v26.PrimaryPart
				end
				if v27 then
					if not v_u_3:IsHiddenFromUpdate("NPCBirthday") or v26.Name == "Sam" then
						local v28 = (v_u_6.Character:GetPivot().Position - v27.Position).Magnitude
						if v28 < 20 and v28 < v23 then
							v_u_9 = v26
							v25 = v26.Name
							v24 = v27
							v23 = v28
						end
					end
				else
					warn((("Feedable %* has no BasePart!"):format((v26:GetFullName()))))
				end
			end
			if v24 and v_u_12 then
				local v29 = 10
				for _, v30 in v_u_9:GetDescendants() do
					if v30:IsA("ProximityPrompt") and (not v_u_10[v30] and v30 ~= v_u_8) then
						v_u_10[v30] = v30.Enabled
						v30.Enabled = false
						if v29 < v30.MaxActivationDistance then
							v29 = v30.MaxActivationDistance
						end
					end
				end
				v_u_11().Parent = v24
				v_u_11().Enabled = true
				v_u_11().ObjectText = v25
				v_u_11().MaxActivationDistance = v29
			elseif v_u_8 then
				v_u_8.Enabled = false
			end
		end
	end
end)