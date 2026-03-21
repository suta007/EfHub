local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
game:GetService("UserInputService")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("CrateUI")
local v_u_4 = v_u_3.Size
local v_u_5 = nil
local v_u_6 = require(v1.Modules.GetFarmAncestor)
local v7 = require(v1.Modules.CreateTagHandler)
require(v1.Modules.GetMouseToWorld)
local v_u_8 = require(v1.Modules.TimeHelper)
local v_u_9 = require(v1.Data.CosmeticCrateRegistry).CosmeticCrates
local v_u_10 = require(v1.Data.CosmeticRegistry.CosmeticList)
require(v1.Modules.EffectController.Libraries.TableUtil)
local v_u_11 = {}
v7({
	["Tag"] = "CosmeticCrateLocalHitBox",
	["OnInstanceAdded"] = function(p12)
		-- upvalues: (copy) v_u_11
		local v13 = v_u_11
		table.insert(v13, p12)
	end,
	["OnInstanceRemoved"] = function(p14)
		-- upvalues: (copy) v_u_11
		local v15 = table.find(v_u_11, p14)
		if not v15 then
			return warn((("%* hitbox not tracked!"):format(p14.Name)))
		end
		table.remove(v_u_11, v15)
	end
})
local v_u_16 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_16
	v_u_16 = workspace.CurrentCamera
end)
local v_u_17 = nil
local function v_u_31()
	-- upvalues: (ref) v_u_17, (copy) v_u_9, (copy) v_u_2, (copy) v_u_8
	if v_u_17 then
		local v18 = v_u_17:FindFirstAncestor("CosmeticCrate")
		if v18 then
			local v19 = v18:GetAttribute("CrateType")
			local v20 = v18:GetAttribute("TimeToOpen")
			local v21 = v18:GetAttribute("GrowthMultiplier")
			if v21 then
				v21 = v21 > 0
			end
			local v22 = v19 == "Mysterious Crate"
			local v23 = v_u_17:FindFirstChild("CrateUI")
			if v23 then
				local v24 = v23:WaitForChild("Frame_UpdateTimer")
				v24.Visible = v22
				local v25 = v23:WaitForChild("Frame_WithContent")
				v25.Visible = not v22
				if v22 then
					v25 = v24
				end
				local v26 = v25:WaitForChild("TextUI"):WaitForChild("Frame")
				v25:WaitForChild("ContentUI"):WaitForChild("ContentGrid")
				local v27 = v26:WaitForChild("2_TimerFrame")
				local v28 = v27:WaitForChild("2_CrateTimeToOpen")
				local v29
				if v22 then
					v29 = v26:WaitForChild("1_CrateType")
				else
					v29 = v27:WaitForChild("1_CrateType")
				end
				local v30 = v_u_9[v19]
				v_u_2:Create(v29, TweenInfo.new(0.2), {
					["TextColor3"] = v30.Color
				}):Play()
				v28.Text = v20 <= 0 and "Ready" or v_u_8:GenerateColonFormatFromTime(v20)
				v29.Text = v19
				if v21 or v20 <= 0 then
					v28.TextColor3 = Color3.new(0, 0.666667, 0)
				else
					v28.TextColor3 = Color3.new(1, 1, 1)
				end
			else
				return
			end
		else
			return
		end
	else
		return
	end
end
local function v_u_34(p_u_32)
	-- upvalues: (copy) v_u_2
	if p_u_32 then
		local v33 = v_u_2:Create(p_u_32, TweenInfo.new(0.25), {
			["Size"] = UDim2.new(0, 0)
		})
		v33:Play()
		v33.Completed:Once(function()
			-- upvalues: (copy) p_u_32
			p_u_32:Destroy()
		end)
	end
end
local function v_u_39(p35)
	for v36 = #p35, 1, -1 do
		local v37 = math.random(v36)
		local v38 = p35[v36]
		p35[v36] = p35[v37]
		p35[v37] = v38
	end
end
local function v_u_55(p40)
	-- upvalues: (ref) v_u_17, (copy) v_u_34, (ref) v_u_5, (copy) v_u_3, (copy) v_u_2, (copy) v_u_4, (copy) v_u_9, (copy) v_u_10, (copy) v_u_39, (copy) v_u_31
	if p40 == v_u_17 then
		return
	end
	v_u_17 = p40
	v_u_34(v_u_5)
	local v41 = v_u_17:FindFirstAncestor("CosmeticCrate")
	if not v41 then
		return
	end
	local v42 = v41:GetAttribute("CrateType")
	local v43 = v42 == "Mysterious Crate"
	v_u_5 = v_u_3:Clone()
	v_u_5.Parent = v_u_17
	v_u_5.Enabled = true
	v_u_5.Size = UDim2.new(0, 0)
	local v44 = {
		["Size"] = v_u_4
	}
	v_u_2:Create(v_u_5, TweenInfo.new(0.25), v44):Play()
	local v45 = {}
	local v46 = v_u_9[v42]
	if not v46 then
		warn((("No crate data for type: %*"):format(v42)))
		return
	end
	for _, v47 in v46.CosmeticRolls.Items do
		local v48 = v_u_10[v47.Name]
		if v48 then
			local v49 = v48.Icon
			table.insert(v45, v49)
		end
	end
	v_u_39(v45)
	local v50
	if v43 then
		v50 = v_u_5.Frame_UpdateTimer.ContentUI.ContentGrid
	else
		v50 = v_u_5.Frame_WithContent.ContentUI.ContentGrid
	end
	local v51 = v50.CosmeticTemplate
	for v52, v53 in v45 do
		if v52 > 6 then
			break
		end
		local v54 = v51:Clone()
		v54.Parent = v50
		v54.Visible = true
		v54.Image.Image = v53
	end
	v_u_31()
end
task.spawn(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_55, (ref) v_u_17, (copy) v_u_34, (ref) v_u_5
	while true do
		local v56, v57
		repeat
			task.wait(0.25)
			local v58 = RaycastParams.new()
			v58.FilterDescendantsInstances = { v_u_11 }
			v58.FilterType = Enum.RaycastFilterType.Include
			v56 = nil
			v57 = nil
			local v59 = game.Players.LocalPlayer.Character
		until v59 and v59:IsDescendantOf(workspace)
		local v60 = v59:GetPivot().p
		for _, v61 in game.CollectionService:GetTagged("CosmeticCrateServer") do
			if v_u_6(v61) then
				local v62 = (v60 - v61:GetPivot().p).Magnitude
				if v62 < 9 and (v57 == nil or v62 < v56) then
					v57 = v61:FindFirstChild("HitBox", true)
					v56 = v62
				end
			end
		end
		if v_u_6(v57) then
			v_u_55(v57)
		else
			v_u_17 = nil
			v_u_34(v_u_5)
		end
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_31
	while true do
		task.wait(1)
		v_u_31()
	end
end)
return {}