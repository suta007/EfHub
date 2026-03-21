local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Concurrency.Bindable)
local v_u_3 = require(game.ReplicatedStorage.UserGenerated.Collections.DeepFreeze)
local v_u_4 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Lock)
local v5 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts)
local v16 = {
	["RemoveUsedAt"] = function(_, _) end,
	["InsertUsedAt"] = function(_, _) end,
	["SetUsedAt"] = function(p6, p7, p8)
		p6:RemoveUsedAt(p7)
		p7.UsedAt = p8
		p6:InsertUsedAt(p7)
	end,
	["Get"] = function(p9, p10)
		local v11 = p9.AssertKey(p10)
		local v12 = p9.Cache[v11]
		if not v12 then
			return nil
		end
		local v13 = os.clock()
		local v14 = v12.RetrievedAt
		local v15
		if v14 then
			v15 = v13 - v14
		else
			v15 = nil
		end
		if not v15 or p9.MaxAge <= v15 and not p9.ReturnStale then
			return nil
		end
		p9:SetUsedAt(v12, v13)
		return v12.Value
	end
}
function AsyncCallback(p17, p18, p19, p20)
	-- upvalues: (copy) v_u_3
	local v21 = p18.RetrievedAt
	local v22
	if v21 then
		v22 = p20 - v21
	else
		v22 = nil
	end
	if v22 and v22 < p17.MaxAge then
		return p18.Value
	else
		local v23 = p18.AttemptedAt
		if (not v23 and (1 / 0) or p20 - v23) < p17.FailureRetryDelay then
			if p17.ReturnStale then
				return p18.Value
			else
				return nil
			end
		else
			p18.AttemptedAt = p20
			local v24, v25 = pcall(p17.Callback, p19)
			local v26 = os.clock()
			p18.AttemptedAt = v26
			p17:SetUsedAt(p18, v26)
			if v24 then
				if p17.Freeze then
					v25 = v_u_3(v25)
				end
				p18.Value = v25
				p18.RetrievedAt = v26
				p17.Updated:Fire(p19)
				return v25
			elseif p17.ReturnStale then
				return p18.Value
			else
				return nil
			end
		end
	end
end
function v16.GetAsync(p27, p28)
	-- upvalues: (copy) v_u_4
	local v29 = os.clock()
	local v30 = p27.AssertKey(p28)
	local v31 = p27.Cache[v30]
	if v31 then
		p27:SetUsedAt(v31, v29)
	else
		v31 = {
			["Lock"] = v_u_4.new(),
			["UsedAt"] = v29
		}
		p27.Cache[v30] = v31
		p27:InsertUsedAt(v31)
	end
	return v31.Lock:Call(AsyncCallback, p27, v31, p28, v29)
end
function v16.Delete(p32, p33)
	local v34 = p32.AssertKey(p33)
	if p32.Cache[v34] then
		p32.Cache[v34] = nil
		p32.Deleted:Fire(p33)
	end
end
local v_u_35 = table.freeze({
	["__index"] = table.freeze(v16)
})
local v_u_36 = v5.Table({
	["Callback"] = v5.Function,
	["AssertKey"] = v5.Function,
	["MaxAge"] = v5.Optional(v5.NonNegative),
	["FailureRetryDelay"] = v5.Optional(v5.NonNegative),
	["ReturnStale"] = v5.Optional(v5.Boolean),
	["Freeze"] = v5.Optional(v5.Boolean)
})
return table.freeze({
	["new"] = function(p37)
		-- upvalues: (copy) v_u_36, (copy) v_u_2, (copy) v_u_35
		v_u_36(p37)
		local v38 = {
			["Updated"] = v_u_2.new(),
			["Deleted"] = v_u_2.new(),
			["Callback"] = p37.Callback,
			["AssertKey"] = p37.AssertKey,
			["MaxAge"] = p37.MaxAge or (1 / 0),
			["FailureRetryDelay"] = p37.FailureRetryDelay or 300,
			["ReturnStale"] = p37.ReturnStale == nil and true or p37.ReturnStale,
			["Freeze"] = p37.Freeze == nil and true or p37.Freeze,
			["Cache"] = {}
		}
		local v39 = v_u_35
		local v40 = setmetatable(v38, v39)
		table.freeze(v40)
		return v40
	end
})