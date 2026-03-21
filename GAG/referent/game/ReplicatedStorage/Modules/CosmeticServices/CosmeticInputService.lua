local v_u_1 = game:GetService("UserInputService")
game:GetService("GuiService")
local v2 = game:GetService("CollectionService")
game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage")
local v5 = game:GetService("Players").LocalPlayer
local v_u_6 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_6
	v_u_6 = workspace.CurrentCamera
end)
local v_u_7 = require(v4.Modules.CosmeticServices.UserInterface.CosmeticActionUserInterfaceService)
local v_u_8 = require(v4.Modules.CosmeticServices.UserInterface.CosmeticInventoryUserInterfaceService)
local v_u_9 = require(v4.Modules.GetMouseToWorld)
local v10 = require(v4.Modules.GetFarmAsync)
local v_u_11 = require(v4.Modules.GetUIElementWithTag)
local v12 = require(v4.Modules.CreateTagHandler)
local v_u_13 = v10(v5)
local v_u_14 = Instance.new("Highlight")
v_u_14.FillTransparency = 1
local v_u_15 = nil
local v_u_16 = nil
local function v_u_17()
	-- upvalues: (ref) v_u_16, (copy) v_u_3, (copy) v_u_14
	if v_u_16 then
		v_u_3:Create(v_u_14, TweenInfo.new(0.2), {
			["OutlineTransparency"] = 0.8
		}):Play()
	end
end
local function v_u_18()
	-- upvalues: (ref) v_u_16, (copy) v_u_1, (copy) v_u_7, (copy) v_u_3, (copy) v_u_14
	if v_u_16 then
		v_u_3:Create(v_u_14, TweenInfo.new(0.2), {
			["OutlineTransparency"] = 0
		}):Play()
		if v_u_7.Target == v_u_16 then
			v_u_7:Toggle(true)
		else
			if v_u_7.Target ~= nil then
				v_u_7:Toggle(false)
			end
			task.delay(0.1, function()
				-- upvalues: (ref) v_u_7, (ref) v_u_16
				v_u_7:SetTarget(v_u_16)
				v_u_7:Toggle(true)
			end)
		end
	else
		if v_u_1.TouchEnabled then
			v_u_7:Toggle(false)
		end
		return
	end
end
local v_u_19 = {
	[Enum.UserInputType.Touch] = { function(_)
			-- upvalues: (copy) v_u_17
			v_u_17()
		end },
	[Enum.UserInputType.MouseButton1] = { function()
			-- upvalues: (copy) v_u_17
			v_u_17()
		end },
	[Enum.KeyCode.ButtonR2] = { function()
			-- upvalues: (copy) v_u_17
			v_u_17()
		end }
}
local v_u_20 = {
	[Enum.UserInputType.Touch] = { function(_)
			-- upvalues: (copy) v_u_18
			v_u_18()
		end },
	[Enum.UserInputType.MouseButton1] = { function()
			-- upvalues: (copy) v_u_18
			v_u_18()
		end },
	[Enum.KeyCode.ButtonR2] = { function()
			-- upvalues: (copy) v_u_18
			v_u_18()
		end }
}
v_u_1.InputBegan:Connect(function(p_u_21, _)
	-- upvalues: (copy) v_u_19
	local v22 = v_u_19[p_u_21.KeyCode] or v_u_19[p_u_21.UserInputType]
	if v22 then
		for _, v_u_23 in v22 do
			task.spawn(function()
				-- upvalues: (copy) v_u_23, (copy) p_u_21
				v_u_23(p_u_21)
			end)
		end
	end
end)
v_u_1.InputEnded:Connect(function(p_u_24, _)
	-- upvalues: (copy) v_u_20
	local v25 = v_u_20[p_u_24.KeyCode] or v_u_20[p_u_24.UserInputType]
	if v25 then
		for _, v_u_26 in v25 do
			task.spawn(function()
				-- upvalues: (copy) v_u_26, (copy) p_u_24
				v_u_26(p_u_24)
			end)
		end
	end
end)
v_u_1.TouchTap:Connect(function()
	-- upvalues: (copy) v_u_17
	v_u_17()
end)
v_u_1.TouchEnded:Connect(function()
	-- upvalues: (copy) v_u_18
	v_u_18()
end)
v_u_14.Parent = script
local v_u_27 = RaycastParams.new()
v_u_27.FilterDescendantsInstances = v2:GetTagged("CosmeticHitBox")
v_u_27.FilterType = Enum.RaycastFilterType.Include
v12({
	["Tag"] = "CosmeticHitBox",
	["OnInstanceAdded"] = function(p28)
		-- upvalues: (copy) v_u_27
		v_u_27:AddToFilter(p28)
	end
})
task.spawn(function()
	-- upvalues: (copy) v_u_1, (ref) v_u_15, (copy) v_u_9, (copy) v_u_27, (copy) v_u_13, (copy) v_u_8, (copy) v_u_11, (copy) v_u_14, (ref) v_u_16
	while true do
		repeat
			task.wait(0.025)
			local v29 = v_u_1:GetMouseLocation()
		until v29 ~= v_u_15
		v_u_15 = v29
		local v30 = v_u_9(v_u_27, 1000)
		if v30 then
			v30 = v30.Instance
		end
		if v30 and not v30:IsDescendantOf(v_u_13) then
			v30 = nil
		elseif not v_u_8.State or v_u_11("ICON_TEMPLATE") then
			v30 = nil
		end
		if v30 then
			v30 = v30.Parent
		end
		v_u_14.Adornee = v30 or script
		v_u_16 = v30
	end
end)
return {}