local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players")
local v_u_5 = require(v1.Modules.Trove)
local v6 = {}
v6.__index = v6
local v_u_7 = {
	["PopHeight"] = 3,
	["PopDuration"] = 0.5,
	["HoverDuration"] = 1.5,
	["FollowDuration"] = 1,
	["ImageSize"] = UDim2.fromScale(1, 1),
	["PartSize"] = Vector3.new(2, 2, 2),
	["CurveHeight"] = 5
}
local v_u_8 = script.RewardPart
v_u_8.Parent = nil
function v6.Create(p9, p10, p11, p_u_12)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_8, (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v13 = p11 or {}
	local v14 = v13.PopHeight or v_u_7.PopHeight
	local v15 = v13.PopDuration or v_u_7.PopDuration
	local v16 = v13.HoverDuration or v_u_7.HoverDuration
	local v_u_17 = v13.FollowDuration or v_u_7.FollowDuration
	if not v13.ImageSize then
		local _ = v_u_7.ImageSize
	end
	if not v13.PartSize then
		local _ = v_u_7.PartSize
	end
	local v_u_18 = v13.CurveHeight or v_u_7.CurveHeight
	local v_u_19 = v_u_5.new()
	local v_u_20 = v_u_8:Clone()
	v_u_20.Position = p9
	v_u_20.Name = "DEBRIS"
	v_u_19:Add(v_u_20)
	v_u_20.BillboardGui.ImageLabel.Image = p10
	v_u_20.Parent = workspace.Terrain
	local v21 = {
		["Position"] = p9 + Vector3.new(0, v14, 0)
	}
	v_u_3:Create(v_u_20, TweenInfo.new(v15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), v21):Play()
	v_u_19:Add(v_u_2.Heartbeat:Connect(function(p22)
		-- upvalues: (copy) v_u_20
		if v_u_20 then
			local v23 = v_u_20.BillboardGui.Sunshine
			v23.Rotation = v23.Rotation + 45 * p22 % 360
		end
	end))
	v_u_19:Add(task.delay(v15 + v16, function()
		-- upvalues: (ref) v_u_4, (copy) v_u_19, (copy) v_u_20, (ref) v_u_2, (copy) v_u_17, (copy) v_u_18, (copy) p_u_12
		local v24 = v_u_4.LocalPlayer
		if v24 and v24.Character then
			local v_u_25 = v24.Character:FindFirstChild("HumanoidRootPart")
			if v_u_25 then
				local v_u_26 = v_u_20.Position
				local v_u_27 = 0
				v_u_20.Anchored = true
				v_u_19:Add(v_u_2.Heartbeat:Connect(function(p28)
					-- upvalues: (ref) v_u_27, (ref) v_u_17, (copy) v_u_25, (copy) v_u_26, (ref) v_u_18, (ref) v_u_20, (ref) v_u_19, (ref) p_u_12
					v_u_27 = v_u_27 + p28
					local v29 = v_u_27 / v_u_17
					local v30 = math.min(v29, 1)
					local v31 = 1 - v30
					local v32 = 1 - math.pow(v31, 3)
					local v33 = v_u_25.Position + Vector3.new(0, 2, 0)
					local v34 = v_u_18
					local v35 = (v_u_26 + v33) / 2 + Vector3.new(0, v34, 0)
					v_u_20.Position = v_u_26:Lerp(v35, v32):Lerp(v35:Lerp(v33, v32), v32)
					local v36 = 1 - v32 * 0.5
					v_u_20.BillboardGui.Size = UDim2.fromScale(v36 * 4, v36 * 4)
					if v30 >= 1 then
						v_u_19:Destroy()
						if p_u_12 then
							p_u_12()
						end
					end
				end))
			else
				v_u_19:Destroy()
			end
		else
			v_u_19:Destroy()
			return
		end
	end))
	return v_u_20
end
return v6