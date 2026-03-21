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
local v_u_10 = v9.PetMutationMachineService_RE
local v_u_11 = v1.LocalPlayer.PlayerGui:WaitForChild("PetMutationCancel")
local v12 = v_u_11.Frame.CancelFrame:WaitForChild("Cancel")
local v_u_13 = v12:FindFirstChild("TextLabel")
local v_u_14 = v_u_11.Frame.CancelFrame.CancelBG
local v_u_15 = v_u_14:FindFirstChild("CancelIcon")
local function v19()
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_15, (copy) v_u_14
	local v16 = v_u_2.TouchEnabled
	local v17 = v_u_2.GamepadEnabled
	if v16 then
		v_u_13.Text = "Cancel Recipe"
		v_u_15.Visible = false
		return
	elseif v17 then
		local v18 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonB)
		v_u_13.Text = "Cancel Recipe"
		if v18 then
			v_u_15.Image = v18
			v_u_14.Visible = true
		else
			v_u_14.Visible = false
		end
	else
		v_u_13.Text = "[C] Cancel Recipe"
		v_u_14.Visible = false
		return
	end
end
local v20 = v_u_2.TouchEnabled
local v21 = v_u_2.GamepadEnabled
if v20 then
	v_u_13.Text = "Cancel Recipe"
	v_u_15.Visible = false
elseif v21 then
	local v22 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonB)
	v_u_13.Text = "Cancel Recipe"
	if v22 then
		v_u_15.Image = v22
		v_u_14.Visible = true
	else
		v_u_14.Visible = false
	end
else
	v_u_13.Text = "[C] Cancel Recipe"
	v_u_14.Visible = false
end
v12.Activated:Connect(function()
	-- upvalues: (copy) v_u_10
	v_u_10:FireServer("CancelMachine")
end)
v_u_2.LastInputTypeChanged:Connect(v19)
v_u_2.InputBegan:Connect(function(p23, p24)
	-- upvalues: (copy) v_u_10
	if not p24 then
		if p23.KeyCode == Enum.KeyCode.C or p23.KeyCode == Enum.KeyCode.ButtonB then
			v_u_10:FireServer("CancelMachine")
		end
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (ref) v_u_7, (copy) v_u_11
	while true do
		repeat
			task.wait(0.2)
			local v25 = v_u_5:GetData()
			local v26 = v25 and v25.PetMutationMachine
		until v26
		local v27 = false
		for _, v28 in v_u_4:GetTagged("PetMutationMachine") do
			if v28:IsDescendantOf(workspace) and ((v28:GetPivot().Position - v_u_7:GetPivot().Position).Magnitude < 12 and (v26.SubmittedPet and not (v26.IsRunning or v26.PetReady))) then
				v27 = true
			end
		end
		v_u_11.Enabled = v27
	end
end)