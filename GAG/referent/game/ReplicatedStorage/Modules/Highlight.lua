local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Debris")
local _ = v1.LocalPlayer
local v_u_13 = {
	["CreateHighlight"] = function(_, p4, p5, p6, p7, p8, p9)
		-- upvalues: (copy) v_u_3
		if p4 and p4:IsA("Model") then
			local v10 = math.min(p5 or 3, 6)
			local v11 = p7 or Color3.new(1, 1, 1)
			local _ = p8 == true
			local _ = typeof(p9) == "number" and math.clamp(p9, 0, 1)
			local v12 = Instance.new("Highlight")
			v12.FillColor = p6 or Color3.new()
			v12.OutlineColor = v11
			v12.FillTransparency = p6 and 0 or 1
			v12.OutlineTransparency = 0
			v12.Adornee = p4
			v12.Parent = p4
			v_u_3:AddItem(v12, v10)
		end
	end
}
v2:WaitForChild("GameEvents"):WaitForChild("HighlightRemote").OnClientEvent:Connect(function(p14, p15, p16, p17, p18, p19)
	-- upvalues: (copy) v_u_13
	v_u_13:CreateHighlight(p14, p15, p16, p17, p18, p19)
end)
return v_u_13