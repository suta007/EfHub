local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game.Players.LocalPlayer
function v1.Setup()
	-- upvalues: (copy) v_u_3
	v_u_3:SetAttribute("Core_FOV", 70)
end
function v1.Change_FOV_CORE(p4)
	-- upvalues: (copy) v_u_3
	if v_u_3 and p4 then
		v_u_3:SetAttribute("Core_FOV", p4)
	end
end
function v1.Return_Core_FOV()
	-- upvalues: (copy) v_u_3
	return v_u_3:GetAttribute("Core_FOV")
end
function v1.Change_FOV(p5, p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if game.Workspace.CurrentCamera then
		local v7 = p6 == nil and 0.5 or p6
		if p5 == 70 then
			p5 = v_u_3:GetAttribute("Core_FOV")
		end
		local v8 = TweenInfo.new(v7 * (math.random(95, 105) * 0.01), Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local v9 = v_u_2:Create(game.Workspace.CurrentCamera, v8, {
			["FieldOfView"] = p5
		})
		v9:Play()
		game.Debris:AddItem(v9, v8.Time)
	end
end
return v1