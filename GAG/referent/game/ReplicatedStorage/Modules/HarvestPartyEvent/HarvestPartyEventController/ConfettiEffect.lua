local v_u_1 = game:GetService("TweenService")
local v2 = {}
local v_u_3 = {
	Color3.fromRGB(255, 80, 80),
	Color3.fromRGB(255, 200, 50),
	Color3.fromRGB(80, 220, 80),
	Color3.fromRGB(80, 160, 255),
	Color3.fromRGB(220, 80, 255),
	Color3.fromRGB(255, 140, 0),
	Color3.fromRGB(255, 255, 80),
	Color3.fromRGB(80, 255, 220)
}
function v2.Play(p_u_4, p_u_5)
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	local v6 = p_u_5 / 16 * 140 + 10
	local v7 = math.floor(v6)
	local v_u_8 = p_u_5 / 16 * 2 + 1.5
	for _ = 1, v7 do
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (copy) p_u_4, (copy) p_u_5, (ref) v_u_1, (copy) v_u_8
			local v9 = Instance.new("Frame")
			v9.AnchorPoint = Vector2.new(0.5, 0.5)
			v9.BorderSizePixel = 0
			v9.BackgroundColor3 = v_u_3[math.random(1, #v_u_3)]
			v9.ZIndex = 100
			v9.Size = UDim2.fromOffset(math.random(14, 28), math.random(14, 28))
			local v10 = math.random(0, 100) / 100
			v9.Position = UDim2.new(v10, 0, -0.05, 0)
			v9.Rotation = math.random(0, 360)
			v9.Parent = p_u_4
			task.wait(math.random(0, 60) / 100)
			local v11 = v10 + math.random(-15, 15) / 100
			local v12 = 1.1 + math.random(0, 30) / 100
			local v13 = math.random(-720, 720) * (p_u_5 / 16)
			v_u_1:Create(v9, TweenInfo.new(v_u_8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				["Position"] = UDim2.new(v11, 0, v12, 0),
				["Rotation"] = v9.Rotation + v13
			}):Play()
			task.wait(v_u_8)
			v9:Destroy()
		end)
	end
end
return v2