local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.Modules.CreateTagHandler)
local v_u_4 = {}
local v_u_5 = 0
task.spawn(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (ref) v_u_5
	while true do
		for _, v6 in v_u_4 do
			local v7 = {
				["Rotation"] = v_u_5
			}
			v_u_1:Create(v6, TweenInfo.new(1, Enum.EasingStyle.Linear), v7):Play()
		end
		wait(1)
		if v_u_5 >= 360 then
			v_u_5 = 0
			for _, v8 in v_u_4 do
				v8.Rotation = 0
			end
		end
		v_u_5 = v_u_5 + 180
	end
end)
v3({
	["Tag"] = "AnimateGradient",
	["OnInstanceAdded"] = function(p9)
		-- upvalues: (ref) v_u_5, (copy) v_u_4
		if p9 and p9:IsA("UIGradient") then
			p9.Rotation = v_u_5
			local v10 = v_u_4
			table.insert(v10, p9)
		end
	end,
	["OnInstanceRemoved"] = function(p11)
		-- upvalues: (copy) v_u_4
		table.remove(v_u_4, table.find(v_u_4, p11))
	end
})