local v_u_1 = require(script.Parent.Validation)
local v_u_2 = require(script.Parent.Logger)
local v_u_3 = require(script.Parent.HttpApi)
local v_u_4 = require(script.Parent.Store)
local v_u_5 = require(script.Parent.Events)
local v_u_6 = game:GetService("HttpService")
local v_u_7 = {
	["_availableCustomDimensions01"] = {},
	["_availableCustomDimensions02"] = {},
	["_availableCustomDimensions03"] = {},
	["_availableGamepasses"] = {},
	["_enableEventSubmission"] = true,
	["Initialized"] = false,
	["ReportErrors"] = true,
	["UseCustomUserId"] = false,
	["AutomaticSendBusinessEvents"] = true,
	["ConfigsHash"] = ""
}
local v_u_8 = nil
local function v_u_20(p9)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_2, (ref) v_u_8
	local v10 = v_u_4:GetPlayerDataFromCache(p9.UserId)
	local v11 = v10.SdkConfig
	if v11.configs then
		local v12 = v11.configs
		for _, v13 in pairs(v12) do
			if v13 then
				local v14 = v13.key or ""
				local v15 = v13.start_ts or 0
				local v16 = v13.end_ts or (1 / 0)
				local v17 = v_u_4:GetPlayerDataFromCache(p9.UserId)
				local v18
				if v17 then
					v18 = os.time()
					local v19 = v18 + v17.ClientServerTimeOffset
					if v_u_1:validateClientTs(v19) then
						v18 = v19
					end
				else
					v18 = os.time()
				end
				if #v14 > 0 and (v13.value and (v15 < v18 and v18 < v16)) then
					v10.Configurations[v14] = v13.value
					v_u_2:d("configuration added: key=" .. v13.key .. ", value=" .. v13.value)
				end
			end
		end
	end
	v_u_2:i("Remote configs populated")
	v10.RemoteConfigsIsReady = true
	v_u_8 = v_u_8 or game:GetService("ReplicatedStorage"):WaitForChild("GameAnalyticsRemoteConfigs")
	v_u_8:FireClient(p9, v10.Configurations)
end
function v_u_7.sessionIsStarted(_, p21)
	-- upvalues: (copy) v_u_4
	local v22 = v_u_4:GetPlayerDataFromCache(p21)
	if v22 then
		return v22.SessionStart ~= 0
	else
		return false
	end
end
function v_u_7.isEnabled(_, p23)
	-- upvalues: (copy) v_u_4
	local v24 = v_u_4:GetPlayerDataFromCache(p23)
	if v24 then
		return v24.InitAuthorized and true or false
	else
		return false
	end
end
function v_u_7.validateAndFixCurrentDimensions(p25, p26)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_2
	local v27 = v_u_4:GetPlayerDataFromCache(p26)
	if not v_u_1:validateDimension(p25._availableCustomDimensions01, v27.CurrentCustomDimension01) then
		v_u_2:d("Invalid dimension01 found in variable. Setting to nil. Invalid dimension: " .. v27.CurrentCustomDimension01)
	end
	if not v_u_1:validateDimension(p25._availableCustomDimensions02, v27.CurrentCustomDimension02) then
		v_u_2:d("Invalid dimension02 found in variable. Setting to nil. Invalid dimension: " .. v27.CurrentCustomDimension02)
	end
	if not v_u_1:validateDimension(p25._availableCustomDimensions03, v27.CurrentCustomDimension03) then
		v_u_2:d("Invalid dimension03 found in variable. Setting to nil. Invalid dimension: " .. v27.CurrentCustomDimension03)
	end
end
function v_u_7.setAvailableCustomDimensions01(p28, p29)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if v_u_1:validateCustomDimensions(p29) then
		p28._availableCustomDimensions01 = p29
		v_u_2:i("Set available custom01 dimension values: (" .. table.concat(p29, ", ") .. ")")
	end
end
function v_u_7.setAvailableCustomDimensions02(p30, p31)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if v_u_1:validateCustomDimensions(p31) then
		p30._availableCustomDimensions02 = p31
		v_u_2:i("Set available custom02 dimension values: (" .. table.concat(p31, ", ") .. ")")
	end
end
function v_u_7.setAvailableCustomDimensions03(p32, p33)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if v_u_1:validateCustomDimensions(p33) then
		p32._availableCustomDimensions03 = p33
		v_u_2:i("Set available custom03 dimension values: (" .. table.concat(p33, ", ") .. ")")
	end
end
function v_u_7.setAvailableGamepasses(p34, p35)
	-- upvalues: (copy) v_u_2
	p34._availableGamepasses = p35
	v_u_2:i("Set available game passes: (" .. table.concat(p35, ", ") .. ")")
end
function v_u_7.setEventSubmission(p36, p37)
	p36._enableEventSubmission = p37
end
function v_u_7.isEventSubmissionEnabled(p38)
	return p38._enableEventSubmission
end
function v_u_7.setCustomDimension01(_, p39, p40)
	-- upvalues: (copy) v_u_4
	v_u_4:GetPlayerDataFromCache(p39).CurrentCustomDimension01 = p40
end
function v_u_7.setCustomDimension02(_, p41, p42)
	-- upvalues: (copy) v_u_4
	v_u_4:GetPlayerDataFromCache(p41).CurrentCustomDimension02 = p42
end
function v_u_7.setCustomDimension03(_, p43, p44)
	-- upvalues: (copy) v_u_4
	v_u_4:GetPlayerDataFromCache(p43).CurrentCustomDimension03 = p44
end
function v_u_7.startNewSession(_, p45, p46)
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_20, (copy) v_u_6, (copy) v_u_1
	if v_u_7:isEventSubmissionEnabled() and p46 == nil then
		v_u_2:i("Starting a new session.")
	end
	local v47 = v_u_4:GetPlayerDataFromCache(p45.UserId)
	v_u_7:validateAndFixCurrentDimensions(p45.UserId)
	local v48 = v_u_3:initRequest(v_u_5.GameKey, v_u_5.SecretKey, v_u_5.Build, v47, p45.UserId)
	local v49 = v48.statusCode
	local v50 = v48.body
	if (v49 == v_u_3.EGAHTTPApiResponse.Ok or v49 == v_u_3.EGAHTTPApiResponse.Created) and v50 then
		local v51 = v50.server_ts or -1
		v50.time_offset = v51 <= 0 and 0 or v51 - os.time()
		if v49 ~= v_u_3.EGAHTTPApiResponse.Created then
			local v52 = v47.SdkConfig
			if v52.configs then
				v50.configs = v52.configs
			end
			if v52.ab_id then
				v50.ab_id = v52.ab_id
			end
			if v52.ab_variant_id then
				v50.ab_variant_id = v52.ab_variant_id
			end
		end
		v47.SdkConfig = v50
		v47.InitAuthorized = true
	elseif v49 == v_u_3.EGAHTTPApiResponse.Unauthorized then
		v_u_2:w("Initialize SDK failed - Unauthorized")
		v47.InitAuthorized = false
	else
		if v49 == v_u_3.EGAHTTPApiResponse.NoResponse or v49 == v_u_3.EGAHTTPApiResponse.RequestTimeout then
			v_u_2:i("Init call (session start) failed - no response. Could be offline or timeout.")
		elseif v49 == v_u_3.EGAHTTPApiResponse.BadResponse or (v49 == v_u_3.EGAHTTPApiResponse.JsonEncodeFailed or v49 == v_u_3.EGAHTTPApiResponse.JsonDecodeFailed) then
			v_u_2:i("Init call (session start) failed - bad response. Could be bad response from proxy or GA servers.")
		elseif v49 == v_u_3.EGAHTTPApiResponse.BadRequest or v49 == v_u_3.EGAHTTPApiResponse.UnknownResponseCode then
			v_u_2:i("Init call (session start) failed - bad request or unknown response.")
		end
		v47.InitAuthorized = true
	end
	v47.ClientServerTimeOffset = v47.SdkConfig.time_offset or 0
	v47.ConfigsHash = v47.SdkConfig.configs_hash or ""
	v47.AbId = v47.SdkConfig.ab_id or ""
	v47.AbVariantId = v47.SdkConfig.ab_variant_id or ""
	v_u_20(p45)
	if v_u_7:isEnabled(p45.UserId) then
		if p46 then
			v47.SessionID = p46.SessionID
			v47.SessionStart = p46.SessionStart
		else
			v47.SessionID = string.lower(v_u_6:GenerateGUID(false))
			local v53 = v_u_4:GetPlayerDataFromCache(p45.UserId)
			local v54
			if v53 then
				v54 = os.time()
				local v55 = v54 + v53.ClientServerTimeOffset
				if v_u_1:validateClientTs(v55) then
					v54 = v55
				end
			else
				v54 = os.time()
			end
			v47.SessionStart = v54
		end
		if v_u_7:isEventSubmissionEnabled() then
			v_u_5:addSessionStartEvent(p45.UserId, p46)
		end
	else
		v_u_2:w("Could not start session: SDK is disabled.")
	end
end
function v_u_7.endSession(_, p56)
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
	if v_u_7.Initialized and v_u_7:isEventSubmissionEnabled() then
		v_u_2:i("Ending session.")
		if v_u_7:isEnabled(p56) and v_u_7:sessionIsStarted(p56) then
			v_u_5:addSessionEndEvent(p56)
			v_u_4.PlayerCache[p56] = nil
		end
	end
end
function v_u_7.getRemoteConfigsStringValue(_, p57, p58, p59)
	-- upvalues: (copy) v_u_4
	return v_u_4:GetPlayerDataFromCache(p57).Configurations[p58] or p59
end
function v_u_7.isRemoteConfigsReady(_, p60)
	-- upvalues: (copy) v_u_4
	return v_u_4:GetPlayerDataFromCache(p60).RemoteConfigsIsReady
end
function v_u_7.getRemoteConfigsContentAsString(_, p61)
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	return v_u_6:JSONEncode(v_u_4:GetPlayerDataFromCache(p61).Configurations)
end
return v_u_7