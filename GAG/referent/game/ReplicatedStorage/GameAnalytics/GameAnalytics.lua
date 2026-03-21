local v_u_1 = {
	["EGAResourceFlowType"] = require(script.GAResourceFlowType),
	["EGAProgressionStatus"] = require(script.GAProgressionStatus),
	["EGAErrorSeverity"] = require(script.GAErrorSeverity)
}
local v_u_2 = require(script.Logger)
local v_u_3 = require(script.Threading)
local v_u_4 = require(script.State)
local v_u_5 = require(script.Validation)
local v_u_6 = require(script.Store)
local v_u_7 = require(script.Events)
local v_u_8 = require(script.Utilities)
local v_u_9 = game:GetService("Players")
local v_u_10 = game:GetService("MarketplaceService")
local v_u_11 = game:GetService("RunService")
local v_u_12 = game:GetService("ReplicatedStorage")
game:GetService("LocalizationService")
local v13 = game:GetService("ScriptContext")
local v_u_14 = require(script.Postie)
local v_u_15 = nil
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {}
local v_u_19 = {}
local v_u_20 = {}
local v_u_21 = {}
local function v_u_24(p22, ...)
	-- upvalues: (ref) v_u_20, (copy) v_u_2
	if v_u_20 == nil then
		v_u_2:w("Initialization queue already cleared.")
	else
		local v23 = v_u_20
		table.insert(v23, {
			["Func"] = p22,
			["Args"] = { ... }
		})
		v_u_2:i("Added event to initialization queue")
	end
end
local function v_u_28(p25, p26, ...)
	-- upvalues: (copy) v_u_1, (copy) v_u_21, (copy) v_u_2
	if v_u_1:isPlayerReady(p25) then
		v_u_2:w("Player initialization queue already cleared.")
	else
		if v_u_21[p25] == nil then
			v_u_21[p25] = {}
		end
		local v27 = v_u_21[p25]
		table.insert(v27, {
			["Func"] = p26,
			["Args"] = { ... }
		})
		v_u_2:i("Added event to player initialization queue")
	end
end
local function v_u_34(p29)
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	local v30 = p29.playerId or nil
	local v31 = p29.needsInitialized or true
	local v32 = p29.shouldWarn or false
	local v33 = p29.message or ""
	if v31 and not v_u_4.Initialized then
		if v32 then
			v_u_2:w(v33 .. " SDK is not initialized")
		end
		return false
	end
	if v31 and (v30 and not v_u_4:isEnabled(v30)) then
		if v32 then
			v_u_2:w(v33 .. " SDK is disabled")
		end
		return false
	end
	if not v31 or (not v30 or v_u_4:sessionIsStarted(v30)) then
		return true
	end
	if v32 then
		v_u_2:w(v33 .. " Session has not started yet")
	end
	return false
end
function v_u_1.configureAvailableCustomDimensions01(_, p35)
	-- upvalues: (copy) v_u_34, (copy) v_u_2, (copy) v_u_4
	if v_u_34({
		["needsInitialized"] = true,
		["shouldWarn"] = false
	}) then
		v_u_2:w("Available custom dimensions must be set before SDK is initialized")
	else
		v_u_4:setAvailableCustomDimensions01(p35)
	end
end
function v_u_1.configureAvailableCustomDimensions02(_, p36)
	-- upvalues: (copy) v_u_34, (copy) v_u_2, (copy) v_u_4
	if v_u_34({
		["needsInitialized"] = true,
		["shouldWarn"] = false
	}) then
		v_u_2:w("Available custom dimensions must be set before SDK is initialized")
	else
		v_u_4:setAvailableCustomDimensions02(p36)
	end
end
function v_u_1.configureAvailableCustomDimensions03(_, p37)
	-- upvalues: (copy) v_u_34, (copy) v_u_2, (copy) v_u_4
	if v_u_34({
		["needsInitialized"] = true,
		["shouldWarn"] = false
	}) then
		v_u_2:w("Available custom dimensions must be set before SDK is initialized")
	else
		v_u_4:setAvailableCustomDimensions03(p37)
	end
end
function v_u_1.configureAvailableResourceCurrencies(_, p38)
	-- upvalues: (copy) v_u_34, (copy) v_u_2, (copy) v_u_7
	if v_u_34({
		["needsInitialized"] = true,
		["shouldWarn"] = false
	}) then
		v_u_2:w("Available resource currencies must be set before SDK is initialized")
	else
		v_u_7:setAvailableResourceCurrencies(p38)
	end
end
function v_u_1.configureAvailableResourceItemTypes(_, p39)
	-- upvalues: (copy) v_u_34, (copy) v_u_2, (copy) v_u_7
	if v_u_34({
		["needsInitialized"] = true,
		["shouldWarn"] = false
	}) then
		v_u_2:w("Available resource item types must be set before SDK is initialized")
	else
		v_u_7:setAvailableResourceItemTypes(p39)
	end
end
function v_u_1.configureBuild(_, p40)
	-- upvalues: (copy) v_u_34, (copy) v_u_2, (copy) v_u_7
	if v_u_34({
		["needsInitialized"] = true,
		["shouldWarn"] = false
	}) then
		v_u_2:w("Build version must be set before SDK is initialized.")
	else
		v_u_7:setBuild(p40)
	end
end
function v_u_1.configureAvailableGamepasses(_, p41)
	-- upvalues: (copy) v_u_34, (copy) v_u_2, (copy) v_u_4
	if v_u_34({
		["needsInitialized"] = true,
		["shouldWarn"] = false
	}) then
		v_u_2:w("Available gamepasses must be set before SDK is initialized.")
	else
		v_u_4:setAvailableGamepasses(p41)
	end
end
function v_u_1.startNewSession(_, p_u_42, p_u_43)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_2, (copy) p_u_42, (copy) p_u_43
		if v_u_4:isEventSubmissionEnabled() then
			if v_u_4.Initialized then
				v_u_4:startNewSession(p_u_42, p_u_43)
			else
				v_u_2:w("Cannot start new session. SDK is not initialized yet.")
			end
		else
			return
		end
	end)
end
function v_u_1.endSession(_, p_u_44)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (copy) p_u_44
		if v_u_4:isEventSubmissionEnabled() then
			v_u_4:endSession(p_u_44)
		end
	end)
end
function v_u_1.filterForBusinessEvent(_, p45)
	return string.gsub(p45, "[^A-Za-z0-9%s%-_%.%(%)!%?]", "")
end
function v_u_1.addBusinessEvent(_, p_u_46, p_u_47)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_34, (copy) v_u_28, (copy) v_u_1, (copy) v_u_24, (copy) v_u_7, (copy) v_u_9, (copy) v_u_6
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_34, (copy) p_u_46, (ref) v_u_28, (ref) v_u_1, (copy) p_u_47, (ref) v_u_24, (ref) v_u_7, (ref) v_u_9, (ref) v_u_6
		if v_u_4:isEventSubmissionEnabled() then
			if v_u_34({
				["playerId"] = p_u_46,
				["needsInitialized"] = true,
				["shouldWarn"] = false,
				["message"] = "Could not add business event"
			}) then
				local v48 = p_u_47.amount or 0
				local v49 = p_u_47.itemType or ""
				local v50 = p_u_47.itemId or ""
				local v51 = p_u_47.cartType or ""
				local v52 = v48 * 0.7 * 0.35
				local v53 = math.floor(v52)
				local v54 = p_u_47.gamepassId or nil
				v_u_7:addBusinessEvent(p_u_46, "USD", v53, v49, v50, v51)
				if v49 == "Gamepass" and v51 ~= "Website" then
					local v55 = v_u_9:GetPlayerByUserId(p_u_46)
					local v56 = v_u_6:GetPlayerDataFromCache(p_u_46)
					if not v56.OwnedGamepasses then
						v56.OwnedGamepasses = {}
					end
					local v57 = v56.OwnedGamepasses
					table.insert(v57, v54)
					v_u_6.PlayerCache[p_u_46] = v56
					v_u_6:SavePlayerData(v55)
				end
				return
			elseif p_u_46 then
				v_u_28(p_u_46, v_u_1.addBusinessEvent, v_u_1, p_u_46, p_u_47)
			else
				v_u_24(v_u_1.addBusinessEvent, v_u_1, p_u_46, p_u_47)
			end
		else
			return
		end
	end)
end
function v_u_1.addResourceEvent(_, p_u_58, p_u_59)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_34, (copy) v_u_28, (copy) v_u_1, (copy) v_u_24, (copy) v_u_7
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_34, (copy) p_u_58, (ref) v_u_28, (ref) v_u_1, (copy) p_u_59, (ref) v_u_24, (ref) v_u_7
		if v_u_4:isEventSubmissionEnabled() then
			if v_u_34({
				["playerId"] = p_u_58,
				["needsInitialized"] = true,
				["shouldWarn"] = false,
				["message"] = "Could not add resource event"
			}) then
				v_u_7:addResourceEvent(p_u_58, p_u_59.flowType or 0, p_u_59.currency or "", p_u_59.amount or 0, p_u_59.itemType or "", p_u_59.itemId or "")
				return
			elseif p_u_58 then
				v_u_28(p_u_58, v_u_1.addResourceEvent, v_u_1, p_u_58, p_u_59)
			else
				v_u_24(v_u_1.addResourceEvent, v_u_1, p_u_58, p_u_59)
			end
		else
			return
		end
	end)
end
function v_u_1.addProgressionEvent(_, p_u_60, p_u_61)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_34, (copy) v_u_28, (copy) v_u_1, (copy) v_u_24, (copy) v_u_7
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_34, (copy) p_u_60, (ref) v_u_28, (ref) v_u_1, (copy) p_u_61, (ref) v_u_24, (ref) v_u_7
		if v_u_4:isEventSubmissionEnabled() then
			if v_u_34({
				["playerId"] = p_u_60,
				["needsInitialized"] = true,
				["shouldWarn"] = false,
				["message"] = "Could not add progression event"
			}) then
				v_u_7:addProgressionEvent(p_u_60, p_u_61.progressionStatus or 0, p_u_61.progression01 or "", p_u_61.progression02 or nil, p_u_61.progression03 or nil, p_u_61.score or nil)
				return
			elseif p_u_60 then
				v_u_28(p_u_60, v_u_1.addProgressionEvent, v_u_1, p_u_60, p_u_61)
			else
				v_u_24(v_u_1.addProgressionEvent, v_u_1, p_u_60, p_u_61)
			end
		else
			return
		end
	end)
end
function v_u_1.addDesignEvent(_, p_u_62, p_u_63)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_34, (copy) v_u_28, (copy) v_u_1, (copy) v_u_24, (copy) v_u_7
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_34, (copy) p_u_62, (ref) v_u_28, (ref) v_u_1, (copy) p_u_63, (ref) v_u_24, (ref) v_u_7
		if v_u_4:isEventSubmissionEnabled() then
			if v_u_34({
				["playerId"] = p_u_62,
				["needsInitialized"] = true,
				["shouldWarn"] = false,
				["message"] = "Could not add design event"
			}) then
				v_u_7:addDesignEvent(p_u_62, p_u_63.eventId or "", p_u_63.value or nil)
				return
			elseif p_u_62 then
				v_u_28(p_u_62, v_u_1.addDesignEvent, v_u_1, p_u_62, p_u_63)
			else
				v_u_24(v_u_1.addDesignEvent, v_u_1, p_u_62, p_u_63)
			end
		else
			return
		end
	end)
end
function v_u_1.addErrorEvent(_, p_u_64, p_u_65)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_34, (copy) v_u_28, (copy) v_u_1, (copy) v_u_24, (copy) v_u_7
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_34, (copy) p_u_64, (ref) v_u_28, (ref) v_u_1, (copy) p_u_65, (ref) v_u_24, (ref) v_u_7
		if v_u_4:isEventSubmissionEnabled() then
			if v_u_34({
				["playerId"] = p_u_64,
				["needsInitialized"] = true,
				["shouldWarn"] = false,
				["message"] = "Could not add error event"
			}) then
				v_u_7:addErrorEvent(p_u_64, p_u_65.severity or 0, p_u_65.message or "")
				return
			elseif p_u_64 then
				v_u_28(p_u_64, v_u_1.addErrorEvent, v_u_1, p_u_64, p_u_65)
			else
				v_u_24(v_u_1.addErrorEvent, v_u_1, p_u_64, p_u_65)
			end
		else
			return
		end
	end)
end
function v_u_1.setEnabledDebugLog(_, p66)
	-- upvalues: (copy) v_u_11, (copy) v_u_2
	if v_u_11:IsStudio() then
		if p66 then
			v_u_2:setDebugLog(p66)
			v_u_2:i("Debug logging enabled")
		else
			v_u_2:i("Debug logging disabled")
			v_u_2:setDebugLog(p66)
		end
	else
		v_u_2:i("setEnabledDebugLog can only be used in studio")
		return
	end
end
function v_u_1.setEnabledInfoLog(_, p67)
	-- upvalues: (copy) v_u_2
	if p67 then
		v_u_2:setInfoLog(p67)
		v_u_2:i("Info logging enabled")
	else
		v_u_2:i("Info logging disabled")
		v_u_2:setInfoLog(p67)
	end
end
function v_u_1.setEnabledVerboseLog(_, p68)
	-- upvalues: (copy) v_u_2
	if p68 then
		v_u_2:setVerboseLog(p68)
		v_u_2:ii("Verbose logging enabled")
	else
		v_u_2:ii("Verbose logging disabled")
		v_u_2:setVerboseLog(p68)
	end
end
function v_u_1.setEnabledEventSubmission(_, p_u_69)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (copy) p_u_69, (ref) v_u_4, (ref) v_u_2
		if p_u_69 then
			v_u_4:setEventSubmission(p_u_69)
			v_u_2:i("Event submission enabled")
		else
			v_u_2:i("Event submission disabled")
			v_u_4:setEventSubmission(p_u_69)
		end
	end)
end
function v_u_1.setCustomDimension01(_, p_u_70, p_u_71)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_34
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_4, (copy) p_u_71, (ref) v_u_2, (ref) v_u_34, (copy) p_u_70
		if v_u_5:validateDimension(v_u_4._availableCustomDimensions01, p_u_71) then
			if v_u_34({
				["playerId"] = p_u_70,
				["needsInitialized"] = true,
				["shouldWarn"] = true,
				["message"] = "Could not set custom01 dimension"
			}) then
				v_u_4:setCustomDimension01(p_u_70, p_u_71)
			end
		else
			v_u_2:w("Could not set custom01 dimension value to \'" .. p_u_71 .. "\'. Value not found in available custom01 dimension values")
			return
		end
	end)
end
function v_u_1.setCustomDimension02(_, p_u_72, p_u_73)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_34
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_4, (copy) p_u_73, (ref) v_u_2, (ref) v_u_34, (copy) p_u_72
		if v_u_5:validateDimension(v_u_4._availableCustomDimensions02, p_u_73) then
			if v_u_34({
				["playerId"] = p_u_72,
				["needsInitialized"] = true,
				["shouldWarn"] = true,
				["message"] = "Could not set custom02 dimension"
			}) then
				v_u_4:setCustomDimension02(p_u_72, p_u_73)
			end
		else
			v_u_2:w("Could not set custom02 dimension value to \'" .. p_u_73 .. "\'. Value not found in available custom02 dimension values")
			return
		end
	end)
end
function v_u_1.setCustomDimension03(_, p_u_74, p_u_75)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_34
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_4, (copy) p_u_75, (ref) v_u_2, (ref) v_u_34, (copy) p_u_74
		if v_u_5:validateDimension(v_u_4._availableCustomDimensions03, p_u_75) then
			if v_u_34({
				["playerId"] = p_u_74,
				["needsInitialized"] = true,
				["shouldWarn"] = true,
				["message"] = "Could not set custom03 dimension"
			}) then
				v_u_4:setCustomDimension03(p_u_74, p_u_75)
			end
		else
			v_u_2:w("Could not set custom03 dimension value to \'" .. p_u_75 .. "\'. Value not found in available custom03 dimension values")
			return
		end
	end)
end
function v_u_1.setEnabledReportErrors(_, p_u_76)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (copy) p_u_76
		v_u_4.ReportErrors = p_u_76
	end)
end
function v_u_1.setEnabledCustomUserId(_, p_u_77)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (copy) p_u_77
		v_u_4.UseCustomUserId = p_u_77
	end)
end
function v_u_1.setEnabledAutomaticSendBusinessEvents(_, p_u_78)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_4, (copy) p_u_78
		v_u_4.AutomaticSendBusinessEvents = p_u_78
	end)
end
function v_u_1.addGameAnalyticsTeleportData(_, p79, p80)
	-- upvalues: (copy) v_u_6
	local v81 = {}
	for _, v82 in ipairs(p79) do
		local v83 = v_u_6:GetPlayerDataFromCache(v82)
		v83.PlayerTeleporting = true
		local v84 = {
			["SessionID"] = v83.SessionID,
			["Sessions"] = v83.Sessions,
			["SessionStart"] = v83.SessionStart
		}
		v81[tostring(v82)] = v84
	end
	p80.gameanalyticsData = v81
	return p80
end
function v_u_1.getRemoteConfigsValueAsString(_, p85, p86)
	-- upvalues: (copy) v_u_4
	return v_u_4:getRemoteConfigsStringValue(p85, p86.key or "", p86.defaultValue or nil)
end
function v_u_1.isRemoteConfigsReady(_, p87)
	-- upvalues: (copy) v_u_4
	return v_u_4:isRemoteConfigsReady(p87)
end
function v_u_1.getRemoteConfigsContentAsString(_, p88)
	-- upvalues: (copy) v_u_4
	return v_u_4:getRemoteConfigsContentAsString(p88)
end
function v_u_1.PlayerJoined(_, p89)
	-- upvalues: (copy) v_u_6, (copy) v_u_14, (copy) v_u_8, (copy) v_u_7, (copy) v_u_4, (copy) v_u_2, (copy) v_u_1, (ref) v_u_15, (copy) v_u_12, (copy) v_u_10, (copy) v_u_16, (copy) v_u_21
	local v90 = p89:GetJoinData().TeleportData
	local v91 = v_u_6:GetPlayerData(p89)
	local v92
	if v90 then
		v92 = v90.gameanalyticsData
		if v92 then
			local v93 = v90.gameanalyticsData
			local v94 = p89.UserId
			v92 = v93[tostring(v94)]
		end
	else
		v92 = nil
	end
	local v95 = v_u_6:GetPlayerDataFromCache(p89.UserId)
	if v95 then
		if v92 then
			v95.SessionID = v92.SessionID
			v95.SessionStart = v92.SessionStart
		end
		v95.PlayerTeleporting = false
	else
		local v96, v97 = v_u_14.invokeClient("getPlatform", p89, 5)
		local v98 = not v96 and "unknown" or v97
		for v99, v100 in pairs(v_u_6.BasePlayerData) do
			if not v91[v99] then
				if typeof(v100) == "table" then
					v91[v99] = v_u_8:copyTable(v100)
				else
					v91[v99] = v100
				end
			end
		end
		local v101, v102 = pcall(function()
			return "US"
		end)
		if v101 then
			v91.CountryCode = v102
		end
		v_u_6.PlayerCache[p89.UserId] = v91
		local v103
		if v98 == "Console" then
			v103 = "uwp_console"
		elseif v98 == "Mobile" then
			v103 = "uwp_mobile"
		else
			local _ = v98 == "Desktop"
			v103 = "uwp_desktop"
		end
		v91.Platform = v103
		v91.OS = v91.Platform .. " 0.0.0"
		if not v101 then
			v_u_7:addSdkErrorEvent(p89.UserId, "event_validation", "player_joined", "string_empty_or_null", "country_code", "")
		end
		local v104 = ""
		local v105
		if v_u_4.UseCustomUserId then
			local v106
			v106, v105 = v_u_14.invokeClient("getCustomUserId", p89, 5)
			if not v106 then
				v105 = v104
			end
		else
			v105 = v104
		end
		if not v_u_8:isStringNullOrEmpty(v105) then
			v_u_2:i("Using custom id: " .. v105)
			v91.CustomUserId = v105
		end
		v_u_1:startNewSession(p89, v92)
		v_u_15 = v_u_15 or v_u_12:WaitForChild("OnPlayerReadyEvent")
		v_u_15:Fire(p89)
		if v_u_4.AutomaticSendBusinessEvents then
			if v91.OwnedGamepasses == nil then
				v91.OwnedGamepasses = {}
				for _, v107 in ipairs(v_u_4._availableGamepasses) do
					if v_u_10:UserOwnsGamePassAsync(p89.UserId, v107) then
						local v108 = v91.OwnedGamepasses
						table.insert(v108, v107)
					end
				end
				v_u_6.PlayerCache[p89.UserId] = v91
				v_u_6:SavePlayerData(p89)
			else
				local v109 = {}
				for _, v110 in ipairs(v_u_4._availableGamepasses) do
					if v_u_10:UserOwnsGamePassAsync(p89.UserId, v110) then
						table.insert(v109, v110)
					end
				end
				local v111 = {}
				for _, v112 in ipairs(v91.OwnedGamepasses) do
					v111[v112] = true
				end
				for _, v113 in ipairs(v109) do
					if not v111[v113] then
						local v114 = v91.OwnedGamepasses
						table.insert(v114, v113)
						local v115 = v_u_16[v113]
						if not v115 then
							v115 = v_u_10:GetProductInfo(v113, Enum.InfoType.GamePass)
							v_u_16[v113] = v115
						end
						v_u_1:addBusinessEvent(p89.UserId, {
							["amount"] = v115.PriceInRobux,
							["itemType"] = "Gamepass",
							["itemId"] = v_u_1:filterForBusinessEvent(v115.Name),
							["cartType"] = "Website"
						})
					end
				end
				v_u_6.PlayerCache[p89.UserId] = v91
				v_u_6:SavePlayerData(p89)
			end
		end
		local v116 = v_u_21[p89.UserId]
		if v116 then
			v_u_21[p89.UserId] = nil
			for _, v117 in ipairs(v116) do
				local v118 = v117.Func
				local v119 = v117.Args
				v118(unpack(v119))
			end
			v_u_2:i("Player initialization queue called #" .. #v116 .. " events")
		end
	end
end
function v_u_1.PlayerRemoved(_, p120)
	-- upvalues: (copy) v_u_6, (copy) v_u_1
	v_u_6:SavePlayerData(p120)
	local v121 = v_u_6:GetPlayerDataFromCache(p120.UserId)
	if v121 then
		if not v121.PlayerTeleporting then
			v_u_1:endSession(p120.UserId)
			return
		end
		v_u_6.PlayerCache[p120.UserId] = nil
		v_u_6.DataStoreQueue.RemoveKey(p120.UserId)
	end
end
function v_u_1.isPlayerReady(_, p122)
	-- upvalues: (copy) v_u_6
	return v_u_6:GetPlayerDataFromCache(p122) and true or false
end
function v_u_1.ProcessReceiptCallback(_, p_u_123)
	-- upvalues: (copy) v_u_16, (copy) v_u_10, (copy) v_u_1
	local v_u_124 = v_u_16[p_u_123.ProductId]
	if not v_u_124 then
		pcall(function()
			-- upvalues: (ref) v_u_124, (ref) v_u_10, (copy) p_u_123, (ref) v_u_16
			v_u_124 = v_u_10:GetProductInfo(p_u_123.ProductId, Enum.InfoType.Product)
			v_u_16[p_u_123.ProductId] = v_u_124
		end)
	end
	if v_u_124 then
		v_u_1:addBusinessEvent(p_u_123.PlayerId, {
			["amount"] = p_u_123.CurrencySpent,
			["itemType"] = "DeveloperProduct",
			["itemId"] = v_u_1:filterForBusinessEvent(v_u_124.Name)
		})
	end
end
function v_u_1.GamepassPurchased(_, p125, p126, p127)
	-- upvalues: (copy) v_u_16, (copy) v_u_10, (copy) v_u_1
	local v128 = v_u_16[p126]
	if not v128 then
		v128 = v_u_10:GetProductInfo(p126, Enum.InfoType.GamePass)
		v_u_16[p126] = v128
	end
	local v129 = 0
	local v130 = "GamePass"
	if p127 then
		v129 = p127.PriceInRobux
		v130 = p127.Name
	elseif v128 then
		v129 = v128.PriceInRobux
		v130 = v128.Name
	end
	v_u_1:addBusinessEvent(p125.UserId, {
		["amount"] = v129 or 0,
		["itemType"] = "Gamepass",
		["itemId"] = v_u_1:filterForBusinessEvent(v130),
		["gamepassId"] = p126
	})
end
local v_u_131 = { "gameKey", "secretKey" }
function v_u_1.initServer(_, p132, p133)
	-- upvalues: (copy) v_u_1
	v_u_1:initialize({
		["gameKey"] = p132,
		["secretKey"] = p133
	})
end
function v_u_1.initialize(_, p_u_134)
	-- upvalues: (copy) v_u_3, (copy) v_u_131, (copy) v_u_2, (copy) v_u_1, (copy) v_u_34, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4, (copy) v_u_9, (ref) v_u_20
	v_u_3:performTaskOnGAThread(function()
		-- upvalues: (ref) v_u_131, (copy) p_u_134, (ref) v_u_2, (ref) v_u_1, (ref) v_u_34, (ref) v_u_5, (ref) v_u_7, (ref) v_u_4, (ref) v_u_9, (ref) v_u_20
		for _, v135 in ipairs(v_u_131) do
			if p_u_134[v135] == nil then
				v_u_2:e("Initialize \'" .. v135 .. "\' option missing")
				return
			end
		end
		if p_u_134.enableInfoLog ~= nil and p_u_134.enableInfoLog then
			v_u_1:setEnabledInfoLog(p_u_134.enableInfoLog)
		end
		if p_u_134.enableVerboseLog ~= nil and p_u_134.enableVerboseLog then
			v_u_1:setEnabledVerboseLog(p_u_134.enableVerboseLog)
		end
		if p_u_134.availableCustomDimensions01 ~= nil and #p_u_134.availableCustomDimensions01 > 0 then
			v_u_1:configureAvailableCustomDimensions01(p_u_134.availableCustomDimensions01)
		end
		if p_u_134.availableCustomDimensions02 ~= nil and #p_u_134.availableCustomDimensions02 > 0 then
			v_u_1:configureAvailableCustomDimensions02(p_u_134.availableCustomDimensions02)
		end
		if p_u_134.availableCustomDimensions03 ~= nil and #p_u_134.availableCustomDimensions03 > 0 then
			v_u_1:configureAvailableCustomDimensions03(p_u_134.availableCustomDimensions03)
		end
		if p_u_134.availableResourceCurrencies ~= nil and #p_u_134.availableResourceCurrencies > 0 then
			v_u_1:configureAvailableResourceCurrencies(p_u_134.availableResourceCurrencies)
		end
		if p_u_134.availableResourceItemTypes ~= nil and #p_u_134.availableResourceItemTypes > 0 then
			v_u_1:configureAvailableResourceItemTypes(p_u_134.availableResourceItemTypes)
		end
		if p_u_134.build ~= nil and #p_u_134.build > 0 then
			v_u_1:configureBuild(p_u_134.build)
		end
		if p_u_134.availableGamepasses ~= nil and #p_u_134.availableGamepasses > 0 then
			v_u_1:configureAvailableGamepasses(p_u_134.availableGamepasses)
		end
		if p_u_134.enableDebugLog ~= nil then
			v_u_1:setEnabledDebugLog(p_u_134.enableDebugLog)
		end
		if p_u_134.automaticSendBusinessEvents ~= nil then
			v_u_1:setEnabledAutomaticSendBusinessEvents(p_u_134.automaticSendBusinessEvents)
		end
		if p_u_134.reportErrors ~= nil then
			v_u_1:setEnabledReportErrors(p_u_134.reportErrors)
		end
		if p_u_134.useCustomUserId ~= nil then
			v_u_1:setEnabledCustomUserId(p_u_134.useCustomUserId)
		end
		if v_u_34({
			["needsInitialized"] = true,
			["shouldWarn"] = false
		}) then
			v_u_2:w("SDK already initialized. Can only be called once.")
			return
		else
			local v136 = p_u_134.gameKey
			local v137 = p_u_134.secretKey
			if v_u_5:validateKeys(v136, v137) then
				v_u_7.GameKey = v136
				v_u_7.SecretKey = v137
				v_u_4.Initialized = true
				v_u_9.PlayerAdded:Connect(function(p138)
					-- upvalues: (ref) v_u_1
					v_u_1:PlayerJoined(p138)
				end)
				v_u_9.PlayerRemoving:Connect(function(p139)
					-- upvalues: (ref) v_u_1
					v_u_1:PlayerRemoved(p139)
				end)
				for _, v140 in ipairs(v_u_9:GetPlayers()) do
					coroutine.wrap(v_u_1.PlayerJoined)(v_u_1, v140)
				end
				for _, v141 in ipairs(v_u_20) do
					local v142 = task.spawn
					local v143 = v141.Func
					local v144 = v141.Args
					v142(v143, unpack(v144))
				end
				v_u_2:i("Server initialization queue called #" .. #v_u_20 .. " events")
				v_u_20 = nil
				v_u_7:processEventQueue()
			else
				v_u_2:w("SDK failed initialize. Game key or secret key is invalid. Can only contain characters A-z 0-9, gameKey is 32 length, secretKey is 40 length. Failed keys - gameKey: " .. v136 .. ", secretKey: " .. v137)
			end
		end
	end)
end
if not v_u_12:FindFirstChild("GameAnalyticsRemoteConfigs") then
	local v145 = Instance.new("RemoteEvent")
	v145.Name = "GameAnalyticsRemoteConfigs"
	v145.Parent = v_u_12
end
if not v_u_12:FindFirstChild("OnPlayerReadyEvent") then
	local v146 = Instance.new("BindableEvent")
	v146.Name = "OnPlayerReadyEvent"
	v146.Parent = v_u_12
end
task.spawn(function()
	-- upvalues: (ref) v_u_17, (copy) v_u_6, (ref) v_u_18, (ref) v_u_19
	local v147 = os.time() / 3600
	v_u_17 = v_u_6:GetErrorDataStore((math.floor(v147)))
	while task.wait(3600) do
		local v148 = os.time() / 3600
		v_u_17 = v_u_6:GetErrorDataStore((math.floor(v148)))
		v_u_18 = {}
		v_u_19 = {}
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_6, (ref) v_u_19, (ref) v_u_18, (ref) v_u_17
	while task.wait(v_u_6.AutoSaveData) do
		for _, v149 in pairs(v_u_19) do
			local v150 = v_u_18[v149]
			local v151 = v150.currentCount - v150.countInDS
			v_u_18[v149].countInDS = v_u_6:IncrementErrorCount(v_u_17, v149, v151)
			v_u_18[v149].currentCount = v_u_18[v149].countInDS
		end
	end
end)
local function v_u_159(p152, p153, p154, p155)
	-- upvalues: (ref) v_u_18, (ref) v_u_19, (copy) v_u_1
	local v156 = (p154 == nil and "(null)" or p154) .. ": message=" .. (p152 == nil and "(null)" or p152) .. ", trace=" .. (p153 == nil and "(null)" or p153)
	if #v156 > 8192 then
		v156 = string.sub(v156, 1, 8192)
	end
	local v157
	if p155 then
		v157 = p155.UserId
		v156 = v156:gsub(p155.Name, "[LocalPlayer]")
	else
		v157 = nil
	end
	local v158
	if #v156 > 50 then
		v158 = string.sub(v156, 1, 50)
	else
		v158 = v156
	end
	if v_u_18[v158] == nil then
		v_u_19[#v_u_19 + 1] = v158
		v_u_18[v158] = {}
		v_u_18[v158].countInDS = 0
		v_u_18[v158].currentCount = 0
	end
	if v_u_18[v158].currentCount <= 10 then
		v_u_1:addErrorEvent(v157, {
			["severity"] = v_u_1.EGAErrorSeverity.error,
			["message"] = v156
		})
		v_u_18[v158].currentCount = v_u_18[v158].currentCount + 1
	end
end
v13.Error:Connect(function(p160, p161, p_u_162)
	-- upvalues: (copy) v_u_4, (copy) v_u_159
	if v_u_4.ReportErrors then
		if p_u_162 then
			local v_u_163 = nil
			local v164, _ = pcall(function()
				-- upvalues: (ref) v_u_163, (copy) p_u_162
				v_u_163 = p_u_162:GetFullName()
			end)
			if v164 then
				return v_u_159(p160, p161, v_u_163)
			end
		end
	else
		return
	end
end)
if not v_u_12:FindFirstChild("GameAnalyticsError") then
	local v165 = Instance.new("RemoteEvent")
	v165.Name = "GameAnalyticsError"
	v165.Parent = v_u_12
end
v_u_12.GameAnalyticsError.OnServerEvent:Connect(function(p166, p167, p168, p169)
	-- upvalues: (copy) v_u_4, (copy) v_u_159
	if v_u_4.ReportErrors then
		v_u_159(p167, p168, p169, p166)
	end
end)
v_u_10.PromptGamePassPurchaseFinished:Connect(function(p170, p171, p172)
	-- upvalues: (copy) v_u_4, (copy) v_u_1
	if v_u_4.AutomaticSendBusinessEvents and p172 then
		v_u_1:GamepassPurchased(p170, p171)
	end
end)
return v_u_1