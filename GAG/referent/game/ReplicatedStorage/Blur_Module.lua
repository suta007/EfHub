local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game.Lighting.Blur
function v1.Blur(p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = v_u_2:Create(v_u_3, TweenInfo.new(p5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
		["Size"] = p4
	})
	v6:Play()
	game.Debris:AddItem(v6, p5)
end
return v1