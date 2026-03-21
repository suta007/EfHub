local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = {}
require(v1.Modules.CreateTagHandler)({
	["Tag"] = "AutoSizeCanvas",
	["OnInstanceAdded"] = function(p_u_3)
		-- upvalues: (copy) v_u_2
		if p_u_3:IsA("ScrollingFrame") then
			local v_u_4 = p_u_3:FindFirstChildOfClass("UIListLayout")
			if v_u_4 then
				p_u_3.CanvasSize = UDim2.new(0, 0, 0, v_u_4.AbsoluteContentSize.Y)
				v_u_2[p_u_3] = v_u_4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					-- upvalues: (copy) p_u_3, (copy) v_u_4
					p_u_3.CanvasSize = UDim2.new(0, 0, 0, v_u_4.AbsoluteContentSize.Y)
				end)
			else
				warn("No UIListLayout found in ScrollingFrame with AutoSizeCanvas tag")
			end
		else
			warn("AutoSizeCanvas tag should only be applied to ScrollingFrames")
			return
		end
	end,
	["OnInstanceRemoved"] = function(p5)
		-- upvalues: (copy) v_u_2
		local v6 = v_u_2[p5]
		if v6 then
			v6:Disconnect()
		end
	end
})
return {}