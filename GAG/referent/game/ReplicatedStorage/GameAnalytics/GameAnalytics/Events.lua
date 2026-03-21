local v_u_1 = {
	["ProcessEventsInterval"] = 8,
	["GameKey"] = "",
	["SecretKey"] = "",
	["Build"] = "",
	["_availableResourceCurrencies"] = {},
	["_availableResourceItemTypes"] = {}
}
local v_u_2 = require(script.Parent.Store)
local v_u_3 = require(script.Parent.Logger)
local v_u_4 = require(script.Parent.Version)
local v_u_5 = require(script.Parent.Validation)
local v_u_6 = require(script.Parent.Threading)
local v_u_7 = require(script.Parent.HttpApi)
local v_u_8 = require(script.Parent.Utilities)
local v_u_9 = require(script.Parent.GAResourceFlowType)
local v_u_10 = require(script.Parent.GAProgressionStatus)
local v_u_11 = require(script.Parent.GAErrorSeverity)
local v_u_12 = game:GetService("HttpService")
local function v_u_16(p13, p14)
	-- upvalues: (copy) v_u_2
	if p14 and p13 then
		local v15 = v_u_2:GetPlayerDataFromCache(p13)
		if v15 and (v15.CurrentCustomDimension01 and #v15.CurrentCustomDimension01 > 0) then
			p14.custom_01 = v15.CurrentCustomDimension01
		end
		if v15 and (v15.CurrentCustomDimension02 and #v15.CurrentCustomDimension02 > 0) then
			p14.custom_02 = v15.CurrentCustomDimension02
		end
		if v15 and (v15.CurrentCustomDimension03 and #v15.CurrentCustomDimension03 > 0) then
			p14.custom_03 = v15.CurrentCustomDimension03
		end
	end
end
local v_u_17 = v_u_12:GenerateGUID(false):lower()
local function v_u_27(p18)
	-- upvalues: (copy) v_u_2, (copy) v_u_17, (copy) v_u_5, (copy) v_u_4, (copy) v_u_8, (copy) v_u_1
	local v19, v20
	if p18 then
		v19 = v_u_2:GetPlayerDataFromCache(p18)
		v20 = p18
	else
		v19 = {
			["OS"] = "uwp_desktop 0.0.0",
			["Platform"] = "uwp_desktop",
			["SessionID"] = v_u_17,
			["Sessions"] = 1,
			["CustomUserId"] = "Server"
		}
		v20 = "DummyId"
	end
	local v21 = {
		["v"] = 2,
		["user_id"] = tostring(v20) .. v19.CustomUserId
	}
	local v22
	if p18 then
		local v23 = v_u_2:GetPlayerDataFromCache(p18)
		v22 = os.time()
		local v24 = v22 + v23.ClientServerTimeOffset
		if v_u_5:validateClientTs(v24) then
			v22 = v24
		end
	else
		v22 = os.time()
	end
	v21.client_ts = v22
	v21.sdk_version = "roblox " .. v_u_4.SdkVersion
	v21.os_version = v19.OS
	v21.manufacturer = "unknown"
	v21.device = "unknown"
	v21.platform = v19.Platform
	v21.session_id = v19.SessionID
	v21.session_num = v19.Sessions
	if v_u_8:isStringNullOrEmpty(v19.CountryCode) then
		v21.country_code = "unknown"
	else
		v21.country_code = v19.CountryCode
	end
	if v_u_5:validateBuild(v_u_1.Build) then
		v21.build = v_u_1.Build
	end
	if v19.Configurations then
		local v25 = v19.Configurations
		local v26 = 0
		for _, _ in pairs(v25) do
			v26 = v26 + 1
		end
		if v26 > 0 then
			v21.configurations = v19.Configurations
		end
	end
	if not v_u_8:isStringNullOrEmpty(v19.AbId) then
		v21.ab_id = v19.AbId
	end
	if not v_u_8:isStringNullOrEmpty(v19.AbVariantId) then
		v21.ab_variant_id = v19.AbVariantId
	end
	return v21
end
local function v_u_32(p28, p29)
	-- upvalues: (copy) v_u_27, (copy) v_u_12, (copy) v_u_3, (copy) v_u_2
	local v30 = v_u_27(p28)
	for v31 in pairs(p29) do
		v30[v31] = p29[v31]
	end
	v_u_3:ii("Event added to queue: " .. v_u_12:JSONEncode(v30))
	v_u_2.EventsQueue[#v_u_2.EventsQueue + 1] = v30
end
local function v_u_39()
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if #v_u_2.EventsQueue <= 500 then
		local v33 = v_u_2.EventsQueue
		v_u_2.EventsQueue = {}
		return v33
	end
	v_u_3:w(("More than %d events queued! Sending %d."):format(500, 500))
	if #v_u_2.EventsQueue > 2000 then
		v_u_3:w(("DROPPING EVENTS: More than %d events queued!"):format(2000))
	end
	local v34 = table.create(500)
	for v35 = 1, 500 do
		v34[v35] = v_u_2.EventsQueue[v35]
	end
	local v36 = #v_u_2.EventsQueue
	for v37 = 1, math.min(2000, v36) do
		v_u_2.EventsQueue[v37] = v_u_2.EventsQueue[v37 + 500]
	end
	for v38 = 2001, v36 do
		v_u_2.EventsQueue[v38] = nil
	end
	return v34
end
local function v_u_53()
	-- upvalues: (copy) v_u_39, (copy) v_u_3, (copy) v_u_7, (copy) v_u_1, (copy) v_u_2
	local v40 = v_u_39()
	if #v40 == 0 then
		v_u_3:i("Event queue: No events to send")
		return
	end
	local v41 = v_u_3
	local v42 = #v40
	v41:i("Event queue: Sending " .. tostring(v42) .. " events.")
	local v43 = v_u_7:sendEventsInArray(v_u_1.GameKey, v_u_1.SecretKey, v40)
	local v44 = v43.statusCode
	local v45 = v43.body
	if v44 == v_u_7.EGAHTTPApiResponse.Ok and v45 then
		local v46 = v_u_3
		local v47 = #v40
		v46:i("Event queue: " .. tostring(v47) .. " events sent.")
		return
	end
	if v44 == v_u_7.EGAHTTPApiResponse.NoResponse then
		v_u_3:w("Event queue: Failed to send events to collector - Retrying next time")
		for _, v48 in pairs(v40) do
			if #v_u_2.EventsQueue >= 2000 then
				::l11::
				return
			end
			v_u_2.EventsQueue[#v_u_2.EventsQueue + 1] = v48
		end
		return
	else
		if v44 == v_u_7.EGAHTTPApiResponse.BadRequest and v45 then
			local v49 = v_u_3
			local v50 = #v40
			local v51 = tostring(v50)
			local v52 = #v45
			v49:w("Event queue: " .. v51 .. " events sent. " .. tostring(v52) .. " events failed GA server validation.")
			return
		end
		v_u_3:w("Event queue: Failed to send events.")
		goto l11
	end
end
function v_u_1.processEventQueue(_)
	-- upvalues: (copy) v_u_53, (copy) v_u_6, (copy) v_u_1
	v_u_53()
	v_u_6:scheduleTimer(v_u_1.ProcessEventsInterval, function()
		-- upvalues: (ref) v_u_1
		v_u_1:processEventQueue()
	end)
end
function v_u_1.setBuild(p54, p55)
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	if v_u_5:validateBuild(p55) then
		p54.Build = p55
		v_u_3:i("Set build version: " .. p55)
	else
		v_u_3:w("Validation fail - configure build: Cannot be null, empty or above 32 length. String: " .. p55)
	end
end
function v_u_1.setAvailableResourceCurrencies(p56, p57)
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	if v_u_5:validateResourceCurrencies(p57) then
		p56._availableResourceCurrencies = p57
		v_u_3:i("Set available resource currencies: (" .. table.concat(p57, ", ") .. ")")
	end
end
function v_u_1.setAvailableResourceItemTypes(p58, p59)
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	if v_u_5:validateResourceCurrencies(p59) then
		p58._availableResourceItemTypes = p59
		v_u_3:i("Set available resource item types: (" .. table.concat(p59, ", ") .. ")")
	end
end
function v_u_1.addSessionStartEvent(_, p60, p61)
	-- upvalues: (copy) v_u_2, (copy) v_u_16, (copy) v_u_32, (copy) v_u_3, (copy) v_u_53
	local v62 = v_u_2:GetPlayerDataFromCache(p60)
	if p61 then
		v62.Sessions = p61.Sessions
	else
		local v63 = {
			["category"] = "user"
		}
		v62.Sessions = v62.Sessions + 1
		v_u_16(p60, v63)
		v_u_32(p60, v63)
		v_u_3:i("Add SESSION START event")
		v_u_53()
	end
end
function v_u_1.addSessionEndEvent(_, p64)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_3, (copy) v_u_16, (copy) v_u_32, (copy) v_u_53
	local v65 = v_u_2:GetPlayerDataFromCache(p64)
	local v66 = v65.SessionStart
	local v67
	if p64 then
		local v68 = v_u_2:GetPlayerDataFromCache(p64)
		v67 = os.time()
		local v69 = v67 + v68.ClientServerTimeOffset
		if v_u_5:validateClientTs(v69) then
			v67 = v69
		end
	else
		v67 = os.time()
	end
	local v70 = (v67 == nil or v66 == nil) and 0 or v67 - v66
	if v70 < 0 then
		v_u_3:w("Session length was calculated to be less then 0. Should not be possible. Resetting to 0.")
		v70 = 0
	end
	local v71 = {
		["category"] = "session_end",
		["length"] = v70
	}
	v_u_16(p64, v71)
	v_u_32(p64, v71)
	v65.SessionStart = 0
	v_u_3:i("Add SESSION END event.")
	v_u_53()
end
function v_u_1.addBusinessEvent(_, p72, p73, p74, p75, p76, p77)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_8, (copy) v_u_16, (copy) v_u_3, (copy) v_u_32
	if v_u_5:validateBusinessEvent(p73, p74, p77, p75, p76) then
		local v78 = {}
		local v79 = v_u_2:GetPlayerDataFromCache(p72)
		v79.Transactions = v79.Transactions + 1
		v78.event_id = p75 .. ":" .. p76
		v78.category = "business"
		v78.currency = p73
		v78.amount = p74
		v78.transaction_num = v79.Transactions
		if not v_u_8:isStringNullOrEmpty(p77) then
			v78.cart_type = p77
		end
		v_u_16(p72, v78)
		v_u_3:i("Add BUSINESS event: {currency:" .. p73 .. ", amount:" .. tostring(p74) .. ", itemType:" .. p75 .. ", itemId:" .. p76 .. ", cartType:" .. p77 .. "}")
		v_u_32(p72, v78)
	end
end
function v_u_1.addResourceEvent(p80, p81, p82, p83, p84, p85, p86)
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_16, (copy) v_u_3, (copy) v_u_32
	if v_u_5:validateResourceEvent(v_u_9, p82, p83, p84, p85, p86, p80._availableResourceCurrencies, p80._availableResourceItemTypes) then
		if p82 == v_u_9.Sink then
			p84 = -1 * p84
		end
		local v87 = {
			["event_id"] = v_u_9[p82] .. ":" .. p83 .. ":" .. p85 .. ":" .. p86,
			["category"] = "resource",
			["amount"] = p84
		}
		v_u_16(p81, v87)
		v_u_3:i("Add RESOURCE event: {currency:" .. p83 .. ", amount:" .. tostring(p84) .. ", itemType:" .. p85 .. ", itemId:" .. p86 .. "}")
		v_u_32(p81, v87)
	end
end
function v_u_1.addProgressionEvent(_, p88, p89, p90, p91, p92, p93)
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_8, (copy) v_u_2, (copy) v_u_16, (copy) v_u_3, (copy) v_u_32
	if v_u_5:validateProgressionEvent(v_u_10, p89, p90, p91, p92) then
		local v94 = {}
		local v95
		if v_u_8:isStringNullOrEmpty(p91) then
			v95 = p90
		elseif v_u_8:isStringNullOrEmpty(p92) then
			v95 = p90 .. ":" .. p91
		else
			v95 = p90 .. ":" .. p91 .. ":" .. p92
		end
		local v96 = v_u_10[p89]
		v94.category = "progression"
		v94.event_id = v96 .. ":" .. v95
		local v97 = 0
		if p93 ~= nil and p89 ~= v_u_10.Start then
			v94.score = p93
		end
		local v98 = v_u_2:GetPlayerDataFromCache(p88)
		if p89 == v_u_10.Fail then
			local v99 = v98.ProgressionTries[v95] or 0
			v98.ProgressionTries[v95] = v99 + 1
		end
		if p89 == v_u_10.Complete then
			local v100 = v98.ProgressionTries[v95] or 0
			v98.ProgressionTries[v95] = v100 + 1
			v97 = v98.ProgressionTries[v95]
			v94.attempt_num = v97
			v98.ProgressionTries[v95] = 0
		end
		v_u_16(p88, v94)
		v_u_3:i("Add PROGRESSION event: {status:" .. v96 .. ", progression01:" .. p90 .. ", progression02:" .. (v_u_8:isStringNullOrEmpty(p91) and "" or p91) .. ", progression03:" .. (v_u_8:isStringNullOrEmpty(p92) and "" or p92) .. ", score:" .. tostring(p93) .. ", attempt:" .. tostring(v97) .. "}")
		v_u_32(p88, v94)
	end
end
function v_u_1.addDesignEvent(_, p101, p102, p103)
	-- upvalues: (copy) v_u_5, (copy) v_u_16, (copy) v_u_3, (copy) v_u_32
	if v_u_5:validateDesignEvent(p102) then
		local v104 = {
			["category"] = "design",
			["event_id"] = p102
		}
		if p103 ~= nil then
			v104.value = p103
		end
		v_u_16(p101, v104)
		v_u_3:i("Add DESIGN event: {eventId:" .. p102 .. ", value:" .. tostring(p103) .. "}")
		v_u_32(p101, v104)
	end
end
function v_u_1.addErrorEvent(_, p105, p106, p107)
	-- upvalues: (copy) v_u_5, (copy) v_u_11, (copy) v_u_16, (copy) v_u_8, (copy) v_u_3, (copy) v_u_32
	if v_u_5:validateErrorEvent(v_u_11, p106, p107) then
		local v108 = {}
		local v109 = v_u_11[p106]
		v108.category = "error"
		v108.severity = v109
		v108.message = p107
		v_u_16(p105, v108)
		v_u_3:i("Add ERROR event: {severity:" .. v109 .. ", message:" .. (v_u_8:isStringNullOrEmpty(p107) and "" or p107) .. "}")
		v_u_32(p105, v108)
	end
end
function v_u_1.addSdkErrorEvent(_, p110, p111, p112, p113, p114, p115)
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_32
	local v116 = {
		["category"] = "sdk_error",
		["error_category"] = p111,
		["error_area"] = p112,
		["error_action"] = p113
	}
	if not v_u_8:isStringNullOrEmpty(p114) then
		v116.error_parameter = p114
	end
	if not v_u_8:isStringNullOrEmpty(p115) then
		v116.reason = p115
	end
	v_u_3:i("Add SDK ERROR event: {error_category:" .. p111 .. ", error_area:" .. p112 .. ", error_action:" .. p113 .. "}")
	v_u_32(p110, v116)
end
return v_u_1