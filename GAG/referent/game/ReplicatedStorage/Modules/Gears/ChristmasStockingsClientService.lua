local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
require(v2.Data.Gears.MysticalSnowGlobeConfigData)
local v3 = require(v2.Modules.CreateTagHandler)
local v_u_4 = require(v2.Modules.DataService)
require(v2.Modules.NumberUtil)
require(v2.Comma_Module)
local v_u_5 = require(v2.Modules.TimeHelper)
local v_u_6 = require(v2.Data.Gears.ChristmasStockingsConfigData)
local v_u_7 = v2.GameEvents.TryUsePlaceableGear
local v_u_8 = v_u_1.LocalPlayer
local v_u_9 = v_u_8.Character or v_u_8.CharacterAdded:Wait()
local v_u_10 = script.ProxAtt
local v_u_11 = v_u_8.PlayerGui:WaitForChild("ChristmasStockingUI", 30)
local v_u_12 = v_u_11:WaitForChild("Container", 30):WaitForChild("TextLabel", 30)
local v_u_13 = v_u_4:GetData()
local v_u_14 = nil
local v_u_15 = {}
local v_u_16 = {}
local v17 = {}
local v18 = 0
while not v_u_8:GetAttribute("FarmFullyLoaded") do
	task.wait(1)
	if v18 >= 300 or not v_u_8:IsDescendantOf(v_u_1) then
		break
	end
	v18 = v18 + 1
end
local function v_u_25()
	-- upvalues: (copy) v_u_16, (copy) v_u_4, (copy) v_u_6
	for v19, v20 in v_u_16 do
		local v21 = v20:FindFirstChildWhichIsA("ProximityPrompt")
		if v21 then
			local v22 = v19:GetAttribute("OBJECT_UUID")
			if v22 then
				local v23 = v_u_4:GetData()
				if v23 and v23.GearUseData.ChristmasStockings[v22] then
					local v24 = v23.GearUseData.ChristmasStockings[v22].StartFillTime
					v21.Enabled = v_u_6.REWARD_FILL_TIME <= workspace:GetServerTimeNow() - v24
				end
			end
		end
	end
end
v3({
	["Tag"] = "ChristmasStockingObject",
	["OnInstanceAdded"] = function(p_u_26)
		-- upvalues: (copy) v_u_15, (copy) v_u_16, (copy) v_u_1, (copy) v_u_8, (copy) v_u_10, (copy) v_u_7, (copy) v_u_25, (ref) v_u_14, (copy) v_u_9, (copy) v_u_11, (copy) v_u_13, (copy) v_u_6, (copy) v_u_12, (copy) v_u_5
		if v_u_15[p_u_26] then
			v_u_15[p_u_26]:Disconnect()
			v_u_15[p_u_26] = nil
		end
		if v_u_16[p_u_26] then
			v_u_16[p_u_26]:Destroy()
			v_u_16[p_u_26] = nil
		end
		task.defer(function()
			-- upvalues: (copy) p_u_26, (ref) v_u_1, (ref) v_u_8, (ref) v_u_10, (ref) v_u_16, (ref) v_u_15, (ref) v_u_7, (ref) v_u_25
			local v27 = p_u_26:GetAttribute("OWNER")
			if v27 then
				local v28 = v_u_1:FindFirstChild(v27)
				if v28 then
					if v_u_8 == v28 then
						local v29 = v_u_10:Clone()
						v29.Parent = p_u_26:FindFirstChild("Sock") or p_u_26.PrimaryPart
						v_u_16[p_u_26] = v29
						local v_u_30 = v29:FindFirstChild("ProximityPrompt")
						v_u_15[p_u_26] = v_u_30.Triggered:Connect(function(p31)
							-- upvalues: (ref) v_u_8, (ref) v_u_7, (ref) p_u_26, (copy) v_u_30
							if p31 == v_u_8 then
								v_u_7:FireServer(p_u_26)
								task.defer(function()
									-- upvalues: (ref) v_u_30
									v_u_30.Enabled = false
								end)
							end
						end)
						v_u_25()
					end
				else
					return
				end
			else
				return
			end
		end)
		if not v_u_14 then
			if v_u_14 then
				return
			end
			task.spawn(function()
				-- upvalues: (ref) v_u_25, (ref) v_u_9, (ref) v_u_16, (ref) v_u_11, (ref) v_u_13, (ref) v_u_6, (ref) v_u_12, (ref) v_u_5
				while true do
					v_u_25()
					local v32 = v_u_9:GetPivot().Position
					local v33 = (1 / 0)
					local v34 = nil
					local v35 = nil
					for v36, v37 in v_u_16 do
						local v38 = (v32 - v37.WorldPosition).Magnitude
						if v38 <= 15 and v38 <= v33 then
							v35 = v36
							v34 = v37
							v33 = v38
						end
					end
					if v34 then
						v_u_11.Enabled = true
						v_u_11.Adornee = v34
						local v39 = v35:GetAttribute("OBJECT_UUID")
						local v40 = v_u_13 and v39 and (v_u_13.GearUseData.ChristmasStockings[v39] and v_u_13.GearUseData.ChristmasStockings[v39].StartFillTime or nil)
						if v40 then
							local v41 = workspace:GetServerTimeNow() - v40
							local v42 = v_u_6.REWARD_FILL_TIME - v41
							if v42 > 0 then
								v_u_12.Text = ("FILLS IN %* \226\143\176"):format((v_u_5:GetLargestTime(v42, "round")))
							else
								v_u_12.Text = "READY TO CLAIM \240\159\142\129"
							end
						end
					else
						v_u_11.Enabled = false
						v_u_12.Text = ""
					end
					task.wait(1)
				end
			end)
		end
	end,
	["OnInstanceRemoved"] = function(p43)
		-- upvalues: (copy) v_u_15, (copy) v_u_16, (ref) v_u_14
		if v_u_15[p43] then
			v_u_15[p43]:Disconnect()
			v_u_15[p43] = nil
		end
		if v_u_16[p43] then
			v_u_16[p43]:Destroy()
			v_u_16[p43] = nil
		end
		if next(v_u_16) == nil then
			if not v_u_14 then
				return
			end
			task.cancel(v_u_14)
			v_u_14 = nil
		end
	end
})
return v17