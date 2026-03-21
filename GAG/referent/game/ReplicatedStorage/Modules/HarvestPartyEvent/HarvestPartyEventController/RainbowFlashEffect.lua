local v_u_1 = game:GetService("TweenService")
local v2 = {}
local v_u_3 = {
	Color3.fromRGB(255, 60, 60),
	Color3.fromRGB(255, 165, 0),
	Color3.fromRGB(255, 255, 0),
	Color3.fromRGB(60, 255, 60),
	Color3.fromRGB(60, 60, 255),
	Color3.fromRGB(180, 60, 255)
}
function v2.Play(p4, p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	local v6 = p5 / 16 * 5
	local v7 = math.floor(v6) + 1
	local v8 = p5 / 16 * 0.35 + 0.15
	local v9 = Instance.new("Frame")
	v9.Size = UDim2.fromScale(1, 1)
	v9.Position = UDim2.fromScale(0, 0)
	v9.BorderSizePixel = 0
	v9.BackgroundTransparency = 1
	v9.ZIndex = 99
	v9.Parent = p4
	for _ = 1, v7 do
		for _, v10 in v_u_3 do
			v9.BackgroundColor3 = v10
			v_u_1:Create(v9, TweenInfo.new(0.12, Enum.EasingStyle.Linear), {
				["BackgroundTransparency"] = 1 - v8
			}):Play()
			task.wait(0.12)
			v_u_1:Create(v9, TweenInfo.new(0.12, Enum.EasingStyle.Linear), {
				["BackgroundTransparency"] = 1
			}):Play()
			task.wait(0.12)
		end
	end
	v9:Destroy()
end
return v2