local v1 = {}
local v_u_2 = game:GetService("HttpService")
function v1.IsThisWeatherRunning(p3)
	-- upvalues: (copy) v_u_2
	local v4 = workspace:GetAttribute("CurrentWeatherEvents")
	if not v4 then
		return false
	end
	local v5 = v_u_2:JSONDecode(v4)
	return table.find(v5, p3) ~= nil
end
function v1.GetCurrentWeathers()
	-- upvalues: (copy) v_u_2
	local v6 = workspace:GetAttribute("CurrentWeatherEvents")
	if v6 then
		return v_u_2:JSONDecode(v6)
	else
		return nil
	end
end
return v1