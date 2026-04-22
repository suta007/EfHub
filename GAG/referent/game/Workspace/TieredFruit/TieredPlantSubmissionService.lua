local v1 = game:GetService("ServerScriptService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players")
local v4 = game:GetService("CollectionService")
local v_u_5 = game:GetService("TweenService")
require(v2.Modules.UpdateService)
local v_u_6 = require(v1.Modules.InventoryService)
local v_u_7 = require(v1.Modules.DataService)
local v_u_8 = require(v1.Modules.GiveService)
require(v2.Modules.GiveServiceCommon)
local v_u_9 = require(v2.Item_Module)
local v_u_10 = require(v2.Data.TieredPlantRewardData)
local v_u_11 = require(v2.Data.EnumRegistry.InventoryServiceEnums)
local v_u_12 = require(v2.Data.EnumRegistry.ItemTypeEnums)
local v13 = v2:WaitForChild("GameEvents")
local v_u_14 = v13.Notification
local v_u_15 = v13.TieredPlants.Submit
local v_u_16 = v13.FireDrop
local v_u_17 = v4:GetTagged("TieredPlantNPC")[1]
local v_u_18 = require(v2.Modules.EventService).new("TieredPlantSubmissionService", "Tiered Plants Submission")
local function v_u_22(p19, p20)
	-- upvalues: (copy) v_u_7
	if not p19 then
		warn(("%* | Player is Nil!"):format(p20), debug.traceback())
		return nil
	end
	if not p19:IsA("Player") then
		warn(("%* | %* is not of \'Player\' type!"):format(p20, p19), debug.traceback())
		return nil
	end
	local v21 = v_u_7:GetPlayerData(p19)
	if v21 then
		return v21
	end
	warn((("%* | No PlayerData for %*!"):format(p20, p19.Name)))
	return nil
end
local function v_u_27(p23, p24, p25)
	-- upvalues: (copy) v_u_8, (copy) v_u_14
	if p24 then
		for _, v26 in p24.Rewards do
			v_u_8:Give(p23, v26, p25)
			v_u_14:FireClient(p23, (("Received %*"):format((v_u_8:Format(v26)))))
		end
		if p24.NextSeed then
			v_u_8:Give(p23, p24.NextSeed, p25)
			v_u_14:FireClient(p23, (("Received Tier %* Seed: %*"):format(p24.NextTier, (v_u_8:Format(p24.NextSeed)))))
		end
	end
end
local function v_u_33(p28)
	local v29 = {}
	local v30 = p28.Character
	if not v30 then
		return v29
	end
	local v31 = v30:FindFirstChildWhichIsA("Tool")
	if v31 then
		table.insert(v29, v31)
	end
	for _, v32 in p28.Backpack:GetChildren() do
		table.insert(v29, v32)
	end
	return v29
end
function v_u_18.GetTieredPlantRewards(_, p34, p35)
	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (copy) v_u_5
	local v36 = {}
	local v37 = nil
	local v38 = 0
	for v39, v40 in v_u_10.Tiers do
		if v40.SubmittableFruit[p34] then
			v38 = v39
			break
		end
	end
	if v38 == 0 then
		return nil
	end
	local v41 = v_u_10.Tiers[v38]
	local v42 = v41.SubmittableFruit[p34] or {}
	local v43 = table.clone(v41.TierRewards)
	if v42.UniqueReward then
		local v44 = v42.UniqueReward
		table.insert(v43, v44)
	end
	if v43 and #v43 > 0 then
		local v45 = v43[math.random(1, #v43)]
		table.insert(v36, v45)
	end
	local v46 = v42.NextFruit
	if v46 and v46 ~= "" then
		local v47 = nil
		local v48 = p35:FindFirstChild("Weight")
		local v49 = v_u_3:FindFirstChild("Variant")
		local v50 = v_u_9.Return_Data(p34)
		if v50 and (v48 and v49) then
			local v51 = v50[2]
			local v52 = v48.Value
			local v53 = v49.Value
			local v54 = v_u_10.WeightMultiplierThreshold
			local v55 = (v52 - v51) / (v51 * (v54 - 1))
			local v56 = math.max(v55, 0)
			local v57 = v_u_5:GetValue(math.min(v56, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.In)
			local v58 = {}
			for v59, v60 in pairs(v_u_10.VariantChances) do
				local v61 = v60.Base + (v60.Max - v60.Base) * v57
				if v53 and v_u_10.VariantMultipliers[v53] then
					v61 = v61 * v_u_10.VariantMultipliers[v53]
				end
				local v62 = v_u_10.VariantChanceCap
				v58[v59] = math.min(v61, v62)
			end
			local v63 = math.random() * 100
			if v63 <= v58.Rainbow then
				v47 = "Rainbow"
			elseif v63 <= v58.Gold then
				v47 = "Gold"
			elseif v63 <= v58.Silver then
				v47 = "Silver"
			end
		end
		v37 = {
			["Type"] = "Seed",
			["Value"] = v46,
			["Quantity"] = 1,
			["Variant"] = v47
		}
	end
	return {
		["Rewards"] = v36,
		["NextSeed"] = v37,
		["NextTier"] = v38 + 1
	}
end
function v_u_18.SubmitHeldItem(_, p64)
	-- upvalues: (copy) v_u_18, (copy) v_u_22, (copy) v_u_14, (copy) v_u_11, (copy) v_u_12, (copy) v_u_27, (copy) v_u_17, (copy) v_u_6
	if v_u_18.IsRunning then
		if v_u_22(p64, "TieredPlantService:SubmitHeldItem") then
			local v65 = p64.Character
			if v65 then
				local v66 = v65:FindFirstChildWhichIsA("Tool")
				if v66 and not v66:GetAttribute("Traded") then
					local v67 = v66:GetAttribute(v_u_11.ItemName)
					if v67 then
						local v68
						if v66:GetAttribute(v_u_11.ItemName) and v66:GetAttribute(v_u_11.ITEM_TYPE) == v_u_12.Holdable then
							v68 = not v66:GetAttribute(v_u_11.Favorite)
						else
							v68 = false
						end
						if v68 then
							local v69 = v_u_18:GetTieredPlantRewards(v67, v66)
							if v69 then
								v66:SetAttribute("Traded", true)
								v_u_27(p64, v69, v_u_17:GetPivot())
								v_u_6:DeleteTool(p64, v66)
							else
								v_u_14:FireClient(p64, "I can\'t take that!")
							end
						elseif v66:GetAttribute(v_u_11.ITEM_TYPE) == v_u_12.Holdable then
							v_u_14:FireClient(p64, "You cannot submit a favorited plant!")
						else
							v_u_14:FireClient(p64, "That\'s not a plant!")
						end
					else
						return
					end
				else
					v_u_14:FireClient(p64, "You do not have a plant in your hand!")
					return
				end
			else
				return
			end
		else
			return
		end
	else
		return
	end
end
function v_u_18.SubmitAllItems(_, p70)
	-- upvalues: (copy) v_u_18, (copy) v_u_22, (copy) v_u_33, (copy) v_u_11, (copy) v_u_12, (copy) v_u_27, (copy) v_u_6, (copy) v_u_16, (copy) v_u_17
	if v_u_18.IsRunning then
		if v_u_22(p70, "TieredPlantService:SubmitAllItems") then
			local v71 = 0
			for _, v72 in v_u_33(p70) do
				local v73
				if v72:GetAttribute(v_u_11.ItemName) and v72:GetAttribute(v_u_11.ITEM_TYPE) == v_u_12.Holdable then
					v73 = not v72:GetAttribute(v_u_11.Favorite)
				else
					v73 = false
				end
				if v73 and not v72:GetAttribute("Traded") then
					local v74 = v_u_18:GetTieredPlantRewards(v72:GetAttribute(v_u_11.ItemName), v72)
					if v74 then
						v71 = v71 + #v74.Rewards
						if v74.NextSeed then
							v71 = v71 + 1
						end
						v72:SetAttribute("Traded", true)
						v_u_27(p70, v74)
						v_u_6:DeleteTool(p70, v72)
					end
				end
			end
			if v71 > 0 then
				v_u_16:FireClient(p70, {
					["Owner"] = p70
				}, v_u_17:GetPivot())
			end
		end
	else
		return
	end
end
function v_u_18.OnStarted(p75)
	-- upvalues: (copy) v_u_15, (copy) v_u_18
	p75:Bind(v_u_15.OnServerEvent:Connect(function(p76, p77)
		-- upvalues: (ref) v_u_18
		if v_u_18.IsRunning then
			if p77 and typeof(p77) == "string" then
				if p77 == "Held" then
					v_u_18:SubmitHeldItem(p76)
				elseif p77 == "All" then
					v_u_18:SubmitAllItems(p76)
				end
			else
				return
			end
		else
			return
		end
	end))
end
v_u_18:Initialize()
return v_u_18