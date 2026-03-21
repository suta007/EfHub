return function(p1)
	local v2 = Instance.new("Part")
	v2.Anchored = true
	v2.Size = Vector3.new(0.5, 0.5, 0.5)
	v2.Shape = Enum.PartType.Ball
	v2.Transparency = 0.5
	v2.Color = Color3.fromRGB(255, 0, 0)
	v2.Material = Enum.Material.Neon
	v2.Position = p1
	v2.CanQuery = false
	v2.Name = "TestPart"
	local v_u_3 = Instance.new("SphereHandleAdornment")
	v_u_3.Adornee = v2
	v_u_3.AdornCullingMode = Enum.AdornCullingMode.Never
	v_u_3.Radius = 0.5
	v_u_3.AlwaysOnTop = true
	v_u_3.Parent = v2
	task.delay(0.2, function()
		-- upvalues: (copy) v_u_3
		v_u_3.ZIndex = 99
	end)
	v2.Parent = workspace
	return v2
end