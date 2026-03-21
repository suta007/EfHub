local v_u_1 = game:GetService("DataStoreService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(script.DataStoreQueue)
local v_u_21 = {
	["PlayerDS"] = v_u_2:IsStudio() and {} or v_u_1:GetDataStore("GA_PlayerDS_1.0.0"),
	["AutoSaveData"] = 180,
	["BasePlayerData"] = {
		["Sessions"] = 0,
		["Transactions"] = 0,
		["ProgressionTries"] = {},
		["CurrentCustomDimension01"] = "",
		["CurrentCustomDimension02"] = "",
		["CurrentCustomDimension03"] = "",
		["ConfigsHash"] = "",
		["AbId"] = "",
		["AbVariantId"] = "",
		["InitAuthorized"] = false,
		["SdkConfig"] = {},
		["ClientServerTimeOffset"] = 0,
		["Configurations"] = {},
		["RemoteConfigsIsReady"] = false,
		["PlayerTeleporting"] = false,
		["OwnedGamepasses"] = nil,
		["CountryCode"] = "",
		["CustomUserId"] = ""
	},
	["DataToSave"] = {
		"Sessions",
		"Transactions",
		"ProgressionTries",
		"CurrentCustomDimension01",
		"CurrentCustomDimension02",
		"CurrentCustomDimension03",
		"OwnedGamepasses"
	},
	["PlayerCache"] = {},
	["EventsQueue"] = {},
	["DataStoreQueue"] = v_u_3,
	["GetPlayerData"] = function(_, p4)
		-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_21
		local v_u_5 = p4.UserId
		local v6, v7 = v_u_3.AddRequest(v_u_5, function()
			-- upvalues: (ref) v_u_2, (ref) v_u_21, (copy) v_u_5
			return v_u_2:IsStudio() and {} or (v_u_21.PlayerDS:GetAsync(v_u_5) or {})
		end, 7)
		return not v6 and {} or v7
	end,
	["GetPlayerDataFromCache"] = function(_, p8)
		-- upvalues: (copy) v_u_21
		return v_u_21.PlayerCache[tonumber(p8)] or v_u_21.PlayerCache[tostring(p8)]
	end,
	["GetErrorDataStore"] = function(_, p_u_9)
		-- upvalues: (copy) v_u_2, (copy) v_u_1
		local v_u_10 = nil
		return not pcall(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_2, (ref) v_u_1, (copy) p_u_9
			v_u_10 = v_u_2:IsStudio() and {} or v_u_1:GetDataStore("GA_ErrorDS_1.0.0", p_u_9)
		end) and {} or v_u_10
	end,
	["SavePlayerData"] = function(_, p11)
		-- upvalues: (copy) v_u_21, (copy) v_u_2, (copy) v_u_3
		local v12 = v_u_21:GetPlayerDataFromCache(p11.UserId)
		local v_u_13 = {}
		if v12 then
			for _, v14 in pairs(v_u_21.DataToSave) do
				v_u_13[v14] = v12[v14]
			end
			local v_u_15 = p11.UserId
			if not v_u_2:IsStudio() then
				v_u_3.AddRequest(v_u_15, function()
					-- upvalues: (ref) v_u_21, (copy) v_u_15, (copy) v_u_13
					return v_u_21.PlayerDS:SetAsync(v_u_15, v_u_13)
				end, 7)
			end
		end
	end,
	["IncrementErrorCount"] = function(_, p_u_16, p_u_17, p_u_18)
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		if p_u_17 then
			local v19
			if v_u_2:IsStudio() then
				v19 = 0
			else
				local v20
				v20, v19 = v_u_3.AddRequest(p_u_17, function()
					-- upvalues: (copy) p_u_16, (copy) p_u_17, (copy) p_u_18
					return p_u_16:IncrementAsync(p_u_17, p_u_18)
				end, 7)
				_ = v20
			end
			return v19
		end
	end
}
return v_u_21