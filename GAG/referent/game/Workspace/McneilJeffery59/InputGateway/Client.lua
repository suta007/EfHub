local v1 = game:GetService("UserInputService")
game:GetService("Debris")
local v2 = game:GetService("Players")
local v3 = script.Parent
local _ = v3.Parent
local v_u_4 = v3:WaitForChild("Activation")
local v_u_5 = v2.LocalPlayer:GetMouse()
local v_u_6 = false
local function v13(p7, p8)
	-- upvalues: (copy) v_u_5, (ref) v_u_6, (copy) v_u_4
	if not p8 then
		local v9 = false
		local v10 = p7.UserInputType.Name
		local v11
		if v10 == "MouseButton1" then
			v11 = true
		elseif v10 == "Touch" then
			wait(0.1)
			v11 = p7.UserInputState == Enum.UserInputState.End and true or v9
		else
			v11 = v10 == "Gamepad1" and p7.KeyCode.Name == "ButtonR2" and true or v9
		end
		if v11 then
			local v12 = v_u_5.Hit
			v_u_6 = true
			v_u_4:FireServer(true, v12)
		end
	end
end
local function v18(p14, p15)
	-- upvalues: (ref) v_u_6, (copy) v_u_5, (copy) v_u_4
	if not p15 and v_u_6 then
		local v16 = p14.UserInputType.Name
		if v16 == "MouseButton1" or (v16 == "Touch" or v16 == "Gamepad1") then
			local v17 = v_u_5.Hit
			v_u_6 = false
			v_u_4:FireServer(false, v17)
		end
	end
end
v1.InputBegan:Connect(v13)
v1.InputEnded:Connect(v18)