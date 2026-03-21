game:GetService("Selection")
local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("CollectionService")
local v5 = game:GetService("RunService")
local v_u_6 = game:GetService("UserInputService")
local v_u_7 = game:GetService("GuiService")
local v_u_8 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_8
	v_u_8 = workspace.CurrentCamera
end)
local v9 = v2.Modules
local v10 = require(v9.WaitForDescendant)
local v11 = v9:WaitForChild("PetServices")
local v_u_12 = require(v11.ActivePetsService)
local v13 = require(v2.Data.PetRegistry)
local v_u_14 = v13.PetList
local v_u_15 = v13.DefaultPetActions
local v_u_16 = v13.PetStatesRegistry
local v_u_17 = v1.LocalPlayer
local v_u_18 = v_u_17:WaitForChild("PlayerGui")
local v_u_19 = v_u_18:WaitForChild("PetUI"):WaitForChild("PetActionUI")
local v_u_20 = v_u_19:WaitForChild("UIScale")
local v_u_21 = v10(v_u_19, "CLOSE_BUTTON")
local v_u_22 = v10(v_u_19, "OPTION_HOLDER")
local v_u_23 = script:WaitForChild("PetActionsHandlers")
local v_u_24 = script:WaitForChild("PetActionTemplates")
local v25 = script:WaitForChild("ScriptModules")
local v_u_26 = require(v2.Modules.SetupHoverAnimations)
local v_u_27 = require(v2.Modules.SetupBrightnessAnimationImage)
local v_u_28 = require(v25:WaitForChild("Radialize"))
local v_u_29 = require(v2.Modules.PlayHoverSound)
local v_u_30 = require(v2.Modules.PlayClickSound)
local v_u_31 = {
	["Active"] = false,
	["Target"] = nil,
	["LastStateBeforeInspection"] = nil
}
local v_u_32 = nil
local function v_u_37()
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_18
	local v33 = v_u_4:GetTagged("PetActionButton")
	local v34 = v_u_6:GetMouseLocation() - v_u_7:GetGuiInset()
	local v35 = v_u_18:GetGuiObjectsAtPosition(v34.X, v34.Y)
	for _, v36 in v33 do
		if v36:IsDescendantOf(v_u_18) and table.find(v35, v36) then
			return true
		end
	end
	return false
end
local v_u_38 = require(game.ReplicatedStorage.Frame_Popup_Module)
local v_u_39 = v_u_18:WaitForChild("ConfirmPetEggPurchase")
local function v_u_51(p40)
	-- upvalues: (copy) v_u_24, (copy) v_u_23, (copy) v_u_31, (copy) v_u_22, (copy) v_u_26, (copy) v_u_27, (copy) v_u_38, (copy) v_u_39, (copy) v_u_17, (copy) v_u_30, (copy) v_u_29
	local v41 = v_u_24:FindFirstChild(p40)
	local v42 = v_u_23:FindFirstChild(p40)
	if v42 then
		local v_u_43 = require(v42)
		local v44 = v_u_43.Verifier
		if not v44 or v44(v_u_31.Target) then
			local v45 = v41:Clone()
			v45.Parent = v_u_22
			local v46 = v45:FindFirstChild("Inner")
			local v47 = v_u_26(v46)
			v_u_27(v46)
			v47.ZIndex = 1000
			local function v_u_49()
				-- upvalues: (copy) v_u_43, (ref) v_u_31, (ref) v_u_38, (ref) v_u_39, (ref) v_u_17, (ref) v_u_30
				local v48 = v_u_43.Activate
				if v48 then
					v48(v_u_31.Target)
				end
				v_u_38.Hide(v_u_39)
				v_u_31:Toggle(false)
				v_u_17:SetAttribute("DontOpenAction", true)
				task.delay(0.3, function()
					-- upvalues: (ref) v_u_17
					v_u_17:SetAttribute("DontOpenAction", false)
				end)
				v_u_30()
			end
			v47.MouseButton1Down:Connect(v_u_49)
			v47.InputBegan:Connect(function(p50)
				-- upvalues: (copy) v_u_49
				if p50.UserInputState == Enum.UserInputState.Begin and p50.KeyCode == Enum.KeyCode.ButtonR2 then
					v_u_49()
				end
			end)
			v47.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_29
				v_u_29()
			end)
		end
	else
		return warn("No handler for", p40)
	end
end
function v_u_31.SetTarget(_, p52)
	-- upvalues: (ref) v_u_32, (copy) v_u_31, (copy) v_u_22, (copy) v_u_12, (copy) v_u_14, (copy) v_u_51, (copy) v_u_15, (copy) v_u_28
	v_u_32 = nil
	if v_u_31.Target == p52 then
		return
	else
		v_u_31.Target = p52
		if p52 then
			for _, v53 in v_u_22:GetChildren() do
				if v53:HasTag("PetActionButton") then
					v53:Destroy()
				end
			end
			local v54 = v_u_12:GetPetDataFromPetObject(p52)
			if v54 then
				for _, v55 in v_u_14[v54.PetType].Actions do
					v_u_51(v55)
				end
				for _, v56 in v_u_15 do
					v_u_51(v56)
				end
				v_u_28(v_u_22)
			end
		else
			return
		end
	end
end
local v_u_57 = nil
function v_u_31.Toggle(_, p58)
	-- upvalues: (copy) v_u_31, (copy) v_u_3, (copy) v_u_20, (copy) v_u_12, (copy) v_u_16, (ref) v_u_57, (copy) v_u_21, (copy) v_u_6
	if v_u_31.Active ~= p58 then
		v_u_31.Active = p58
		v_u_3:Create(v_u_20, TweenInfo.new(0.1), {
			["Scale"] = p58 and 1 or 0
		}):Play()
		local v_u_59 = v_u_31.Target
		if v_u_59 then
			local v60 = v_u_59:GetAttribute("UUID")
			local v61 = v_u_59:GetAttribute("OWNER")
			if p58 then
				v_u_31.LastStateBeforeInspection = v_u_16[v_u_12:GetServerState(v61, v60).CurrentState]
				v_u_57 = tick()
				game.Workspace:SetAttribute("LastMenu", v_u_57)
				game:GetService("GamepadService"):EnableGamepadCursor(v_u_21)
				if v_u_6.GamepadEnabled and v_u_6:GetLastInputType() == Enum.UserInputType.Gamepad1 then
					game:GetService("RunService"):BindToRenderStep("LockOn", Enum.RenderPriority.Camera.Value + 1, function(p62)
						-- upvalues: (copy) v_u_59
						workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(workspace.CurrentCamera.CFrame.Position, v_u_59:GetPivot().Position), p62 * 2)
					end)
					return
				end
			elseif not p58 then
				v_u_31.Target = nil
				if v_u_31.LastStateBeforeInspection then
					if game.Workspace:GetAttribute("LastMenu") == v_u_57 then
						game:GetService("GamepadService"):DisableGamepadCursor()
					end
					task.spawn(function()
						game:GetService("RunService"):UnbindFromRenderStep("LockOn")
					end)
				end
			end
		end
	end
end
v5.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_31, (ref) v_u_8, (copy) v_u_19
	if v_u_31.Active then
		if v_u_31.Target then
			local v63 = v_u_31.Target.Position
			local v64 = 2.5 + v_u_31.Target.Size.Y / 2
			local v65 = v63 + Vector3.new(0, v64, 0)
			local v66, v67
			if v65 then
				local v68
				v68, v66 = v_u_8:WorldToScreenPoint(v65)
				v67 = UDim2.fromOffset(v68.X, v68.Y)
			else
				v66 = nil
				v67 = nil
			end
			v_u_19.Position = v66 and v67 and v67 or UDim2.fromScale(2, 2)
		else
			v_u_31:Toggle(false)
		end
	else
		return
	end
end)
v_u_21.SENSOR.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_31, (copy) v_u_17
	v_u_31:Toggle(false)
	v_u_17:SetAttribute("DontOpenAction", true)
	task.delay(0.3, function()
		-- upvalues: (ref) v_u_17
		v_u_17:SetAttribute("DontOpenAction", false)
	end)
end)
function v_u_31.Close()
	-- upvalues: (copy) v_u_31, (copy) v_u_17
	v_u_31:Toggle(false)
	v_u_17:SetAttribute("DontOpenAction", true)
	task.delay(0.3, function()
		-- upvalues: (ref) v_u_17
		v_u_17:SetAttribute("DontOpenAction", false)
	end)
end
local function v_u_69()
	-- upvalues: (copy) v_u_37, (copy) v_u_31, (copy) v_u_17
	if not v_u_37() then
		v_u_31:Toggle(false)
		v_u_17:SetAttribute("DontOpenAction", true)
		task.delay(0.3, function()
			-- upvalues: (ref) v_u_17
			v_u_17:SetAttribute("DontOpenAction", false)
		end)
	end
end
local v_u_70 = {
	[Enum.UserInputType.MouseButton1] = {
		["Activate"] = function() end
	}
}
local v_u_71 = {
	[Enum.UserInputType.MouseButton1] = {
		["Deactivate"] = function()
			-- upvalues: (copy) v_u_69
			v_u_69()
		end
	}
}
v_u_6.InputBegan:Connect(function(p72, p73)
	-- upvalues: (copy) v_u_70
	if p73 then
		return
	else
		local v74 = v_u_70[p72.KeyCode] or v_u_70[p72.UserInputType]
		if v74 then
			for _, v75 in v74 do
				task.spawn(v75)
			end
		end
	end
end)
v_u_6.InputEnded:Connect(function(p76, p77)
	-- upvalues: (copy) v_u_71
	if p77 then
		return
	else
		local v78 = v_u_71[p76.KeyCode] or v_u_71[p76.UserInputType]
		if v78 then
			for _, v79 in v78 do
				task.spawn(v79)
			end
		end
	end
end)
v_u_6.TouchTap:Connect(function()
	-- upvalues: (copy) v_u_69
	v_u_69()
end)
return v_u_31