local v1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("GuiService")
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = v1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("CosmeticUI"):WaitForChild("RotationYIcon")
local v_u_7 = v_u_6:WaitForChild("ActualIcon")
local v_u_8 = require(v5.Modules.RoundToNearestNumber)
local v9 = require(v5.Data.CosmeticRegistry)
v_u_6.Visible = false
local v_u_10 = v9.InputConfig.ROTATION_CONFIG
local v_u_11 = {
	["Active"] = false,
	["CurrentOffset"] = 0
}
local v_u_12 = 0
function v_u_11.Toggle(_, p13)
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (ref) v_u_12, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	v_u_11.CurrentOffset = 0
	v_u_11.Active = p13
	v_u_12 = v_u_3:GetMouseLocation().X
	local v14 = v_u_3:GetMouseLocation()
	local v15 = v_u_4:GetGuiInset()
	v_u_6.Position = UDim2.fromOffset(v14.X + v15.X, v14.Y - v15.Y)
	v_u_7.Position = UDim2.fromScale(0.5, 0.5)
	v_u_6.Visible = p13
end
v2.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (ref) v_u_12, (copy) v_u_8, (copy) v_u_10, (copy) v_u_7
	if v_u_11.Active then
		local v16 = v_u_3:GetMouseLocation().X
		local v17 = v16 - v_u_12
		local v18 = v_u_11
		v18.CurrentOffset = v18.CurrentOffset + v17
		v_u_12 = v16
		local v19 = v_u_8(v_u_11.CurrentOffset, v_u_10.ROTATION_ROUNDING_PIXEL)
		v_u_7.Position = UDim2.fromScale(0.5, 0.5) + UDim2.fromOffset(v19, 0)
	end
end)
local v_u_22 = {
	[Enum.KeyCode.DPadLeft] = {
		["Test"] = function()
			-- upvalues: (copy) v_u_11
			local v20 = v_u_11
			v20.CurrentOffset = v20.CurrentOffset - 30
		end
	},
	[Enum.KeyCode.DPadRight] = {
		["Test"] = function()
			-- upvalues: (copy) v_u_11
			local v21 = v_u_11
			v21.CurrentOffset = v21.CurrentOffset + 30
		end
	}
}
local v_u_23 = {}
v_u_3.InputBegan:Connect(function(p_u_24, _)
	-- upvalues: (copy) v_u_22
	local v25 = v_u_22[p_u_24.KeyCode] or v_u_22[p_u_24.UserInputType]
	if v25 then
		for _, v_u_26 in v25 do
			task.spawn(function()
				-- upvalues: (copy) v_u_26, (copy) p_u_24
				v_u_26(p_u_24)
			end)
		end
	end
end)
v_u_3.InputEnded:Connect(function(p_u_27, _)
	-- upvalues: (copy) v_u_23
	local v28 = v_u_23[p_u_27.KeyCode] or v_u_23[p_u_27.UserInputType]
	if v28 then
		for _, v_u_29 in v28 do
			task.spawn(function()
				-- upvalues: (copy) v_u_29, (copy) p_u_27
				v_u_29(p_u_27)
			end)
		end
	end
end)
return v_u_11