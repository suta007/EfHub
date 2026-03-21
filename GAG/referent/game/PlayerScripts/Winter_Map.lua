game:GetService("ReplicatedFirst")
local v_u_1 = game:GetService("TweenService")
local v2 = game.ReplicatedStorage.GameEvents.Set_Map_Christmas
local v_u_3 = false
local _ = game.Players.LocalPlayer
local v_u_4 = require(game.ReplicatedStorage.Modules.DataService):GetData()
v2.OnClientEvent:Connect(function()
	-- upvalues: (ref) v_u_3, (copy) v_u_1, (copy) v_u_4
	if not v_u_3 then
		v_u_3 = true
		local v5 = v_u_1:Create(workspace:WaitForChild("BasePlate"):WaitForChild("TopBaseplate"), TweenInfo.new(8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			["Color"] = Color3.new(1, 1, 1)
		})
		v5:Play()
		v5.Completed:Wait()
		if not v_u_4.FirstTimeUser then
			for _, v6 in script.ChristmasAssets:GetChildren() do
				v6.Parent = workspace
			end
		end
		v_u_3 = false
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_1
	while true do
		repeat
			task.wait(60)
		until not workspace:GetAttribute("OverrideBasePlateColor")
		local v7 = workspace:WaitForChild("BasePlate"):WaitForChild("TopBaseplate")
		if v7.Color ~= Color3.new(1, 1, 1) then
			v_u_1:Create(v7, TweenInfo.new(8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				["Color"] = Color3.new(1, 1, 1)
			}):Play()
		end
	end
end)