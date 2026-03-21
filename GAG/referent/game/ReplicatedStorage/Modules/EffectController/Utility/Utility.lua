local v_u_1 = {}
local v2 = RaycastParams.new()
v2.FilterType = Enum.RaycastFilterType.Include
v2.FilterDescendantsInstances = { workspace }
v_u_1.RayParams = v2
function v_u_1.AddItem(_, p_u_3, p4)
	task.delay(p4, function()
		-- upvalues: (copy) p_u_3
		if p_u_3.Parent ~= nil then
			p_u_3:Destroy()
		end
	end)
end
function v_u_1.PlaySound(_, p5, p6)
	-- upvalues: (copy) v_u_1
	local v7 = p5:Clone()
	v7.Parent = p6
	v7:Play()
	v_u_1:AddItem(v7, v7.TimeLength)
	return v7
end
function v_u_1.WeldInPlace(_, p8, p9)
	if p8 ~= p9 then
		local v10 = CFrame.new(p8.Position)
		local v11 = Instance.new("ManualWeld")
		v11.Part0 = p8
		v11.Part1 = p9
		v11.C0 = p8.CFrame:inverse() * v10
		v11.C1 = p9.CFrame:inverse() * v10
		v11.Parent = p8
		v11.Name = "Weld"
		return v11
	end
end
function v_u_1.CreateLockPart(_, p12, p13, p14, p15)
	p12:PivotTo(p13)
	local v16
	if p15 then
		v16 = workspace.World.ClientEffects:FindFirstChild(p15)
	else
		v16 = p15
	end
	if not v16 then
		v16 = script.LOCK:Clone()
		v16.Name = p15 or "LOCK"
		v16.Parent = workspace.World.Visuals
		v16.Transparency = 1
	end
	v16:PivotTo(p13)
	if p14 then
		task.delay(p14, v16.Destroy, v16)
	end
	v16.Weld.part1 = p12
	return v16
end
function v_u_1.Round(_, p17, p18, p19)
	local v20 = p19 ^ p18
	local v21 = p17 * v20 + 0.5
	return math.floor(v21) / v20
end
function v_u_1.HasProperty(_, p_u_22, p_u_23)
	local v24, _ = pcall(function()
		-- upvalues: (copy) p_u_22, (copy) p_u_23
		local _ = p_u_22[p_u_23]
	end)
	return v24
end
return v_u_1