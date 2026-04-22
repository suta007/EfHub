local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.TeamEventHelper)
local v2 = require(v1.Modules.Signal)
local v3 = v1:WaitForChild("GameEvents")
local v_u_4 = v3.TeamEvents.UpdateTeamDataRE
v3:WaitForChild("TeamEvents")
local v5 = game.Players.LocalPlayer
assert(v5, "LocalPlayer not found")
local v_u_6 = {
	["DataUpdated"] = v2.new()
}
local v_u_7 = nil
local function v_u_15(p8)
	if p8.members then
		local v9 = {}
		for v10, v11 in p8.members do
			local v12 = tonumber(v10)
			if v12 then
				v9[v12] = v11
			end
		end
		p8.members = v9
	end
	if p8.metadata and p8.metadata.captain ~= nil then
		local v13 = p8.metadata
		local v14 = p8.metadata.captain
		v13.captain = tonumber(v14) or p8.metadata.captain
	end
end
local function v_u_19(p16)
	-- upvalues: (copy) v_u_15, (ref) v_u_7, (copy) v_u_6
	if p16 then
		for _, v17 in p16 do
			for _, v18 in v17 do
				v_u_15(v18)
			end
		end
	end
	v_u_7 = p16
	v_u_6.DataUpdated:Fire()
end
function v_u_6.GetCachedData(_)
	-- upvalues: (ref) v_u_7
	return v_u_7
end
function v_u_6.GetTeamId(_, p20, p21)
	-- upvalues: (ref) v_u_7
	local v22 = v_u_7
	if v22 then
		v22 = v_u_7[p20]
	end
	if not v22 then
		return nil
	end
	for v23, v24 in v22 do
		if v24.members[p21.UserId] ~= nil then
			return v23
		end
	end
	return nil
end
function v_u_6.GetTeamData(_, p25, p26)
	-- upvalues: (ref) v_u_7
	local v27 = v_u_7
	if v27 then
		v27 = v_u_7[p25]
	end
	if v27 then
		return v27[p26]
	else
		return nil
	end
end
function Init()
	-- upvalues: (copy) v_u_4, (copy) v_u_19
	v_u_4.OnClientEvent:Connect(v_u_19)
end
task.spawn(Init)
return v_u_6