local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v1.Data.AuthorizedRolesQAGame)
local v_u_4 = require(v1.Data.AuthorizedUsersDevGame)
require(v1.Data.AuthorizedRolesLiveGame)
local v_u_5 = require(v1.Data.AuthorizedUsersLiveGame)
require(v1.Modules.DumpTable)
local v_u_6 = game.GameId == 7835737630
local v_u_7 = game.GameId == 7500518143
local v_u_8 = game.GameId == 7436755782
return function(p_u_9)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_5
	if not p_u_9 then
		return false
	end
	if v_u_2:IsStudio() then
		return true
	end
	local v10, v11 = pcall(function()
		-- upvalues: (copy) p_u_9
		return p_u_9:GetRankInGroup(35789249)
	end)
	local v12 = v10 and v11
	local v13 = v_u_6
	if v13 then
		v13 = v_u_3[v12]
	end
	local v14 = v_u_7
	if v14 then
		v14 = table.find(v_u_4, p_u_9.UserId)
	end
	local v15 = v_u_8
	if v15 then
		v15 = table.find(v_u_5, p_u_9.UserId)
	end
	return v13 or (v14 or v15)
end