local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Strings.TrimmedNumberString)
return function(p3)
	-- upvalues: (copy) v_u_2
	if type(p3) ~= "string" then
		p3 = v_u_2(p3)
	end
	local v4, v5, v6 = string.match(p3, "^(.-)([0-9,]+)(.*)$")
	if not v5 then
		return p3
	end
	local v7 = {}
	if v4 then
		table.insert(v7, v4)
	end
	local v8 = string.gsub(v5, ",", "")
	local v9 = 1
	local v10 = #v8 % 3
	if v10 > 0 then
		local v11 = v9 + v10 - 1
		local v12 = string.sub(v8, v9, v11)
		table.insert(v7, v12)
		v9 = v9 + v10
	end
	while v9 <= #v8 do
		if v9 > 1 then
			table.insert(v7, ",")
		end
		local v13 = v9 + 2
		local v14 = string.sub(v8, v9, v13)
		table.insert(v7, v14)
		v9 = v9 + 3
	end
	if v6 then
		table.insert(v7, v6)
	end
	return table.concat(v7)
end