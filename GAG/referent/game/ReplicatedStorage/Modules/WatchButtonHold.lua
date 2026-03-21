local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = nil
local v_u_4 = 0
local function v_u_6()
	-- upvalues: (ref) v_u_3, (ref) v_u_4
	if v_u_3 then
		local v5 = os.clock()
		if v5 >= v_u_3.t and v5 - v_u_4 >= v_u_3.interval then
			v_u_4 = v5
			v_u_3.callback(v5 - v_u_3.t)
		end
	else
		return
	end
end
local function v_u_8()
	-- upvalues: (ref) v_u_3, (ref) v_u_4
	if v_u_3 then
		if v_u_3.conn then
			v_u_3.conn:Disconnect()
			v_u_3.conn = nil
		end
		local v7 = os.clock()
		if v_u_3.t <= v7 then
			task.spawn(v_u_3.callback, v7 - v_u_3.t, true)
		end
		v_u_4 = 0
		v_u_3 = nil
	end
end
v1.InputEnded:Connect(function(p9, _)
	-- upvalues: (copy) v_u_8
	if p9.UserInputType == Enum.UserInputType.MouseButton1 or (p9.UserInputType == Enum.UserInputType.Touch or p9.KeyCode == Enum.KeyCode.ButtonA) then
		v_u_8()
	end
end)
return function(p_u_10, p_u_11, p_u_12)
	-- upvalues: (copy) v_u_8, (ref) v_u_3, (copy) v_u_2, (copy) v_u_6
	local v_u_13 = p_u_10.MouseButton1Down:Connect(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_3, (copy) p_u_10, (copy) p_u_12, (copy) p_u_11, (ref) v_u_2, (ref) v_u_6
		v_u_8()
		v_u_3 = {
			["button"] = p_u_10,
			["t"] = os.clock() + (p_u_12 and p_u_12.minimumHoldTime or 0),
			["interval"] = p_u_12 and p_u_12.interval or 0,
			["callback"] = p_u_11,
			["conn"] = v_u_2.PostSimulation:Connect(v_u_6)
		}
	end)
	local v_u_14 = p_u_10.MouseButton1Up:Connect(function()
		-- upvalues: (ref) v_u_3, (copy) p_u_10, (ref) v_u_8
		if v_u_3 and v_u_3.button == p_u_10 then
			v_u_8()
		end
	end)
	local v_u_15 = p_u_10.Destroying:Once(function()
		-- upvalues: (ref) v_u_3, (copy) p_u_10, (ref) v_u_8
		if v_u_3 and v_u_3.button == p_u_10 then
			v_u_8()
		end
	end)
	return function()
		-- upvalues: (copy) v_u_15, (copy) v_u_13, (copy) v_u_14
		v_u_15:Disconnect()
		v_u_13:Disconnect()
		v_u_14:Disconnect()
	end
end