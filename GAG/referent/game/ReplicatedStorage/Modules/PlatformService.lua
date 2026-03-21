local v_u_1 = game:GetService("UserInputService")
local v2 = require(script:WaitForChild("Signal"))
local v_u_3 = {
	["PC"] = {
		Enum.UserInputType.Keyboard,
		Enum.UserInputType.MouseButton1,
		Enum.UserInputType.MouseButton2,
		Enum.UserInputType.MouseButton3,
		Enum.UserInputType.MouseWheel,
		Enum.UserInputType.MouseMovement
	},
	["Mobile"] = { Enum.UserInputType.Touch },
	["Console"] = {
		Enum.UserInputType.Gamepad1,
		Enum.UserInputType.Gamepad2,
		Enum.UserInputType.Gamepad3,
		Enum.UserInputType.Gamepad4,
		Enum.UserInputType.Gamepad5,
		Enum.UserInputType.Gamepad6,
		Enum.UserInputType.Gamepad7,
		Enum.UserInputType.Gamepad8,
		Enum.KeyCode.ButtonX,
		Enum.KeyCode.ButtonA,
		Enum.KeyCode.ButtonB,
		Enum.KeyCode.ButtonY,
		Enum.KeyCode.ButtonL1,
		Enum.KeyCode.ButtonL2,
		Enum.KeyCode.ButtonL3,
		Enum.KeyCode.ButtonSelect,
		Enum.KeyCode.ButtonStart,
		Enum.KeyCode.ButtonR1,
		Enum.KeyCode.ButtonR2,
		Enum.KeyCode.ButtonR3
	}
}
local v_u_4 = v2.new()
local v_u_5 = {
	["CurrentPlatform"] = "PC",
	["PlatformChanged"] = v_u_4
}
local v_u_6 = nil
function v_u_5.GetPlatform(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_3, (ref) v_u_6
	local v7 = v_u_5.CurrentPlatform
	local v8 = v_u_1:GetLastInputType()
	for v9, v10 in v_u_3 do
		if table.find(v10, v8) or table.find(v10, v_u_6) then
			v_u_5.CurrentPlatform = v9
			return v9
		end
	end
	return v7
end
v_u_1.InputChanged:Connect(function(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	local v11 = v_u_5.CurrentPlatform
	local v12 = v_u_5:GetPlatform()
	if v11 ~= v12 then
		v_u_4:Fire(v12)
	end
end)
v_u_1.InputBegan:Connect(function(p13)
	-- upvalues: (ref) v_u_6, (copy) v_u_5, (copy) v_u_4
	v_u_6 = p13.KeyCode
	local v14 = v_u_5.CurrentPlatform
	local v15 = v_u_5:GetPlatform()
	if v14 ~= v15 then
		v_u_4:Fire(v15)
	end
end)
return v_u_5