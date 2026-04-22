local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("FireworkController"))
local v_u_2 = game:GetService("TweenService")
local v_u_3 = false
local v_u_4 = false
local v5 = workspace:WaitForChild("BasePlate"):WaitForChild("TopBaseplate")
local v_u_6 = v5.Size
local v_u_7 = v5.CFrame
local v8 = game.Players.LocalPlayer
local v_u_9 = (v8.Character or v8.CharacterAdded:Wait()):WaitForChild("Humanoid"):WaitForChild("Animator")
local v_u_10 = game:GetService("Lighting")
local v_u_11 = v_u_10.ClockTime
local v_u_12 = nil
local function v_u_14(p13)
	-- upvalues: (ref) v_u_12, (copy) v_u_9
	if p13 and not v_u_12 then
		v_u_12 = v_u_9:LoadAnimation(script.Dances["Dance" .. math.random(1, 3)])
		v_u_12.Priority = Enum.AnimationPriority.Action4
		v_u_12:Play()
	elseif not p13 and v_u_12 then
		v_u_12:Stop()
		v_u_12 = nil
	end
end
local function v_u_16(p15)
	-- upvalues: (copy) v_u_2, (copy) v_u_10
	v_u_2:Create(v_u_10, TweenInfo.new(1, Enum.EasingStyle.Sine), {
		["ClockTime"] = p15
	}):Play()
end
workspace:GetAttributeChangedSignal("2026Fireworks"):Connect(function()
	-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_11, (copy) v_u_10, (copy) v_u_16, (copy) v_u_6, (copy) v_u_7, (copy) v_u_1, (copy) v_u_14
	v_u_3 = workspace:GetAttribute("2026Fireworks")
	if v_u_3 and not v_u_4 then
		v_u_4 = true
		v_u_11 = v_u_10.ClockTime
		v_u_16(22)
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_6, (ref) v_u_7, (ref) v_u_1, (ref) v_u_4, (ref) v_u_16, (ref) v_u_11
			while v_u_3 do
				local v17 = (math.random() - 0.5) * v_u_6.X
				local v18 = (math.random() - 0.5) * v_u_6.Z
				local v19 = v_u_6.Y / 2
				local v20 = v_u_7 * CFrame.new(v17, v19, v18) * CFrame.new(0, 5, 0)
				v_u_1.Force_Create_Firework(v20, true, ({ "New Year\'s Firework", "Firework" })[math.random(2)])
				task.wait(0.2)
			end
			v_u_4 = false
			v_u_16(v_u_11)
		end)
	end
	v_u_14(workspace:GetAttribute("2026Fireworks"))
end)
local v_u_21 = workspace:GetAttribute("2026Fireworks")
if v_u_21 and not v_u_4 then
	local v_u_22 = true
	v_u_11 = v_u_10.ClockTime
	v_u_16(22)
	task.spawn(function()
		-- upvalues: (ref) v_u_21, (copy) v_u_6, (copy) v_u_7, (copy) v_u_1, (ref) v_u_22, (copy) v_u_16, (ref) v_u_11
		while v_u_21 do
			local v23 = (math.random() - 0.5) * v_u_6.X
			local v24 = (math.random() - 0.5) * v_u_6.Z
			local v25 = v_u_6.Y / 2
			local v26 = v_u_7 * CFrame.new(v23, v25, v24) * CFrame.new(0, 5, 0)
			v_u_1.Force_Create_Firework(v26, true, ({ "New Year\'s Firework", "Firework" })[math.random(2)])
			task.wait(0.2)
		end
		v_u_22 = false
		v_u_16(v_u_11)
	end)
end
v_u_14(workspace:GetAttribute("2026Fireworks"))
return {}