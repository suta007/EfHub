local v_u_1 = game:GetService("RunService")
local v_u_2 = require(script.Parent.Validation)
local v_u_3 = require(script.Parent.Version)
local v_u_4 = require(script.HashLib)
local v_u_5 = {
	["protocol"] = "https",
	["hostName"] = "api.gameanalytics.com",
	["version"] = "v2",
	["remoteConfigsVersion"] = "v1",
	["initializeUrlPath"] = "init",
	["eventsUrlPath"] = "events",
	["EGAHTTPApiResponse"] = {
		["NoResponse"] = 0,
		["BadResponse"] = 1,
		["RequestTimeout"] = 2,
		["JsonEncodeFailed"] = 3,
		["JsonDecodeFailed"] = 4,
		["InternalServerError"] = 5,
		["BadRequest"] = 6,
		["Unauthorized"] = 7,
		["UnknownResponseCode"] = 8,
		["Ok"] = 9,
		["Created"] = 10
	}
}
local v_u_6 = game:GetService("HttpService")
local v_u_7 = require(script.Parent.Logger)
local v_u_8 = (v_u_1:IsStudio() and "https" or v_u_5.protocol) .. "://" .. (v_u_1:IsStudio() and "sandbox-" or "") .. v_u_5.hostName .. "/" .. v_u_5.version
local v_u_9 = (v_u_1:IsStudio() and "https" or v_u_5.protocol) .. "://" .. (v_u_1:IsStudio() and "sandbox-" or "") .. v_u_5.hostName .. "/remote_configs/" .. v_u_5.remoteConfigsVersion
local function v_u_14(p10, p11)
	-- upvalues: (copy) v_u_7, (copy) v_u_5
	local v12 = p10.StatusCode
	local v13 = p10.Body
	if not v13 or #v13 == 0 then
		v_u_7:d(p11 .. " request. failed. Might be no connection. Status code: " .. tostring(v12))
		return v_u_5.EGAHTTPApiResponse.NoResponse
	end
	if v12 == 200 then
		return v_u_5.EGAHTTPApiResponse.Ok
	end
	if v12 == 201 then
		return v_u_5.EGAHTTPApiResponse.Created
	end
	if v12 == 0 or v12 == 401 then
		v_u_7:d(p11 .. " request. 401 - Unauthorized.")
		return v_u_5.EGAHTTPApiResponse.Unauthorized
	end
	if v12 == 400 then
		v_u_7:d(p11 .. " request. 400 - Bad Request.")
		return v_u_5.EGAHTTPApiResponse.BadRequest
	end
	if v12 ~= 500 then
		return v_u_5.EGAHTTPApiResponse.UnknownResponseCode
	end
	v_u_7:d(p11 .. " request. 500 - Internal Server Error.")
	return v_u_5.EGAHTTPApiResponse.InternalServerError
end
function v_u_5.initRequest(p15, p16, p17, p18, p19, p20)
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_1, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_14, (copy) v_u_2
	local v_u_21 = v_u_9 .. "/" .. v_u_5.initializeUrlPath .. "?game_key=" .. p16 .. "&interval_seconds=0&configs_hash=" .. (p19.ConfigsHash or "")
	if v_u_1:IsStudio() then
		v_u_21 = v_u_8 .. "/5c6bcb5402204249437fb5a7a80a4959/" .. p15.initializeUrlPath
	end
	v_u_7:d("Sending \'init\' URL: " .. v_u_21)
	local v_u_22 = v_u_6:JSONEncode({
		["user_id"] = tostring(p20) .. p19.CustomUserId,
		["sdk_version"] = "roblox " .. v_u_3.SdkVersion,
		["os_version"] = p19.OS,
		["platform"] = p19.Platform,
		["build"] = p18,
		["session_num"] = p19.Sessions,
		["random_salt"] = p19.Sessions
	}):gsub("\"country_code\":\"unknown\"", "\"country_code\":null")
	local v23 = v_u_22
	local v_u_24
	if p17 then
		local v25 = v_u_4.hmac(v_u_4.sha256, v_u_1:IsStudio() and "16813a12f718bc5c620f56944e1abc3ea13ccbac" or p17, v23, true)
		v_u_24 = v_u_4.base64_encode(v25)
	else
		v_u_7:w("Error encoding, invalid SecretKey")
		v_u_24 = nil
	end
	v_u_7:d("init payload: " .. v_u_22)
	local v_u_26 = nil
	local v28, v29 = pcall(function()
		-- upvalues: (ref) v_u_26, (ref) v_u_6, (ref) v_u_21, (copy) v_u_24, (ref) v_u_22
		local v27 = {
			["Url"] = v_u_21,
			["Method"] = "POST",
			["Headers"] = {
				["Authorization"] = v_u_24,
				["Content-Type"] = "application/json"
			},
			["Body"] = v_u_22
		}
		v_u_26 = v_u_6:RequestAsync(v27)
	end)
	if not v28 then
		v_u_7:d("Failed Init Call. error: " .. v29)
		return {
			["statusCode"] = v_u_5.EGAHTTPApiResponse.UnknownResponseCode,
			["body"] = nil
		}
	end
	v_u_7:d("init request content: " .. v_u_26.Body)
	local v30 = v_u_14(v_u_26, "Init")
	if v30 ~= v_u_5.EGAHTTPApiResponse.Ok and (v30 ~= v_u_5.EGAHTTPApiResponse.Created and v30 ~= v_u_5.EGAHTTPApiResponse.BadRequest) then
		v_u_7:d("Failed Init Call. URL: " .. v_u_21 .. ", JSONString: " .. v_u_22 .. ", Authorization: " .. v_u_24)
		return {
			["statusCode"] = v30,
			["body"] = nil
		}
	end
	local v_u_31 = nil
	if not pcall(function()
		-- upvalues: (ref) v_u_31, (ref) v_u_6, (ref) v_u_26
		v_u_31 = v_u_6:JSONDecode(v_u_26.Body)
	end) then
		v_u_7:d("Failed Init Call. Json decoding failed: " .. v29)
		return {
			["statusCode"] = v_u_5.EGAHTTPApiResponse.JsonDecodeFailed,
			["body"] = nil
		}
	end
	if v30 ~= v_u_5.EGAHTTPApiResponse.BadRequest then
		return v_u_2:validateAndCleanInitRequestResponse(v_u_31, v30 == v_u_5.EGAHTTPApiResponse.Created) and {
			["statusCode"] = v30,
			["body"] = v_u_31
		} or {
			["statusCode"] = v_u_5.EGAHTTPApiResponse.BadResponse,
			["body"] = nil
		}
	end
	v_u_7:d("Failed Init Call. Bad request. Response: " .. v_u_26.Body)
	return {
		["statusCode"] = v30,
		["body"] = nil
	}
end
function v_u_5.sendEventsInArray(p32, p33, p34, p35)
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_1, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5, (copy) v_u_14
	if p35 and #p35 ~= 0 then
		local v_u_36 = v_u_8 .. "/" .. p33 .. "/" .. p32.eventsUrlPath
		if v_u_1:IsStudio() then
			v_u_36 = v_u_8 .. "/5c6bcb5402204249437fb5a7a80a4959/" .. p32.eventsUrlPath
		end
		v_u_7:d("Sending \'events\' URL: " .. v_u_36)
		local v_u_37 = v_u_6:JSONEncode(p35):gsub("\"country_code\":\"unknown\"", "\"country_code\":null")
		local v38 = v_u_37
		local v_u_39
		if p34 then
			local v40 = v_u_4.hmac(v_u_4.sha256, v_u_1:IsStudio() and "16813a12f718bc5c620f56944e1abc3ea13ccbac" or p34, v38, true)
			v_u_39 = v_u_4.base64_encode(v40)
		else
			v_u_7:w("Error encoding, invalid SecretKey")
			v_u_39 = nil
		end
		local v_u_41 = nil
		local v43, v44 = pcall(function()
			-- upvalues: (ref) v_u_41, (ref) v_u_6, (ref) v_u_36, (copy) v_u_39, (ref) v_u_37
			local v42 = {
				["Url"] = v_u_36,
				["Method"] = "POST",
				["Headers"] = {
					["Authorization"] = v_u_39,
					["Content-Type"] = "application/json"
				},
				["Body"] = v_u_37
			}
			v_u_41 = v_u_6:RequestAsync(v42)
		end)
		if not v43 then
			v_u_7:d("Failed Events Call. error: " .. v44)
			return {
				["statusCode"] = v_u_5.EGAHTTPApiResponse.UnknownResponseCode,
				["body"] = nil
			}
		end
		v_u_7:d("body: " .. v_u_41.Body)
		local v45 = v_u_14(v_u_41, "Events")
		if v45 ~= v_u_5.EGAHTTPApiResponse.Ok and (v45 ~= v_u_5.EGAHTTPApiResponse.Created and v45 ~= v_u_5.EGAHTTPApiResponse.BadRequest) then
			v_u_7:d("Failed Events Call. URL: " .. v_u_36 .. ", JSONString: " .. v_u_37 .. ", Authorization: " .. v_u_39)
			return {
				["statusCode"] = v45,
				["body"] = nil
			}
		end
		local v_u_46 = nil
		pcall(function()
			-- upvalues: (ref) v_u_46, (ref) v_u_6, (ref) v_u_41
			v_u_46 = v_u_6:JSONDecode(v_u_41.Body)
		end)
		if not v_u_46 then
			v_u_7:d("Failed Events Call. Json decoding failed")
			return {
				["statusCode"] = v_u_5.EGAHTTPApiResponse.JsonDecodeFailed,
				["body"] = nil
			}
		end
		if v45 ~= v_u_5.EGAHTTPApiResponse.BadRequest then
			return {
				["statusCode"] = v_u_5.EGAHTTPApiResponse.Ok,
				["body"] = v_u_46
			}
		end
		v_u_7:d("Failed Events Call. Bad request. Response: " .. v_u_41.Body)
		return {
			["statusCode"] = v45,
			["body"] = nil
		}
	end
	v_u_7:d("sendEventsInArray called with missing eventArray")
end
return v_u_5