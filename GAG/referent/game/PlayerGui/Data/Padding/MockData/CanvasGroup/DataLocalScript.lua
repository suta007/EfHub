local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Modules.TradeControllers.TradeWorldController)
local v_u_5 = v1.LocalPlayer
local v_u_6 = script.Parent
local function v_u_8()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_6
	local v7 = v_u_5:GetAttribute("DataFullyLoaded")
	if v7 then
		v7 = v_u_5:GetAttribute("FarmFullyLoaded") or v_u_4:IsInWorld()
	end
	v_u_2:Create(v_u_6, TweenInfo.new(1.5), {
		["GroupTransparency"] = v7 and 1 or 0
	}):Play()
end
task.spawn(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_2
	while true do
		task.wait()
		local v9 = v_u_5:GetAttribute("DataFullyLoaded")
		if v9 then
			v9 = v_u_5:GetAttribute("FarmFullyLoaded") or v_u_4:IsInWorld()
		end
		if not v9 then
			local v10 = v_u_6.ImageLabel.ImageLabel
			local v11 = v_u_2:Create(v10, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
				["Rotation"] = v10.Rotation + 180
			})
			v11:Play()
			v11.Completed:Wait()
			local v12 = v_u_2:Create(v10, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
				["Rotation"] = v10.Rotation + 180
			})
			v12:Play()
			v12.Completed:Wait()
			task.wait(1)
		end
	end
end)
v_u_5:GetAttributeChangedSignal("DataFullyLoaded"):Connect(function()
	-- upvalues: (copy) v_u_8
	v_u_8()
end)
v_u_5:GetAttributeChangedSignal("FarmFullyLoaded"):Connect(function()
	-- upvalues: (copy) v_u_8
	v_u_8()
end)
v_u_8()