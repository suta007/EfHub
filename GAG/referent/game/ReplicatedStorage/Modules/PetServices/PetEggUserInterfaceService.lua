local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
game:GetService("UserInputService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PetUI"):WaitForChild("PetEggUI")
local v_u_5 = v_u_4:WaitForChild("CanvasGroup")
local v_u_6 = v_u_5:WaitForChild("EggName")
local v_u_7 = v_u_5:WaitForChild("EggHatchTime")
local v_u_8 = require(v1.Modules.GetFarmAncestor)
local v9 = require(v1.Modules.CreateTagHandler)
require(v1.Modules.GetMouseToWorld)
local v_u_10 = require(v1.Modules.TimeHelper)
local v11 = require(v1.Data.PetRegistry)
require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_12 = v11.PetEggs
local v_u_13 = {}
v9({
	["Tag"] = "PetEggLocalHitBox",
	["OnInstanceAdded"] = function(p14)
		-- upvalues: (copy) v_u_13
		local v15 = v_u_13
		table.insert(v15, p14)
	end,
	["OnInstanceRemoved"] = function(p16)
		-- upvalues: (copy) v_u_13
		local v17 = table.find(v_u_13, p16)
		if not v17 then
			return warn((("%* hitbox not tracked!"):format(p16.Name)))
		end
		table.remove(v_u_13, v17)
	end
})
local v_u_18 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_18
	v_u_18 = workspace.CurrentCamera
end)
local v_u_19 = nil
v2.RenderStepped:Connect(function()
	-- upvalues: (ref) v_u_19, (ref) v_u_18, (copy) v_u_4
	if v_u_19 then
		local v20 = v_u_18:WorldToScreenPoint(v_u_19:GetPivot().Position + Vector3.new(0, 0, 0))
		v_u_4.Position = UDim2.new(0, v20.X, 0, v20.Y)
	end
end)
local function v_u_26()
	-- upvalues: (ref) v_u_19, (copy) v_u_12, (copy) v_u_3, (copy) v_u_6, (copy) v_u_10, (copy) v_u_7
	if v_u_19 then
		local v21 = v_u_19:FindFirstAncestor("PetEgg")
		if v21 then
			local v22 = v21:GetAttribute("EggName")
			local v23 = v21:GetAttribute("TimeToHatch")
			local v24 = v21:GetAttribute("GrowthMultiplier")
			if v24 then
				v24 = v24 > 0
			end
			local v25 = v_u_12[v22]
			v_u_3:Create(v_u_6, TweenInfo.new(0.2), {
				["TextColor3"] = v25.Color
			}):Play()
			v_u_7.Text = v23 == 0 and "Ready" or v_u_10:GenerateColonFormatFromTime(v23)
			v_u_6.Text = v22
			if v24 and v23 ~= 0 then
				v_u_7.TextColor3 = Color3.new(0, 0.666667, 0)
			else
				v_u_7.TextColor3 = Color3.new(1, 1, 1)
			end
		else
			return
		end
	else
		return
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_13, (copy) v_u_8, (ref) v_u_19, (copy) v_u_26, (copy) v_u_3, (copy) v_u_5
	while true do
		local v27, v28
		repeat
			task.wait(0.25)
			local v29 = RaycastParams.new()
			v29.FilterDescendantsInstances = { v_u_13 }
			v29.FilterType = Enum.RaycastFilterType.Include
			v27 = nil
			v28 = nil
			local v30 = game.Players.LocalPlayer.Character
		until v30 and v30:IsDescendantOf(workspace)
		local v31 = v30:GetPivot().p
		for _, v32 in game.CollectionService:GetTagged("PetEggServer") do
			if v_u_8(v32) then
				local v33 = (v31 - v32:GetPivot().p).Magnitude
				if v33 < 9 and (v28 == nil or v33 < v27) then
					v28 = v32:FindFirstChild("HitBox", true)
					v27 = v33
				end
			end
		end
		if v_u_8(v28) then
			v_u_19 = v28
			v_u_26()
		else
			v_u_19 = nil
		end
		local v34
		if v_u_19 then
			v34 = v_u_19.Parent.Parent:GetAttribute("ShowTime")
		else
			v34 = nil
		end
		local v35 = {
			["GroupTransparency"] = (not v34 and true or v34 <= workspace:GetServerTimeNow()) and v_u_19 and 0 or 1
		}
		v_u_3:Create(v_u_5, TweenInfo.new(0.25), v35):Play()
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_26
	while true do
		task.wait(1)
		v_u_26()
	end
end)
return {}