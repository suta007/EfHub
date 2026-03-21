local v_u_1 = game:GetService("TweenService")
return {
	["CreateBubble"] = function(p2, p3, p4, p5, p6, p7)
		-- upvalues: (copy) v_u_1
		local v8 = script.BubbleMesh:Clone()
		v8.CFrame = p2
		v8.Anchored = true
		v8.CanCollide = false
		v8.Massless = true
		v8.Material = Enum.Material.Glass
		v8.Size = p3
		v8.Transparency = p4
		v8.Parent = workspace:FindFirstChild("Effects") or workspace
		local v9 = Instance.new("Highlight")
		v9.Enabled = false
		v9.Parent = v8
		game:GetService("Debris"):AddItem(v8, p6)
		v_u_1:Create(v8, TweenInfo.new(p6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
			["Transparency"] = p7,
			["Size"] = p5
		}):Play()
	end
}