local v_u_1 = game:GetService("UserInputService")
game:GetService("GuiService")
game:GetService("CollectionService")
game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = require(v3.Modules.PetServices.PetInformationUserInterfaceService)
local v_u_6 = require(v3.Modules.PetServices.PetActionUserInterfaceService)
local v_u_7 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_7
	v_u_7 = workspace.CurrentCamera
end)
local v_u_8 = require(v3.Modules.GetMouseToWorld)
local v_u_9 = Instance.new("Highlight")
v_u_9.FillTransparency = 1
local v_u_10 = nil
local v_u_11 = nil
local function v_u_12()
	-- upvalues: (ref) v_u_11, (copy) v_u_2, (copy) v_u_9
	if v_u_11 then
		v_u_2:Create(v_u_9, TweenInfo.new(0.2), {
			["OutlineTransparency"] = 0.8
		}):Play()
	end
end
local function v_u_13()
	-- upvalues: (ref) v_u_11, (copy) v_u_2, (copy) v_u_9, (copy) v_u_4, (copy) v_u_6
	if v_u_11 then
		v_u_2:Create(v_u_9, TweenInfo.new(0.2), {
			["OutlineTransparency"] = 0
		}):Play()
		if v_u_4:GetAttribute("DontOpenAction") then
			return
		elseif v_u_6.Target == v_u_11 then
			v_u_6:Toggle(false)
		else
			if v_u_6.Target ~= nil then
				v_u_6:Toggle(false)
			end
			task.delay(0.1, function()
				-- upvalues: (ref) v_u_6, (ref) v_u_11
				v_u_6:SetTarget(v_u_11)
				v_u_6:Toggle(true)
			end)
		end
	else
		return
	end
end
local v_u_14 = {
	[Enum.UserInputType.Touch] = { function(_)
			-- upvalues: (copy) v_u_12
			v_u_12()
		end },
	[Enum.UserInputType.MouseButton1] = { function()
			-- upvalues: (copy) v_u_12
			v_u_12()
		end },
	[Enum.KeyCode.ButtonR2] = { function()
			-- upvalues: (copy) v_u_12
			v_u_12()
		end }
}
local v_u_15 = {
	[Enum.UserInputType.Touch] = { function(_)
			-- upvalues: (copy) v_u_13
			v_u_13()
		end },
	[Enum.UserInputType.MouseButton1] = { function()
			-- upvalues: (copy) v_u_13
			v_u_13()
		end },
	[Enum.KeyCode.ButtonR2] = { function()
			-- upvalues: (copy) v_u_13
			v_u_13()
		end }
}
v_u_1.InputBegan:Connect(function(p_u_16, _)
	-- upvalues: (copy) v_u_14
	local v17 = v_u_14[p_u_16.KeyCode] or v_u_14[p_u_16.UserInputType]
	if v17 then
		for _, v_u_18 in v17 do
			task.spawn(function()
				-- upvalues: (copy) v_u_18, (copy) p_u_16
				v_u_18(p_u_16)
			end)
		end
	end
end)
v_u_1.InputEnded:Connect(function(p_u_19, _)
	-- upvalues: (copy) v_u_15
	local v20 = v_u_15[p_u_19.KeyCode] or v_u_15[p_u_19.UserInputType]
	if v20 then
		for _, v_u_21 in v20 do
			task.spawn(function()
				-- upvalues: (copy) v_u_21, (copy) p_u_19
				v_u_21(p_u_19)
			end)
		end
	end
end)
v_u_1.TouchTap:Connect(function()
	-- upvalues: (copy) v_u_12
	v_u_12()
end)
v_u_1.TouchEnded:Connect(function()
	-- upvalues: (copy) v_u_13
	v_u_13()
end)
v_u_9.Parent = script
task.spawn(function()
	-- upvalues: (copy) v_u_1, (ref) v_u_10, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (ref) v_u_11, (copy) v_u_9
	while true do
		v_u_10 = v_u_1:GetMouseLocation()
		local v22 = RaycastParams.new()
		v22.FilterDescendantsInstances = {}
		local v23 = v_u_8(v22, 1000)
		if v23 then
			v23 = v23.Instance
		end
		if v23 then
			v23 = v23:FindFirstAncestor("PetMover")
		end
		if v_u_6.Active then
			if v_u_6.Target == v_u_6.Target then
				v_u_5:Toggle(false)
			end
		else
			v_u_5:SetTarget(v23)
			if v23 then
				v_u_5:Toggle(true)
			else
				v_u_5:Toggle(false)
			end
		end
		if v23 and v23:FindFirstChildWhichIsA("Model", true) then
			v_u_11 = v23
			local v24 = v_u_9
			if v23 then
				v23 = v23:FindFirstChildWhichIsA("Model", true)
			end
			v24.Adornee = v23
		else
			v_u_11 = nil
			v_u_9.Adornee = nil
		end
		task.wait(0.2)
	end
end)
return {}