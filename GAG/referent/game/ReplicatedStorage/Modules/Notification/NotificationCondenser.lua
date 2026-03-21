require(game.ReplicatedStorage.Modules.Chalk)
local v1 = {}
local v2 = {
	["YourShopRestock"] = {
		["Key"] = "YourShopRestock",
		["Pattern"] = "^Your ([%w ]+ Shop) stock has restocked!$",
		["Suffix"] = "stock has restocked!",
		["PluralSuffix"] = "stocks have restocked!"
	}
}
v1.Rules = v2
function v1.GetCondenseKey(p3, p4)
	local v5 = p4:gsub("<.->", "")
	for _, v6 in pairs(p3.Rules) do
		local v7 = v5:match(v6.Pattern)
		if v7 then
			local _ = v6.Suffix
			local v8 = p4:match("^.*(<font.-</font>)%s+.*$")
			local v9 = v8 or p4
			local v10 = v9:match("^%s*<font[^>]-color=\"([^\"]+)\"[^>]*>.*</font>%s*$") or v9:match("^%s*<font[^>]-color=([^%s>]+)[^>]*>.*</font>%s*$")
			if not v8 then
				local v11 = p4:match("^%s*<font[^>]-color=\"([^\"]+)\"[^>]*>.*</font>%s*$") or p4:match("^%s*<font[^>]-color=([^%s>]+)[^>]*>.*</font>%s*$")
				if v11 then
					v8 = ("<font color=\"%*\">%*</font>"):format(v11, v7)
				else
					v8 = v7
				end
			end
			return {
				["Rule"] = v6,
				["Variant"] = {
					["Plain"] = v7,
					["Rich"] = v8,
					["Color"] = v10
				}
			}
		end
	end
	return nil
end
function v1.BuildCondensedText(_, p12, p13, p14)
	table.sort(p12, function(p15, p16)
		return p15.Plain < p16.Plain
	end)
	local v17 = true
	local v18
	if #p12 > 0 then
		v18 = p12[1].Color
		for v19 = 2, #p12 do
			if p12[v19].Color ~= v18 then
				v17 = false
				break
			end
		end
	else
		v17 = false
		v18 = nil
	end
	local v20
	if #p12 == 1 then
		v20 = p12[1].Rich .. " " .. p13
	elseif #p12 == 2 then
		v20 = p12[1].Rich .. " and " .. p12[2].Rich .. " " .. p14
	else
		local v21 = {}
		for v22 = 1, #p12 - 1 do
			local v23 = p12[v22].Rich
			table.insert(v21, v23)
		end
		v20 = table.concat(v21, ", ") .. " and " .. p12[#p12].Rich .. " " .. p14
	end
	if v17 and v18 then
		v20 = ("<font color=\"%*\">%*</font>"):format(v18, v20)
	end
	return v20
end
return v1