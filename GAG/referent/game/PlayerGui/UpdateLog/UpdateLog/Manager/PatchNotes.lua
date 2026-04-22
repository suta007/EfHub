local v1 = {
	["2.0.0"] = {
		["Title"] = "Placeholder Part 3",
		["Banner"] = nil,
		["Changes"] = {
			"Lorem ipsum",
			"dolor sit amet",
			"consectetur adipiscing elit",
			"sed do eiusmod"
		}
	},
	["1.9.0"] = {
		["Title"] = "Placeholder Part 2",
		["Banner"] = nil,
		["Changes"] = { "tempor incididunt", "ut labore et dolore", "magna aliqua" }
	},
	["1.8.0"] = {
		["Title"] = "Placeholder",
		["Banner"] = nil,
		["Changes"] = { "Ut enim", "ad minim veniam", "quis nostrud" }
	}
}
local v2 = {}
for v3, v4 in v1 do
	local v5 = {
		["Title"] = v4.Title,
		["Version"] = v3,
		["Banner"] = v4.Banner,
		["Changes"] = v4.Changes
	}
	table.insert(v2, v5)
end
table.sort(v2, function(p6, p7)
	local v8, v9, v10 = p6.Version:match("^(%d+)%.(%d+)%.(%d+)$")
	local v11 = tonumber(v8)
	local v12 = tonumber(v9)
	local v13 = tonumber(v10)
	local v14, v15, v16 = p7.Version:match("^(%d+)%.(%d+)%.(%d+)$")
	local v17 = tonumber(v14)
	local v18 = tonumber(v15)
	local v19 = tonumber(v16)
	if v11 == v17 then
		if v12 == v18 then
			return v19 < v13
		else
			return v18 < v12
		end
	else
		return v17 < v11
	end
end)
return v2