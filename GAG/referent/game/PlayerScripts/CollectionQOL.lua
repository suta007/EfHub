local v1 = game:GetService("UserInputService")
local v2 = game:GetService("ProximityPromptService")
local v_u_3 = false
local v_u_4 = false
local v_u_5 = true
local v_u_6 = nil
local _ = game.Players.LocalPlayer
v2.PromptShown:Connect(function(p7)
	-- upvalues: (ref) v_u_6, (ref) v_u_4, (ref) v_u_5
	if p7:HasTag("CollectPrompt") then
		v_u_6 = p7
		if v_u_4 and v_u_5 then
			v_u_5 = false
			task.delay(0.25, function()
				-- upvalues: (ref) v_u_5
				v_u_5 = true
			end)
			p7:InputHoldBegin()
		else
			task.wait(0.28)
			if v_u_4 and v_u_6 == p7 then
				p7:InputHoldBegin()
			end
		end
	else
		return
	end
end)
v1.InputBegan:Connect(function(p8, _)
	-- upvalues: (ref) v_u_3, (ref) v_u_4
	if (p8.UserInputType == Enum.UserInputType.Keyboard or p8.UserInputType == Enum.UserInputType.Gamepad1) and (p8.KeyCode == Enum.KeyCode.E or p8.KeyCode == Enum.KeyCode.ButtonX) then
		v_u_3 = true
		task.wait(0.1)
		if v_u_3 then
			v_u_4 = true
		end
	end
end)
v1.InputEnded:Connect(function(p9, _)
	-- upvalues: (ref) v_u_3, (ref) v_u_4
	if (p9.UserInputType == Enum.UserInputType.Keyboard or p9.UserInputType == Enum.UserInputType.Gamepad1) and (p9.KeyCode == Enum.KeyCode.E or p9.KeyCode == Enum.KeyCode.ButtonX) then
		v_u_3 = false
		v_u_4 = false
	end
end)