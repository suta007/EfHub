local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
game:GetService("CollectionService")
local v_u_3 = game:GetService("UserInputService")
require(v1.Modules.GetMouseToWorld)
local v_u_4 = require(v1.Modules.RoundToNearestNumber)
local v5 = require(v1.Data.CosmeticRegistry)
local v_u_6 = require(v1.Modules.CosmeticServices.CosmeticPhyiscalityService)
require(v1.Modules.PlaySound)
local v_u_7 = v5.InputConfig.ROTATION_CONFIG
local v_u_8 = {
	["CurrentOffset"] = 0,
	["Target"] = nil,
	["StartPivot"] = nil,
	["LastCFrame"] = nil,
	["Target"] = nil
}
local v_u_9 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_9
	v_u_9 = workspace.CurrentCamera
end)
local v_u_10 = 0
function v_u_8.SetTarget(_, p11)
	-- upvalues: (copy) v_u_8, (ref) v_u_10, (copy) v_u_3
	v_u_8.LastCFrame = nil
	v_u_10 = v_u_3:GetMouseLocation().X
	v_u_8.Target = nil
	v_u_8.CurrentOffset = 0
	local v12 = v_u_8
	local v13
	if p11 then
		v13 = p11.Parent:GetPivot()
	else
		v13 = nil
	end
	v12.StartPivot = v13
	v_u_8.Target = p11
end
local v_u_14 = Instance.new("Sound")
v_u_14.SoundId = "rbxassetid://103926661258479"
v_u_14.Volume = 0.2
v_u_14.Parent = v1
local function v_u_23()
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (ref) v_u_10, (copy) v_u_4, (copy) v_u_7, (copy) v_u_14, (copy) v_u_6
	if v_u_8.Target then
		local v15 = v_u_3:GetMouseLocation().X
		local v16 = v15 - v_u_10
		local v17 = v_u_8
		v17.CurrentOffset = v17.CurrentOffset + v16
		v_u_10 = v15
		local v18 = v_u_4(v_u_8.CurrentOffset, v_u_7.ROTATION_ROUNDING_PIXEL) / v_u_7.ROTATION_ROUNDING_PIXEL
		local v19 = v_u_8.StartPivot
		local v20 = v18 * v_u_7.ROTATION_STEP_DEGREE
		local v21 = v19 * CFrame.Angles(0, 0, -math.rad(v20))
		local v22 = v_u_8.Target.Parent
		if v_u_8.LastCFrame ~= v21 then
			v_u_8.LastCFrame = v21
			v_u_14.PlaybackSpeed = Random.new():NextNumber(0.95, 1.05)
			v_u_14:Play()
			v_u_6:UpdateCFrame(v22:GetAttribute("CosmeticUUID"), v21)
		end
	else
		return
	end
end
v2.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_23
	v_u_23()
end)
local v_u_26 = {
	[Enum.KeyCode.DPadLeft] = {
		["Test"] = function()
			-- upvalues: (copy) v_u_8
			local v24 = v_u_8
			v24.CurrentOffset = v24.CurrentOffset - 30
		end
	},
	[Enum.KeyCode.DPadRight] = {
		["Test"] = function()
			-- upvalues: (copy) v_u_8
			local v25 = v_u_8
			v25.CurrentOffset = v25.CurrentOffset + 30
		end
	}
}
local v_u_27 = {}
v_u_3.InputBegan:Connect(function(p_u_28, _)
	-- upvalues: (copy) v_u_26
	local v29 = v_u_26[p_u_28.KeyCode] or v_u_26[p_u_28.UserInputType]
	if v29 then
		for _, v_u_30 in v29 do
			task.spawn(function()
				-- upvalues: (copy) v_u_30, (copy) p_u_28
				v_u_30(p_u_28)
			end)
		end
	end
end)
v_u_3.InputEnded:Connect(function(p_u_31, _)
	-- upvalues: (copy) v_u_27
	local v32 = v_u_27[p_u_31.KeyCode] or v_u_27[p_u_31.UserInputType]
	if v32 then
		for _, v_u_33 in v32 do
			task.spawn(function()
				-- upvalues: (copy) v_u_33, (copy) p_u_31
				v_u_33(p_u_31)
			end)
		end
	end
end)
return v_u_8