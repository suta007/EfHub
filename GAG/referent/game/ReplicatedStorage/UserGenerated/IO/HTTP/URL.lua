local v_u_1 = game:GetService("HttpService")
local v_u_2 = require(game.ReplicatedStorage.UserGenerated.Lang.Keys)
local v_u_3 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts)
local v_u_4 = require(game.ReplicatedStorage.UserGenerated.IO.JSONEncoder)
local v_u_5 = {
	["http"] = 80,
	["https"] = 443
}
local v6 = v_u_3.Optional(v_u_3.Set(v_u_2(v_u_5)))
local v7 = v_u_3.String
local v8 = v_u_3.Optional(v_u_3.IntegerRange(0, 65535))
local function v10(p9)
	if type(p9) ~= "string" then
		error("string", 2)
	end
	if not utf8.len(p9) then
		error("UTF8", 2)
	end
	if #p9 > 0 and string.byte(p9, 1) ~= 47 then
		error("PathPrefix", 2)
	end
	return p9
end
local v_u_11 = v_u_3.Map(v_u_3.String, v_u_3.Any)
local v_u_12 = v_u_3.Table({
	["Protocol"] = v6,
	["Host"] = v7,
	["Port"] = v8,
	["Path"] = v10,
	["Params"] = v_u_3.Optional(v_u_11),
	["Fragment"] = v_u_3.Optional(v_u_3.String)
})
local v_u_34 = {
	["AssertProtocol"] = v6,
	["AssertHost"] = v7,
	["AssertPort"] = v8,
	["AssertPath"] = v10,
	["AssertEncodeParams"] = v_u_11,
	["AssertParams"] = v_u_12,
	["EncodePath"] = function(p13)
		-- upvalues: (copy) v_u_3, (copy) v_u_1
		v_u_3.String(p13)
		return p13:gsub("([^/]+)", function(p14)
			-- upvalues: (ref) v_u_1
			return v_u_1:UrlEncode(p14)
		end)
	end,
	["EncodeParams"] = function(p15)
		-- upvalues: (copy) v_u_11, (copy) v_u_2, (copy) v_u_4, (copy) v_u_1
		v_u_11(p15)
		local v16 = v_u_2(p15)
		table.sort(v16)
		local v17 = {}
		for _, v18 in ipairs(v16) do
			local v19 = v_u_4.Compact(p15[v18])
			local v20 = v_u_1:UrlEncode(v18) .. "=" .. v_u_1:UrlEncode(v19)
			table.insert(v17, v20)
		end
		return table.concat(v17, "&")
	end,
	["Build"] = function(p21)
		-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_34, (copy) v_u_1
		v_u_12(p21)
		local v22 = p21.Protocol or "https"
		local v23 = v_u_5[v22] or 80
		local v24 = p21.Port or v23
		local v25 = {}
		table.insert(v25, v22)
		table.insert(v25, "://")
		local v26 = p21.Host
		table.insert(v25, v26)
		if v24 ~= v23 then
			table.insert(v25, ":")
			local v27 = tostring(v24)
			table.insert(v25, v27)
		end
		local v28 = v_u_34.EncodePath
		local v29 = p21.Path
		table.insert(v25, v28(v29))
		local v30 = p21.Params
		if v30 and next(v30) ~= nil then
			table.insert(v25, "?")
			local v31 = v_u_34.EncodeParams
			table.insert(v25, v31(v30))
		end
		if p21.Fragment then
			table.insert(v25, "#")
			local v32 = v_u_1
			local v33 = p21.Fragment
			table.insert(v25, v32:UrlEncode(v33))
		end
		return table.concat(v25)
	end
}
return table.freeze(v_u_34)