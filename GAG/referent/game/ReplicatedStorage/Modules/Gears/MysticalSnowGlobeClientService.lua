local v_u_1 = game:GetService("Players")
local v_u_2 = require(game.ReplicatedStorage.Data.Gears.MysticalSnowGlobeConfigData)
local v3 = require(game.ReplicatedStorage.Modules.CreateTagHandler)
local v_u_4 = require(game.ReplicatedStorage.Modules.DataService)
local v_u_5 = require(game.ReplicatedStorage.Modules.NumberUtil)
require(game.ReplicatedStorage.Comma_Module)
local v_u_6 = script.ProxAtt
local v_u_7 = game.ReplicatedStorage.GameEvents.TryUsePlaceableGear
local v_u_8 = v_u_1.LocalPlayer
local v_u_9 = {}
local v_u_10 = {}
local function v_u_16()
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_2, (copy) v_u_5
	local v11 = v_u_4:GetData().GearUseData.SnowGlobe.TimesUsed
	for _, v12 in v_u_10 do
		local v13 = v12:FindFirstChildWhichIsA("ProximityPrompt")
		if v13 then
			local v14
			if v11 > 0 then
				local v15 = v_u_2:GetCost(v11)
				v14 = ("%*"):format((v_u_5.DisplaySheckles(v15)))
			else
				v14 = "FREE"
			end
			v13.ActionText = v14
		end
	end
end
v3({
	["Tag"] = "MysticalSnowGlobeObject",
	["OnInstanceAdded"] = function(p_u_17)
		-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_1, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) v_u_16
		if v_u_9[p_u_17] then
			v_u_9[p_u_17]:Disconnect()
			v_u_9[p_u_17] = nil
		end
		if v_u_10[p_u_17] then
			v_u_10[p_u_17]:Destroy()
			v_u_10[p_u_17] = nil
		end
		task.defer(function()
			-- upvalues: (copy) p_u_17, (ref) v_u_1, (ref) v_u_8, (ref) v_u_6, (ref) v_u_10, (ref) v_u_9, (ref) v_u_7, (ref) v_u_16
			local v18 = p_u_17:GetAttribute("OWNER")
			if v18 then
				local v19 = v_u_1:FindFirstChild(v18)
				if v19 then
					if v_u_8 == v19 then
						local v20 = v_u_6:Clone()
						v20.Parent = p_u_17:FindFirstChild("Orb") or p_u_17.PrimaryPart
						v_u_10[p_u_17] = v20
						v_u_9[p_u_17] = v20:FindFirstChild("ProximityPrompt").Triggered:Connect(function(p21)
							-- upvalues: (ref) v_u_8, (ref) v_u_7, (ref) p_u_17
							if p21 == v_u_8 then
								v_u_7:FireServer(p_u_17)
							end
						end)
						v_u_16()
					end
				else
					return
				end
			else
				return
			end
		end)
	end,
	["OnInstanceRemoved"] = function(p22)
		-- upvalues: (copy) v_u_9, (copy) v_u_10
		if v_u_9[p22] then
			v_u_9[p22]:Disconnect()
			v_u_9[p22] = nil
		end
		if v_u_10[p22] then
			v_u_10[p22]:Destroy()
			v_u_10[p22] = nil
		end
	end
})
v_u_4:GetPathSignal("GearUseData/SnowGlobe/@"):Connect(v_u_16)
return {}