local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.UpdateService)
local v3 = v1.Assets.DiggingMinigame.Islands
local v4 = v1.Assets.DiggingMinigame.Blocks
local v5 = 7200
local v6 = 3600
local v7 = 0
v_u_2:IsUpdateDone()
local v_u_8 = "DISABLED"
local v_u_9 = v_u_8 == "DEFAULT" and true or v_u_8 == "Christmas"
local v10 = {
	["DEFAULT"] = {
		["Island"] = v3.DiggingIsland,
		["Block"] = v4.NormalDigBlock
	},
	["Christmas"] = {
		["Island"] = v3.ChristmasIsland,
		["Block"] = v4.SnowDigBlock
	}
}
local function v12()
	-- upvalues: (ref) v_u_8, (copy) v_u_2, (ref) v_u_9
	v_u_2:IsUpdateDone()
	local v11 = "DISABLED"
	v_u_8 = v11
	v_u_9 = v_u_8 == "DEFAULT" and true or v_u_8 == "Christmas"
	return v_u_8, v_u_9
end
v_u_2.OnUpdated:Once(v12)
return {
	["EVENT_APPEARANCE_TIME"] = v5,
	["EVENT_ACTIVE_DURATION"] = v6,
	["HALF_EVENT_TIME"] = v7,
	["PERMANENT_RESET_TIME"] = 86400,
	["IsPermanentEvent"] = function()
		-- upvalues: (ref) v_u_8, (copy) v_u_2, (ref) v_u_9
		v_u_2:IsUpdateDone()
		local v13 = "DISABLED"
		v_u_8 = v13
		v_u_9 = v_u_8 == "DEFAULT" and true or v_u_8 == "Christmas"
		return v_u_9
	end,
	["GetCurrentTheme"] = function()
		-- upvalues: (ref) v_u_8, (copy) v_u_2, (ref) v_u_9
		v_u_2:IsUpdateDone()
		local v14 = "DISABLED"
		v_u_8 = v14
		v_u_9 = v_u_8 == "DEFAULT" and true or v_u_8 == "Christmas"
		return v_u_8
	end,
	["PREVIOUS_THEME"] = "DISABLED",
	["NEXT_THEME"] = "DISABLED",
	["THEME_DATA"] = v10
}