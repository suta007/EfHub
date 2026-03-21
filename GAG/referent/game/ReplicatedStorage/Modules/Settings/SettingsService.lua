local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.DataService)
local v_u_3 = v1:WaitForChild("GameEvents"):WaitForChild("SettingsService")
return {
	["SetSetting"] = function(_, p4, p5)
		-- upvalues: (copy) v_u_3
		v_u_3:FireServer("SetSetting", p4, p5)
	end,
	["GetSetting"] = function(_, p6)
		-- upvalues: (copy) v_u_2
		local v7 = v_u_2:GetData()
		if v7 then
			return v7.Settings[p6]
		end
	end
}