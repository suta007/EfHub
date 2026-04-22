game:GetService("AssetService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = {}
require(v1.Modules.CreateTagHandler)({
	["Tag"] = "AutoScaleSlice",
	["OnInstanceAdded"] = function(p_u_3)
		-- upvalues: (copy) v_u_2
		if p_u_3:IsA("ImageLabel") then
			local v_u_4 = p_u_3.SliceCenter.Min + p_u_3.SliceCenter.Max
			local v8 = p_u_3:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: (copy) p_u_3, (copy) v_u_4
				if p_u_3.ScaleType == Enum.ScaleType.Slice then
					local v5 = p_u_3.AbsoluteSize
					local v6 = v5.X / v_u_4.X
					local v7 = v5.Y / v_u_4.Y
					p_u_3.SliceScale = math.min(v6, v7)
				end
			end)
			if p_u_3.ScaleType == Enum.ScaleType.Slice then
				local v9 = p_u_3.AbsoluteSize
				local v10 = v9.X / v_u_4.X
				local v11 = v9.Y / v_u_4.Y
				p_u_3.SliceScale = math.min(v10, v11)
			end
			v_u_2[p_u_3] = v8
		end
	end,
	["OnInstanceRemoved"] = function(p12)
		-- upvalues: (copy) v_u_2
		local v13 = v_u_2[p12]
		if v13 then
			v13:Disconnect()
		end
	end
})
return {}