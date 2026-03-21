local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = {}
require(v1.Modules.CreateTagHandler)({
	["Tag"] = "TextShadow",
	["OnInstanceAdded"] = function(p_u_3)
		-- upvalues: (copy) v_u_2
		if p_u_3:IsA("TextLabel") then
			local v_u_4 = p_u_3.Parent
			if v_u_4:IsA("TextLabel") then
				p_u_3.Text = v_u_4.Text
				v_u_2[p_u_3] = v_u_4:GetPropertyChangedSignal("Text"):Connect(function()
					-- upvalues: (copy) p_u_3, (copy) v_u_4
					p_u_3.Text = v_u_4.Text
				end)
			end
		else
			return
		end
	end,
	["OnInstanceRemoved"] = function(p5)
		-- upvalues: (copy) v_u_2
		if v_u_2[p5] then
			v_u_2[p5]:Disconnect()
		end
		v_u_2[p5] = nil
	end
})