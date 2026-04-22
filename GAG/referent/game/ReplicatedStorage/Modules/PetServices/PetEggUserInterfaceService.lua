local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
game:GetService("UserInputService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PetUI"):WaitForChild("PetEggUI")
local v_u_5 = v_u_4:WaitForChild("CanvasGroup")
local v_u_6 = v_u_5:WaitForChild("EggName")
local v_u_7 = v_u_5:WaitForChild("EggHatchTime")
local v_u_8 = v_u_5:WaitForChild("EggBoost")
local v_u_9 = require(v1.Modules.GetFarmAncestor)
local v10 = require(v1.Modules.CreateTagHandler)
require(v1.Modules.GetMouseToWorld)
local v_u_11 = require(v1.Modules.TimeHelper)
local v12 = require(v1.Data.PetRegistry)
require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_13 = v12.PetEggs
local v_u_14 = {}
v10({
	["Tag"] = "PetEggLocalHitBox",
	["OnInstanceAdded"] = function(p15)
		-- upvalues: (copy) v_u_14
		local v16 = v_u_14
		table.insert(v16, p15)
	end,
	["OnInstanceRemoved"] = function(p17)
		-- upvalues: (copy) v_u_14
		local v18 = table.find(v_u_14, p17)
		if not v18 then
			return warn((("%* hitbox not tracked!"):format(p17.Name)))
		end
		table.remove(v_u_14, v18)
	end
})
local v_u_19 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_19
	v_u_19 = workspace.CurrentCamera
end)
local v_u_20 = nil
v2.RenderStepped:Connect(function()
	-- upvalues: (ref) v_u_20, (ref) v_u_19, (copy) v_u_4
	if v_u_20 then
		local v21 = v_u_19:WorldToScreenPoint(v_u_20:GetPivot().Position + Vector3.new(0, 0, 0))
		v_u_4.Position = UDim2.new(0, v21.X, 0, v21.Y)
	end
end)
local function v_u_30()
	-- upvalues: (ref) v_u_20, (copy) v_u_13, (copy) v_u_3, (copy) v_u_6, (copy) v_u_11, (copy) v_u_7, (copy) v_u_8
	if v_u_20 then
		local v22 = v_u_20:FindFirstAncestor("PetEgg")
		if v22 then
			local v23 = v22:GetAttribute("EggName")
			local v24 = v22:GetAttribute("TimeToHatch")
			local v25 = v22:GetAttribute("GrowthMultiplier")
			local v26 = v22:GetAttribute("EggBoostAmount") or 0
			if v25 then
				v25 = v25 > 0
			end
			local v27 = v_u_13[v23]
			v_u_3:Create(v_u_6, TweenInfo.new(0.2), {
				["TextColor3"] = v27.Color
			}):Play()
			v_u_7.Text = v24 == 0 and "Ready" or v_u_11:GenerateColonFormatFromTime(v24)
			v_u_6.Text = v23
			v_u_8.Visible = v26 > 0
			local v28 = v_u_8
			local v29 = v26 * 10
			v28.Text = ("%*%% Boost"):format(math.floor(v29) / 10)
			if v25 and v24 ~= 0 then
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
	-- upvalues: (copy) v_u_14, (copy) v_u_9, (ref) v_u_20, (copy) v_u_30, (copy) v_u_3, (copy) v_u_5
	while true do
		local v31, v32
		repeat
			task.wait(0.25)
			local v33 = RaycastParams.new()
			v33.FilterDescendantsInstances = { v_u_14 }
			v33.FilterType = Enum.RaycastFilterType.Include
			v31 = nil
			v32 = nil
			local v34 = game.Players.LocalPlayer.Character
		until v34 and v34:IsDescendantOf(workspace)
		local v35 = v34:GetPivot().p
		for _, v36 in game.CollectionService:GetTagged("PetEggServer") do
			if v_u_9(v36) then
				local v37 = (v35 - v36:GetPivot().p).Magnitude
				if v37 < 9 and (v32 == nil or v37 < v31) then
					v32 = v36:FindFirstChild("HitBox", true)
					v31 = v37
				end
			end
		end
		if v_u_9(v32) then
			v_u_20 = v32
			v_u_30()
		else
			v_u_20 = nil
		end
		local v38
		if v_u_20 then
			v38 = v_u_20.Parent.Parent:GetAttribute("ShowTime")
		else
			v38 = nil
		end
		local v39 = {
			["GroupTransparency"] = (not v38 and true or v38 <= workspace:GetServerTimeNow()) and v_u_20 and 0 or 1
		}
		v_u_3:Create(v_u_5, TweenInfo.new(0.25), v39):Play()
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_30
	while true do
		task.wait(1)
		v_u_30()
	end
end)
return {}