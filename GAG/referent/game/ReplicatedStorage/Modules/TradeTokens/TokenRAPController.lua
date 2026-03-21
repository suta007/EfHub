local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.TradeTokens.TokenRAPUtil)
local v_u_3 = v1.GameEvents.TradeEvents.TokenRAPs
local v_u_4 = {}
local v_u_5 = {
	["RAPs"] = {
		["Pet"] = {},
		["Holdable"] = {},
		["TradeBoothSkin"] = {}
	},
	["LoadTime"] = {
		["Pet"] = {},
		["Holdable"] = {},
		["TradeBoothSkin"] = {}
	}
}
function v_u_4.GetRAPById(_, p6, p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	local v8 = v_u_5.RAPs[p6][p7]
	if v8 == -1 then
		return nil
	end
	task.defer(v_u_4.GetRAPByIdAsync, v_u_4, p6, p7)
	return v8
end
function v_u_4.GetRAP(p9, p10, p11)
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	if not v_u_2.IsValidItem(p10, p11) then
		warn(("Invalid itemType %*"):format(p10), p11)
		return nil
	end
	local v12 = v_u_2.GetItemId(p10, p11)
	task.defer(v_u_4.GetRAPAsync, v_u_4, p10, p11)
	return p9:GetRAPById(p10, v12)
end
function v_u_4.GetRAPByIdAsync(_, p13, p14)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
	local v15 = v_u_5.RAPs[p13][p14]
	local v16 = v_u_5.LoadTime[p13][p14] or 0
	if v15 == nil and true or workspace:GetServerTimeNow() - v16 >= v_u_2.RAPCacheLifetime then
		local v17
		v15, v17 = v_u_3.GetItemRAPById:InvokeServer(p13, p14)
		if not v15 and v17 then
			warn(("Failed to GetItemRAP for %*: %* item:"):format(p13, v17), p14)
		end
	end
	if v15 then
		v_u_5.RAPs[p13][p14] = v15
		v_u_5.LoadTime[p13][p14] = workspace:GetServerTimeNow()
	end
	return v15
end
function v_u_4.GetRAPAsync(p18, p19, p20)
	-- upvalues: (copy) v_u_2
	return p18:GetRAPByIdAsync(p19, (v_u_2.GetItemId(p19, p20)))
end
function v_u_4.Start(_) end
task.spawn(v_u_4.Start, v_u_4)
return v_u_4