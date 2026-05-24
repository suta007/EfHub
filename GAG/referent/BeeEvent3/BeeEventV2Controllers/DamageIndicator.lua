local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Debris")
local v_u_3 = require(v1.Modules.Spring)
return function(p4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if not p4.Position then
		return warn("DamageIndicator: Missing Position")
	end
	local v5 = Instance.new("Attachment")
	v5.Parent = workspace.Terrain
	v5.WorldPosition = p4.Position
	local v_u_6 = script.DamageIndicatorGUI:Clone()
	v_u_6.Parent = v5
	if p4.scale then
		v_u_6.Size = p4.scale
	end
	v_u_6.Frame.DamageShadow.Text = p4.Text or ""
	v_u_6.Frame.DamageShadow.Damage.Text = p4.Text or ""
	v_u_6.Frame.DamageShadow.TextColor3 = p4.textColor and p4.textColor:Lerp(Color3.new(), 0.33) or v_u_6.Frame.DamageShadow.TextColor3
	v_u_6.Frame.DamageShadow.Damage.TextColor3 = p4.textColor or v_u_6.Frame.DamageShadow.Damage.TextColor3
	v_u_6.Frame.DamageShadow.Damage.TextStrokeColor3 = p4.textColor and p4.textColor:Lerp(Color3.new(), 0.5) or v_u_6.Frame.DamageShadow.Damage.TextStrokeColor3
	v_u_3.target(v_u_6.Frame.UIScale, 0.9, 3, {
		["Scale"] = 0.2 + math.random(25, 50) / 100
	})
	local v7 = v_u_3.target
	local v8 = {}
	local v9 = math.random(-5, 5)
	local v10 = math.random(-3, 3)
	v8.StudsOffset = vector.create(v9, v10, 0)
	v7(v_u_6, 1.5, 2, v8)
	task.delay(0.65, function()
		-- upvalues: (ref) v_u_3, (copy) v_u_6
		v_u_3.target(v_u_6.Frame.DamageShadow, 0.9, 2.5, {
			["TextTransparency"] = 1
		})
		v_u_3.target(v_u_6.Frame.DamageShadow.Damage, 0.9, 2.5, {
			["TextTransparency"] = 1,
			["TextStrokeTransparency"] = 1
		})
	end)
	v_u_2:AddItem(v5, 3)
end