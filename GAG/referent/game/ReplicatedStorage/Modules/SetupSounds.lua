local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.PlayHoverSound)
local v_u_3 = require(v1.Modules.PlayClickSound)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = p4:WaitForChild("SENSOR")
	v5.MouseEnter:Connect(function()
		-- upvalues: (ref) v_u_2
		v_u_2()
	end)
	v5.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_3
		v_u_3()
	end)
	return v5
end