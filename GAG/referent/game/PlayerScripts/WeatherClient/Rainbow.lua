local v1 = {}
local v_u_2 = false
local v_u_3 = script.Sky
local v_u_4 = require(game.ReplicatedStorage.Modules.SkyboxManager)
require(game.ReplicatedStorage.Code.CameraShaker)
local v5 = game.Lighting.ColorCorrection:Clone()
v5.Name = script.Name
v5.Parent = game.Lighting
v_u_4.AddSkybox(v_u_3, 0)
local function v_u_22()
	-- upvalues: (ref) v_u_2, (copy) v_u_4, (copy) v_u_3
	v_u_2 = true
	v_u_4.UpdateSkybox(v_u_3, 2)
	tick()
	local v_u_6 = game.ReplicatedStorage.Assets.Rainbow:Clone()
	v_u_6.Parent = workspace
	local v_u_7 = v_u_6:FindFirstChild("Beam", true);
	(function()
		-- upvalues: (copy) v_u_6, (copy) v_u_7
		v_u_6.End.PixelSmoke.Enabled = false
		v_u_6.Start.PixelSmoke.Enabled = false
		v_u_6.Start.PixelSmoke.Enabled = true
		local v8 = 0.001
		while v8 < 3 do
			v8 = v8 + game:GetService("RunService").Heartbeat:Wait()
			local v9 = game.TweenService:GetValue(v8 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			local v10 = 0.052 + math.clamp(v9, 0, 1) * 0.898
			local v11 = math.clamp(v10, 0.052, 0.949)
			local v12 = NumberSequence.new
			local v13 = {}
			local v14 = NumberSequenceKeypoint.new(0, 1)
			local v15 = NumberSequenceKeypoint.new(0.05, 1)
			local v16 = NumberSequenceKeypoint.new(0.051, 0)
			local v17 = NumberSequenceKeypoint.new
			local v18 = v11 - 0.1
			__set_list(v13, 1, {v14, v15, v16, v17(math.clamp(v18, 0.052, 0.95), 0), NumberSequenceKeypoint.new(math.clamp(v11, 0.053, 0.95), 1), NumberSequenceKeypoint.new(0.95, 1), NumberSequenceKeypoint.new(1, 1)})
			v_u_7.Transparency = v12(v13)
		end
		v_u_6.End.PixelSmoke.Enabled = true
	end)()
	repeat
		task.wait(0.1)
	until v_u_2 == false
	v_u_4.UpdateSkybox(v_u_3, 0);
	(function()
		-- upvalues: (copy) v_u_6, (copy) v_u_7
		v_u_6.End.PixelSmoke.Enabled = false
		v_u_6.Start.PixelSmoke.Enabled = false
		local v19 = 0
		while v19 < 3 do
			v19 = v19 + game:GetService("RunService").Heartbeat:Wait()
			local v20 = game.TweenService:GetValue(v19 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			local v21 = math.clamp(v20, 0, 1)
			v_u_7.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.05, 1),
				NumberSequenceKeypoint.new(0.051, v21),
				NumberSequenceKeypoint.new(0.949, v21),
				NumberSequenceKeypoint.new(0.95, 1),
				NumberSequenceKeypoint.new(1, 1)
			})
		end
	end)()
	game.Debris:AddItem(v_u_6, 4)
end
workspace:GetAttributeChangedSignal("Rainbow"):Connect(function()
	-- upvalues: (copy) v_u_22, (ref) v_u_2
	if workspace:GetAttribute("Rainbow") then
		v_u_22()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("Rainbow") then
	task.defer(v_u_22)
else
	v_u_2 = false
end
return v1