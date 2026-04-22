local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
require(v1.Modules.DumpTable)
local v_u_3 = require(v1.Modules.GameConfigController)
local v_u_4 = game.GameId == 7835737630
local v_u_5 = game.GameId == 7500518143
local v_u_6 = game.GameId == 7436755782
return function(p_u_7)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6
	if not p_u_7 then
		return false
	end
	if v_u_2:IsStudio() then
		return true
	end
	local v8, v9 = pcall(function()
		-- upvalues: (copy) p_u_7
		return p_u_7:GetRankInGroupAsync(35789249)
	end)
	local v10 = v8 and v9
	local v11 = v_u_4
	if v11 then
		v11 = table.find(v_u_3:GetConfig("AuthorizedRolesQAGame") or {}, v10)
	end
	local v12 = v_u_5
	if v12 then
		v12 = table.find(v_u_3:GetConfig("AuthorizedUsersDevGame") or {}, p_u_7.UserId)
	end
	local v13 = v_u_6
	if v13 then
		v13 = table.find(v_u_3:GetConfig("AuthorizedUsersLiveGame") or {}, p_u_7.UserId)
	end
	return v11 or (v12 or v13)
end