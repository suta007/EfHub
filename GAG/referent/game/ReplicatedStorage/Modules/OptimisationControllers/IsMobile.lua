local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
require(v2.Modules.PlatformProvider)
require(v2.Modules.IsDev)
return function()
	-- upvalues: (copy) v_u_1
	return v_u_1.TouchEnabled
end