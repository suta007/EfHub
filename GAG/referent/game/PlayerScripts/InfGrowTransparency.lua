local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
game:GetService("CollectionService")
local v3 = require(v1.Modules.CreateTagHandler)
local v_u_4 = require(v1.Data.InfGrowPlantData)
local v_u_5 = v2.LocalPlayer
local v_u_6 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
local v_u_7 = {}
local function v_u_17(_, p_u_8, p_u_9)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	local v_u_10 = v_u_4.InfGrowPlants[p_u_8.Name].CollideThresh or 10
	if p_u_9 then
		local v12 = p_u_9.Touched:Connect(function(p11)
			-- upvalues: (ref) v_u_6, (copy) p_u_8, (copy) v_u_10, (copy) p_u_9
			if p11:IsDescendantOf(v_u_6) then
				if v_u_10 <= p_u_8:GetScale() then
					p_u_9.CanCollide = false
					p_u_9.Transparency = 0.75
				end
			end
		end)
		local v13 = v_u_7
		table.insert(v13, v12)
		local v15 = p_u_9.TouchEnded:Connect(function(p14)
			-- upvalues: (ref) v_u_6, (copy) p_u_9
			if p14:IsDescendantOf(v_u_6) then
				p_u_9.Transparency = 0
			end
		end)
		local v16 = v_u_7
		table.insert(v16, v15)
	else
		warn("No part to no collide")
	end
end
v3({
	["Tag"] = "InfGrowPlant",
	["OnInstanceAdded"] = function(p18)
		-- upvalues: (copy) v_u_17, (copy) v_u_5
		if p18:IsDescendantOf(workspace) then
			v_u_17(v_u_5, p18, (p18:FindFirstChild("1")))
		end
	end,
	["OnInstanceRemoved"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_7
		for _, v19 in v_u_7 do
			v19:Disconnect()
		end
		table.clear(v_u_7)
	end
})