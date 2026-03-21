local v1 = {}
local v_u_2 = game:GetService("RunService")
local v_u_3 = 0
local v_u_4 = 0
local v_u_5 = nil
function v1.EnableFPSTracker(_)
	-- upvalues: (ref) v_u_5, (copy) v_u_2, (ref) v_u_3, (ref) v_u_4
	if v_u_5 then
		v_u_5:Disconnect()
		v_u_5 = nil
	end
	v_u_5 = v_u_2.RenderStepped:Connect(function(p6)
		-- upvalues: (ref) v_u_3, (ref) v_u_4
		if v_u_3 > 1 then
			v_u_3 = 0
			v_u_4 = 0
		end
		v_u_3 = v_u_3 + p6
		v_u_4 = v_u_4 + 1
	end)
end
function v1.DisableFPSTracker(_)
	-- upvalues: (ref) v_u_5
	if v_u_5 then
		v_u_5:Disconnect()
		v_u_5 = nil
	end
end
function v1.GetCurrentFPS(_)
	-- upvalues: (ref) v_u_4, (ref) v_u_3
	if v_u_4 == 0 or v_u_3 == 0 then
		v_u_3 = v_u_3 + task.wait()
		v_u_4 = v_u_4 + 1
	end
	return v_u_4 / v_u_3
end
return v1