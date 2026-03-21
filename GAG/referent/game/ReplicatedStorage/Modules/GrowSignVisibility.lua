local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.Observers)
return v_u_2.observeTag("GrowSign", function(p_u_3)
	-- upvalues: (copy) v_u_2
	local v_u_4 = p_u_3:GetPivot()
	return v_u_2.observeAttribute(p_u_3, "Visible", function(p5)
		-- upvalues: (copy) p_u_3, (copy) v_u_4
		if p5 then
			p_u_3:PivotTo(v_u_4)
		else
			p_u_3:PivotTo(v_u_4 - Vector3.new(0, 100, 0))
		end
		return nil
	end)
end)