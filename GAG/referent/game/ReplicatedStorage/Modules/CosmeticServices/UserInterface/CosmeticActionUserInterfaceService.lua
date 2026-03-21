local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("CollectionService")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = v1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("CosmeticUI"):WaitForChild("ActionMenu")
local v7 = require(v3.Data.CosmeticRegistry)
local v_u_8 = require(v3.Modules.WaitForDescendant)
local v_u_9 = require(v3.Modules.GetWorldToPosition)
local v_u_10 = require(v3.Modules.GetUIElementWithTag)
local v_u_11 = require(v3.Modules.CosmeticServices.UserInterface.CosmeticInventoryUserInterfaceService)
require(v3.Modules.PlaySound)
require(v3.Data.CosmeticRegistry.CosmeticList)
local v_u_12 = require(v3.Modules.CosmeticServices.UserInterface.CosmeticRotationLockUserInterfaceService)
local v13 = script:WaitForChild("Actions")
local v_u_14 = v7.DefaultActions
local v_u_15 = v7.ActionRegistry
local v_u_16 = v_u_6:WaitForChild("ICON_INSERTION_POINT")
local v_u_17 = v_u_16:WaitForChild("ICON_TEMPLATE")
v_u_17.Visible = false
local v_u_18 = v_u_6:WaitForChild("UIScale")
local v_u_19 = 1
v_u_19 = v_u_5.TouchEnabled and 2.5 or 1
v_u_5:GetPropertyChangedSignal("TouchEnabled"):Connect(function()
	-- upvalues: (ref) v_u_19, (copy) v_u_5
	v_u_19 = v_u_5.TouchEnabled and 2.5 or 1
end)
local v_u_20 = v_u_19
local v_u_21 = {
	["Target"] = nil,
	["CurrentState"] = false,
	["MovementStates"] = {}
}
local v_u_22 = {}
for _, v23 in v13:GetChildren() do
	local v24 = require(v23)
	v_u_22[v23.Name] = v24(v_u_21)
end
local function v_u_41(p25)
	-- upvalues: (copy) v_u_15, (copy) v_u_17, (copy) v_u_16, (copy) v_u_8, (copy) v_u_12, (copy) v_u_2, (copy) v_u_21, (copy) v_u_22
	for _, v26 in p25 do
		local v27 = v_u_15[v26]
		if v27 then
			local v_u_28 = v_u_17:Clone()
			v_u_28:AddTag("ActionButton")
			v_u_28:SetAttribute("Action", v26)
			v_u_28.Parent = v_u_16
			local v29 = v_u_8(v_u_28, "IMAGE_ICON")
			v29.Image = v27.Image
			v_u_28.LayoutOrder = v27.LayoutOrder
			v_u_28.Visible = true
			v_u_28.Name = v26
			if v27.StartingImageColor then
				v29.ImageColor3 = v_u_12:GetCurrentColor()
			end
			local v30 = v_u_28:WaitForChild("SENSOR")
			local v_u_31 = v_u_28:WaitForChild("Vignette")
			local v_u_32 = v_u_28:WaitForChild("UIStroke")
			local function v_u_34(p33)
				-- upvalues: (ref) v_u_2, (copy) v_u_31, (copy) v_u_32
				v_u_2:Create(v_u_31, TweenInfo.new(0.2), {
					["BackgroundTransparency"] = p33 and 0.5 or 1
				}):Play()
				v_u_2:Create(v_u_32, TweenInfo.new(0.2), {
					["Color"] = p33 and Color3.fromRGB(255, 157, 0) or Color3.fromRGB(61, 32, 19),
					["Thickness"] = p33 and 3 or 1.55
				}):Play()
			end
			v30.MouseLeave:Connect(function()
				-- upvalues: (copy) v_u_34
				v_u_34(false)
			end)
			v30.MouseEnter:Connect(function()
				-- upvalues: (copy) v_u_34
				v_u_34(true)
			end)
			v30.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_34, (ref) v_u_21, (ref) v_u_22, (copy) v_u_28
				v_u_34(false)
				local v35 = v_u_21.CurrentButton
				if v35 then
					v_u_21.CurrentButton = nil
					local v36 = v35:GetAttribute("Action")
					local v37 = v_u_22[v36]
					if v37 then
						v37.InputEnded()
					else
						warn(v36, "Has no action handler!")
					end
				end
				v_u_21.CurrentButton = v_u_28
				local v38 = v_u_21.CurrentButton
				if v38 then
					local v39 = v38:GetAttribute("Action")
					local v40 = v_u_22[v39]
					if v40 then
						v40.InputBegan()
					else
						warn(v39, "Has no action handler!")
					end
				else
					return
				end
			end)
			v30.MouseButton1Up:Connect(function()
				-- upvalues: (copy) v_u_34
				v_u_34(true)
			end)
			v_u_28.Parent = v_u_16
		else
			warn(v26, "Has no action data!")
		end
	end
end
function v_u_21.SetTarget(_, p42)
	-- upvalues: (copy) v_u_21, (copy) v_u_4, (copy) v_u_41, (copy) v_u_14
	v_u_21.Target = p42
	for _, v43 in v_u_4:GetTagged("ActionButton") do
		v43:Destroy()
	end
	v_u_41(v_u_14)
end
function v_u_21.Toggle(_, p44)
	-- upvalues: (copy) v_u_21, (copy) v_u_2, (copy) v_u_18, (ref) v_u_20
	if v_u_21.CurrentState ~= p44 then
		v_u_21.CurrentState = p44
		local v45 = {
			["Scale"] = p44 and v_u_20 or 0
		}
		v_u_2:Create(v_u_18, TweenInfo.new(0.2), v45):Play()
	end
end
function v_u_21.HardDisable(_)
	-- upvalues: (copy) v_u_21, (copy) v_u_22
	v_u_21:Toggle(false)
	v_u_21.Target = nil
	local v46 = v_u_21.CurrentButton
	if v46 then
		v_u_21.CurrentButton = nil
		local v47 = v46:GetAttribute("Action")
		local v48 = v_u_22[v47]
		if v48 then
			v48.InputEnded()
		else
			warn(v47, "Has no action handler!")
		end
	else
		return
	end
end
v_u_21:Toggle(false)
game:GetService("RunService").Heartbeat:Connect(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_21, (copy) v_u_9, (copy) v_u_6
	local v49 = (v_u_11.State and true or false) and ((v_u_21.Target and true or false) and v_u_21.Target)
	if v49 then
		v49 = not v_u_21.Target:IsDescendantOf(workspace)
	end
	if v49 then
		v_u_21:HardDisable()
		return
	else
		local v50 = v_u_21.Target
		if v50 then
			local v51, v52 = v_u_9(v50:GetPivot().Position)
			v_u_6.Position = v51
			v_u_6.Visible = v52
		end
	end
end)
local v_u_60 = {
	[Enum.UserInputType.MouseButton1] = {
		["Activate"] = function()
			-- upvalues: (copy) v_u_10, (copy) v_u_21
			if not v_u_10("ActionButton") then
				v_u_21:HardDisable()
			end
		end
	},
	[Enum.KeyCode.ButtonR2] = { function()
			-- upvalues: (copy) v_u_21, (copy) v_u_22, (copy) v_u_10
			local v53 = v_u_21.CurrentButton
			if v53 then
				v_u_21.CurrentButton = nil
				local v54 = v53:GetAttribute("Action")
				local v55 = v_u_22[v54]
				if v55 then
					v55.InputEnded()
				else
					warn(v54, "Has no action handler!")
				end
			end
			local v56 = v_u_10("ActionButton")
			if v56 then
				v_u_21.CurrentButton = v56
				local v57 = v_u_21.CurrentButton
				if v57 then
					local v58 = v57:GetAttribute("Action")
					local v59 = v_u_22[v58]
					if v59 then
						v59.InputBegan()
					else
						warn(v58, "Has no action handler!")
					end
				else
					return
				end
			else
				v_u_21:HardDisable()
				return
			end
		end }
}
local v_u_67 = {
	[Enum.UserInputType.MouseButton1] = {
		["Deactivate"] = function()
			-- upvalues: (copy) v_u_21, (copy) v_u_22
			local v61 = v_u_21.CurrentButton
			if v61 then
				v_u_21.CurrentButton = nil
				local v62 = v61:GetAttribute("Action")
				local v63 = v_u_22[v62]
				if v63 then
					v63.InputEnded()
				else
					warn(v62, "Has no action handler!")
				end
			else
				return
			end
		end
	},
	[Enum.KeyCode.ButtonR2] = { function()
			-- upvalues: (copy) v_u_21, (copy) v_u_22
			local v64 = v_u_21.CurrentButton
			if v64 then
				v_u_21.CurrentButton = nil
				local v65 = v64:GetAttribute("Action")
				local v66 = v_u_22[v65]
				if v66 then
					v66.InputEnded()
				else
					warn(v65, "Has no action handler!")
				end
			else
				return
			end
		end }
}
v_u_5.TouchEnded:Connect(function()
	-- upvalues: (copy) v_u_21, (copy) v_u_22
	local v68 = v_u_21.CurrentButton
	if v68 then
		v_u_21.CurrentButton = nil
		local v69 = v68:GetAttribute("Action")
		local v70 = v_u_22[v69]
		if v70 then
			v70.InputEnded()
		else
			warn(v69, "Has no action handler!")
		end
	else
		return
	end
end)
v_u_5.InputBegan:Connect(function(p_u_71, _)
	-- upvalues: (copy) v_u_60
	local v72 = v_u_60[p_u_71.KeyCode] or v_u_60[p_u_71.UserInputType]
	if v72 then
		for _, v_u_73 in v72 do
			task.spawn(function()
				-- upvalues: (copy) v_u_73, (copy) p_u_71
				v_u_73(p_u_71)
			end)
		end
	end
end)
v_u_5.InputEnded:Connect(function(p_u_74, _)
	-- upvalues: (copy) v_u_67
	local v75 = v_u_67[p_u_74.KeyCode] or v_u_67[p_u_74.UserInputType]
	if v75 then
		for _, v_u_76 in v75 do
			task.spawn(function()
				-- upvalues: (copy) v_u_76, (copy) p_u_74
				v_u_76(p_u_74)
			end)
		end
	end
end)
return v_u_21