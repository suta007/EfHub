local v1 = game:GetService("Players")
local v_u_2 = game:GetService("UserInputService")
game:GetService("CollectionService")
local v3 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = game:GetService("CollectionService")
local v_u_5 = require(v3.Modules.DataService)
local v6 = v1.LocalPlayer
local v_u_7 = v6.Character or v6.CharacterAdded:Wait()
v6.CharacterAdded:Connect(function(p8)
	-- upvalues: (ref) v_u_7
	v_u_7 = p8
end)
local v9 = v3:WaitForChild("GameEvents")
require(v3.Modules.GetFarm)
require(v3.Modules.Notification)
local v_u_10 = v9.PetAgeLimitBreak_Cancel
local v11 = v1.LocalPlayer
local v_u_12 = v11.PlayerGui:WaitForChild("PetAgeMachineCancel")
local v_u_13 = v11.PlayerGui:WaitForChild("PetAgeBreak_UI")
local v14 = v_u_12.Frame.CancelFrame:WaitForChild("Cancel")
local v_u_15 = v14:FindFirstChild("TextLabel")
local v_u_16 = v_u_12.Frame.CancelFrame.CancelBG
local v_u_17 = v_u_16:FindFirstChild("CancelIcon")
local function v21()
	-- upvalues: (copy) v_u_2, (copy) v_u_15, (copy) v_u_17, (copy) v_u_16
	local v18 = v_u_2.TouchEnabled
	local v19 = v_u_2.GamepadEnabled
	if v18 then
		v_u_15.Text = "Cancel Machine"
		v_u_17.Visible = false
		return
	elseif v19 then
		local v20 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonB)
		v_u_15.Text = "Cancel Machine"
		if v20 then
			v_u_17.Image = v20
			v_u_16.Visible = true
		else
			v_u_16.Visible = false
		end
	else
		v_u_15.Text = "[C] Cancel Machine"
		v_u_16.Visible = false
		return
	end
end
local v22 = v_u_2.TouchEnabled
local v23 = v_u_2.GamepadEnabled
if v22 then
	v_u_15.Text = "Cancel Machine"
	v_u_17.Visible = false
elseif v23 then
	local v24 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonB)
	v_u_15.Text = "Cancel Machine"
	if v24 then
		v_u_17.Image = v24
		v_u_16.Visible = true
	else
		v_u_16.Visible = false
	end
else
	v_u_15.Text = "[C] Cancel Machine"
	v_u_16.Visible = false
end
v14.Activated:Connect(function()
	-- upvalues: (copy) v_u_10
	v_u_10:FireServer()
end)
v_u_2.LastInputTypeChanged:Connect(v21)
v_u_2.InputBegan:Connect(function(p25, p26)
	-- upvalues: (copy) v_u_10
	if not p26 then
		if p25.KeyCode == Enum.KeyCode.C or p25.KeyCode == Enum.KeyCode.ButtonB then
			v_u_10:FireServer()
		end
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (ref) v_u_7, (copy) v_u_12, (copy) v_u_13
	while true do
		repeat
			task.wait(0.2)
			local v27 = v_u_5:GetData()
			local v28 = v27 and v27.PetAgeBreakMachine
		until v28
		local v29 = false
		for _, v30 in v_u_4:GetTagged("PetAgeMachine") do
			if v30:IsDescendantOf(workspace) and ((v30:GetPivot().Position - v_u_7:GetPivot().Position).Magnitude < 12 and (v28.SubmittedPet and not (v28.IsRunning or v28.PetReady))) then
				v29 = true
			end
		end
		local v31 = v_u_12
		if v29 then
			v29 = not v_u_13.Enabled
		end
		v31.Enabled = v29
	end
end)