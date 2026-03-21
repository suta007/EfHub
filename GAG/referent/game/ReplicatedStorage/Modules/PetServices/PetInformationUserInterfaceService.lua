game:GetService("Selection")
local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
game:GetService("CollectionService")
local v4 = game:GetService("RunService")
game:GetService("UserInputService")
game:GetService("GuiService")
local v_u_5 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_5
	v_u_5 = workspace.CurrentCamera
end)
local v_u_6 = require(v2.Modules.PetServices.ActivePetsService)
local v7 = require(v2.Modules.WaitForDescendant)
local v8 = require(v2.Data.PetRegistry)
local v_u_9 = require(v2.Modules.PetServices.PetUtilities)
local v_u_10 = v8.PetList
local v_u_11 = v8.PetConfig.XP_CONFIG.MAX_LEVEL
local v_u_12 = v1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PetUI"):WaitForChild("PetInformationUI")
local v_u_13 = v7(v_u_12, "CanvasGroup")
local v_u_14 = v7(v_u_12, "DROP_SHADOW")
local v_u_15 = v7(v_u_12, "PET_TEXT")
local v_u_16 = v7(v_u_12, "LEVEL_TEXT")
local v_u_17 = v7(v_u_12, "HUNGER_BAR")
local v_u_18 = v7(v_u_12, "LEVEL_PROGRESS_BAR")
local v_u_19 = v7(v_u_12, "LEVEL_ICON")
local v_u_20 = v7(v_u_12, "LEVEL_MAXED_TEXT")
local v_u_21 = v7(v_u_12, "CANVAS_STROKE")
local v_u_40 = {
	["Active"] = false,
	["Target"] = nil,
	["SetTarget"] = function(_, p22)
		-- upvalues: (copy) v_u_40, (copy) v_u_6, (copy) v_u_15, (copy) v_u_16
		v_u_40.Target = p22
		if p22 then
			local v23 = v_u_6:GetPetDataFromPetObject(p22)
			if v23 then
				local v24 = v23.PetType
				local v25 = v23.PetData
				local v26 = v25.Name
				if v26 == "" then
					v26 = nil
				end
				v_u_15.Text = v26 or v24
				v_u_16.Text = ("Age %*"):format(v25.Level)
				v_u_40:Update(0)
			end
		else
			return
		end
	end,
	["Update"] = function(_, p27)
		-- upvalues: (copy) v_u_40, (copy) v_u_6, (copy) v_u_10, (copy) v_u_3, (copy) v_u_17, (copy) v_u_9, (copy) v_u_11, (copy) v_u_18, (copy) v_u_20, (copy) v_u_19
		local v28 = v_u_40.Target
		if v28 then
			local v29 = v_u_6:GetPetDataFromPetObject(v28)
			if v29 then
				local v30 = v29.PetType
				local v31 = v29.PetData
				local v32 = v_u_10[v30].DefaultHunger
				local v33 = v31.Hunger / v32
				v_u_3:Create(v_u_17, TweenInfo.new(p27 or 0.2), {
					["Size"] = UDim2.fromScale(v33, 1)
				}):Play()
				local v34 = v31.Level
				local v35 = v_u_9:GetCurrentLevelXPCost(v34)
				local v36 = v_u_11 <= v34
				local v37 = v36 and 1 or (v31.LevelProgress or 0) / v35
				v_u_3:Create(v_u_18, TweenInfo.new(p27 or 0.2), {
					["Size"] = UDim2.fromScale(v37, 1)
				}):Play()
				v_u_20.Visible = v36
				v_u_19.Visible = not v36
			end
		else
			return
		end
	end,
	["Toggle"] = function(_, p38)
		-- upvalues: (copy) v_u_40, (copy) v_u_3, (copy) v_u_13, (copy) v_u_14, (copy) v_u_21
		if v_u_40.Active ~= p38 then
			v_u_40.Active = p38
			local v39 = v_u_3:Create(v_u_13, TweenInfo.new(0.15), {
				["GroupTransparency"] = p38 and 0 or 1
			})
			v_u_3:Create(v_u_14, TweenInfo.new(0.15), {
				["ImageTransparency"] = p38 and 0.6 or 1
			})
			v39:Play()
			v_u_3:Create(v_u_21, TweenInfo.new(0.15), {
				["Transparency"] = p38 and 0 or 1
			}):Play()
			if not p38 then
				v_u_40.Target = nil
			end
		end
	end
}
v4.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_40, (copy) v_u_12, (ref) v_u_5
	if v_u_40.Active then
		if v_u_40.Target then
			local v41 = v_u_12
			local v42 = v_u_40.Target.Position + Vector3.new(0, 5, 0)
			local v43
			if v42 then
				local v44 = v_u_5:WorldToScreenPoint(v42)
				v43 = UDim2.fromOffset(v44.X, v44.Y)
			else
				v43 = nil
			end
			v41.Position = v43
		else
			v_u_40:Toggle(false)
		end
	else
		return
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_40
	while true do
		task.wait(1)
		v_u_40:Update()
	end
end)
return v_u_40