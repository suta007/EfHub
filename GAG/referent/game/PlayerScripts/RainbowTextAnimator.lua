local v1 = game:GetService("RunService")
game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.CreateTagArray)("RainbowText")
v1.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_3
	for _, v4 in v_u_3 do
		v4.TextColor3 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
	end
end)