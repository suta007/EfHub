local v_u_1 = game:GetService("GuiService")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = {
	["GuessFromTouch"] = true,
	["Platforms"] = {
		["Computer"] = 1,
		["Console"] = 2,
		["Mobile"] = 3,
		["UnknownComputerOrMobile"] = 4
	}
}
local v_u_4 = {}
for v5, v6 in v_u_3.Platforms do
	v_u_4[v6] = v5
end
function v_u_3._GetPlatform(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
	if v_u_1:IsTenFootInterface() then
		return v_u_3.Platforms.Console
	elseif v_u_2.VREnabled then
		return v_u_3.Platforms.Computer
	else
		local v7 = 0
		local v8 = 0
		if v_u_2.GyroscopeEnabled then
			v8 = v8 + 2
		end
		if v_u_2.AccelerometerEnabled then
			v8 = v8 + 2
		end
		if v_u_2.KeyboardEnabled then
			v7 = v7 + 1
		end
		if v_u_2.MouseEnabled then
			v7 = v7 + 1
		end
		if v_u_2.GamepadEnabled then
			v7 = v7 + 1
		end
		if v8 == v7 then
			if v_u_3.GuessFromTouch then
				if v_u_2.TouchEnabled then
					return v_u_3.Platforms.Mobile
				else
					return v_u_3.Platforms.Computer
				end
			else
				return v_u_3.Platforms.UnknownComputerOrMobile
			end
		elseif v7 < v8 then
			return v_u_3.Platforms.Mobile
		else
			return v_u_3.Platforms.Computer
		end
	end
end
function v_u_3.GetPlatform(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_4[v_u_3:_GetPlatform()]
end
return v_u_3