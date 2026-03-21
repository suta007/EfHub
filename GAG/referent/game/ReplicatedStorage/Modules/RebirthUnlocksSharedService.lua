local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = game:GetService("ServerScriptService")
local v_u_5 = require(v3.Data.RebirthConfigData)
require(v3.Data.DefaultData)
local v6 = require(v3.Modules.Signal)
local v_u_7 = nil
local v_u_8 = nil
if v_u_2:IsServer() then
	v_u_7 = require(v4.UserGenerated.Server.ServerABTests)
	v_u_8 = require(v4.Modules.DataService)
elseif v_u_2:IsClient() then
	v_u_7 = require(v3.UserGenerated.Client.ClientABTests)
	v_u_8 = require(v3.Modules.DataService)
end
local v_u_9 = v6.new()
local v_u_16 = {
	["OnRebirthUnlock"] = v_u_9,
	["HasBeenAssignedABTest"] = function(_, p10)
		-- upvalues: (ref) v_u_7
		if v_u_7.GetAssignmentsAsync(p10, true) then
			return v_u_7.GetAttributeAsync(p10, "AB_FTURebirthUnlocks", false) and true or false
		else
			return false
		end
	end,
	["HasUnlockedFeature"] = function(p11, p12, p13)
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (ref) v_u_8
		local v14 = v_u_5.REBIRTH_UNLOCKS[p13]
		if v14 then
			if p11:HasBeenAssignedABTest(p12) then
				local v15
				if v_u_2:IsServer() then
					v15 = v_u_8:GetPlayerDataAsync(p12, 30)
				elseif v_u_2:IsClient() then
					v15 = v_u_8:GetData()
				else
					v15 = nil
				end
				if v15 then
					return v14 <= v15.RebirthData.TotalRebirths
				else
					return false
				end
			else
				return true
			end
		else
			warn((("%* not found in ConfigData"):format(p13)))
			return true
		end
	end
}
local v_u_17 = {
	["Seed"] = require(v3.Data.SeedShopData),
	["Egg"] = require(v3.Data.PetEggData),
	["Gear"] = require(v3.Data.GearShopData).Gear
}
function v_u_16.HasUnlockedShopItem(p18, p19, p20, p21)
	-- upvalues: (copy) v_u_17, (copy) v_u_2, (ref) v_u_8
	if p18:HasBeenAssignedABTest(p19) then
		local v22 = v_u_17[p20]
		if v22 or p20 == "ALL" then
			local v23 = nil
			local v24
			if p20 == "ALL" and string.match(p21, "Seed") then
				v24 = string.gsub(p21, " Seed", "")
				if v_u_17.Seed[v24] then
					v23 = v_u_17.Seed[v24]
				else
					v24 = p21
				end
			else
				v24 = p21
			end
			if p20 == "ALL" and not v23 then
				for _, v25 in v_u_17 do
					v23 = v25[v24]
					if v23 then
						break
					end
				end
			else
				v23 = v22[v24]
			end
			if v23 then
				local v26 = v23.RebirthRequirement
				if v26 then
					local v27
					if v_u_2:IsServer() then
						v27 = v_u_8:GetPlayerDataAsync(p19, 30)
					elseif v_u_2:IsClient() then
						v27 = v_u_8:GetData()
					else
						v27 = nil
					end
					if v27 then
						return v26 <= v27.RebirthData.TotalRebirths
					else
						return false
					end
				else
					return true
				end
			else
				warn((("%* not found in ShopData of %*"):format(v24, p20)))
				return true
			end
		else
			return true
		end
	else
		return true
	end
end
function v_u_16.GetRemainingRebirthsNeededForItem(p28, p29, p30, p31)
	-- upvalues: (copy) v_u_17, (copy) v_u_2, (ref) v_u_8
	if not p28:HasBeenAssignedABTest(p29) then
		return 0
	end
	local v32 = v_u_17[p30]
	if not v32 then
		return 0
	end
	local v33 = v32[p31]
	if not v33 then
		warn((("%* not found in ShopData of %*"):format(p31, p30)))
		return 0
	end
	local v34 = v33.RebirthRequirement
	if not v34 then
		return 0
	end
	local v35
	if v_u_2:IsServer() then
		v35 = v_u_8:GetPlayerDataAsync(p29, 30)
	elseif v_u_2:IsClient() then
		v35 = v_u_8:GetData()
	else
		v35 = nil
	end
	if not v35 then
		return 0
	end
	local v36 = v34 - v35.RebirthData.TotalRebirths
	return math.floor(v36)
end
function v_u_16.GetRemainingRebirthsNeededForFeature(p37, p38, p39)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (ref) v_u_8
	if not p37:HasBeenAssignedABTest(p38) then
		return 0
	end
	local v40 = v_u_5.REBIRTH_UNLOCKS[p39]
	if not v40 then
		warn((("%* not found in REBIRTH_UNLOCKS}"):format(p39)))
		return 0
	end
	local v41
	if v_u_2:IsServer() then
		v41 = v_u_8:GetPlayerDataAsync(p38, 30)
	elseif v_u_2:IsClient() then
		v41 = v_u_8:GetData()
	else
		v41 = nil
	end
	if not v41 then
		return 0
	end
	local v42 = v40 - v41.RebirthData.TotalRebirths
	return math.floor(v42)
end
local function v_u_48(p_u_43)
	-- upvalues: (copy) v_u_16, (copy) v_u_2, (ref) v_u_8, (copy) v_u_5, (copy) v_u_9
	if v_u_16:HasBeenAssignedABTest(p_u_43) then
		local v_u_44
		if v_u_2:IsServer() then
			v_u_44 = v_u_8:GetPlayerDataAsync(p_u_43, 30)
		elseif v_u_2:IsClient() then
			v_u_44 = v_u_8:GetData()
		else
			v_u_44 = nil
		end
		local v45
		if v_u_2:IsServer() then
			v45 = v_u_8:GetPathSignal(p_u_43, "RebirthData/TotalRebirths")
		elseif v_u_2:IsClient() then
			v45 = v_u_8:GetPathSignal("RebirthData/TotalRebirths")
		else
			v45 = nil
		end
		if v45 then
			v45:Connect(function()
				-- upvalues: (ref) v_u_5, (copy) v_u_44, (ref) v_u_9, (copy) p_u_43
				for v46, v47 in v_u_5.REBIRTH_UNLOCKS do
					if not v_u_44 then
						return
					end
					if v_u_44.RebirthData.TotalRebirths >= v47 then
						v_u_9:Fire(p_u_43, v46)
					end
				end
			end)
		end
	else
		return
	end
end
v_u_1.PlayerAdded:Connect(v_u_48)
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_48, (copy) v_u_1
	if v_u_2:IsClient() then
		v_u_48(v_u_1.LocalPlayer)
	end
end)
return v_u_16