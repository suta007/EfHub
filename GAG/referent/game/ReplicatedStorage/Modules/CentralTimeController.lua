local v_u_1 = {
	["OverwriteTime"] = nil
}
local v_u_2 = game:GetService("RunService")
function v_u_1.SetTime(_, p3)
	-- upvalues: (copy) v_u_1
	v_u_1.OverwriteTime = p3
end
function v_u_1.GetTime(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v4 = v_u_1.OverwriteTime
	if not v4 then
		if v_u_2:IsServer() then
			return DateTime.now().UnixTimestamp
		end
		v4 = workspace:GetServerTimeNow()
	end
	return v4
end
return v_u_1