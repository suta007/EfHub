local v1 = game:GetService("Players")
local v_u_2 = game:GetService("UserInputService")
game:GetService("CollectionService")
local v3 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = game:GetService("CollectionService")
local v5 = v1.LocalPlayer
local v_u_6 = v5.Character or v5.CharacterAdded:Wait()
v5.CharacterAdded:Connect(function(p7)
	-- upvalues: (ref) v_u_6
	v_u_6 = p7
end)
v3:WaitForChild("GameEvents")
require(v3.Modules.GetFarm)
require(v3.Modules.Notification)
local v_u_8 = require(v3.Modules.CraftingStationHandler)
local v_u_9 = require(v3.Modules.CraftingService.CraftingGlobalObjectService)
local _ = v3.GameEvents.HideCancelCraftingBindableEvent
local _ = v3.GameEvents.ShowCancelCraftingBindableEvent
local v_u_10 = v1.LocalPlayer.PlayerGui:WaitForChild("CraftingCancel")
local v11 = v_u_10:WaitForChild("Frame")
local v12 = v11:WaitForChild("No")
local v13 = v11:WaitForChild("Yes")
local v14 = v12:WaitForChild("Interior")
local v15 = v13:WaitForChild("Interior")
local v_u_16 = v14:WaitForChild("ImageLabel")
local v_u_17 = v14:WaitForChild("Label")
local v_u_18 = v15:WaitForChild("ImageLabel")
local v_u_19 = v15:WaitForChild("Label")
local v_u_20 = nil
local function v25()
	-- upvalues: (copy) v_u_2, (copy) v_u_17, (copy) v_u_19, (copy) v_u_16, (copy) v_u_18
	local v21 = v_u_2.TouchEnabled
	local v22 = v_u_2.GamepadEnabled
	if v21 then
		v_u_17.Text = "Cancel Recipe"
		v_u_19.Text = "Submit All"
		v_u_16.Visible = false
		v_u_18.Visible = false
		return
	elseif v22 then
		local v23 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonB)
		local v24 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonY)
		v_u_17.Text = "Cancel Recipe"
		v_u_19.Text = "Submit All"
		if v23 then
			v_u_16.Image = v23
			v_u_16.Visible = true
		else
			v_u_16.Visible = false
		end
		if v24 then
			v_u_18.Image = v24
			v_u_18.Visible = true
		else
			v_u_18.Visible = false
		end
	else
		v_u_17.Text = "[C] Cancel Recipe"
		v_u_19.Text = "[F] Submit All"
		v_u_16.Visible = false
		v_u_18.Visible = false
		return
	end
end
v25()
local function v26()
	-- upvalues: (ref) v_u_20, (copy) v_u_8
	if v_u_20 then
		v_u_8:CancelRecipe(v_u_20)
	end
end
local v_u_27 = false
local function v28()
	-- upvalues: (ref) v_u_20, (ref) v_u_27, (copy) v_u_8
	if v_u_20 then
		if not v_u_27 then
			v_u_27 = true
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_27
				v_u_27 = false
			end)
			v_u_8:SubmitAllRequiredItems(v_u_20)
		end
	else
		return
	end
end
v12.Activated:Connect(v26)
v13.Activated:Connect(v28)
v_u_2.LastInputTypeChanged:Connect(v25)
v_u_2.InputBegan:Connect(function(p29, p30)
	-- upvalues: (ref) v_u_20, (copy) v_u_8, (ref) v_u_27
	if not p30 then
		if (p29.KeyCode == Enum.KeyCode.C or p29.KeyCode == Enum.KeyCode.ButtonB) and v_u_20 then
			v_u_8:CancelRecipe(v_u_20)
		end
		if p29.KeyCode == Enum.KeyCode.F or p29.KeyCode == Enum.KeyCode.ButtonY then
			if not v_u_20 then
				return
			end
			if v_u_27 then
				return
			end
			v_u_27 = true
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_27
				v_u_27 = false
			end)
			v_u_8:SubmitAllRequiredItems(v_u_20)
		end
	end
end)
local function v_u_32(p31)
	return p31:GetAttribute("CraftingObjectType")
end
task.spawn(function()
	-- upvalues: (copy) v_u_4, (ref) v_u_6, (copy) v_u_9, (copy) v_u_32, (copy) v_u_10, (ref) v_u_20
	while true do
		task.wait(0.2)
		local v33 = nil
		for _, v34 in v_u_4:GetTagged("CraftingObject") do
			if v34:IsDescendantOf(workspace) and (v34:GetPivot().Position - v_u_6:GetPivot().Position).Magnitude < 8 then
				local v35 = v_u_9:GetIndividualCraftingMachineData(v34, v_u_32(v34))
				if v35 and v35.RecipeId ~= nil then
					v33 = v34
				end
			end
		end
		v_u_10.Enabled = v33
		v_u_20 = v33
	end
end)