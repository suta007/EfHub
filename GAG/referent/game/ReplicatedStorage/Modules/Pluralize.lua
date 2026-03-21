local v_u_1 = {
	["Corn"] = "Corn",
	["Cacao"] = "Cacao",
	["Cactus"] = "Cacti",
	["Bamboo"] = "Bamboo",
	["Tomato"] = "Tomatoes"
}
return function(p2)
	-- upvalues: (copy) v_u_1
	if p2 then
		local v3 = string.lower(p2)
		for v4, v5 in pairs(v_u_1) do
			if string.lower(v4) == v3 then
				if string.sub(p2, 1, 1):match("%u") then
					return v5:gsub("^%l", string.upper)
				else
					return v5:lower()
				end
			end
		end
		if string.match(p2, "[^aeiou]y$") then
			return string.sub(p2, 1, -2) .. "ies"
		elseif string.match(p2, "[sxz]$") or (string.match(p2, "ch$") or string.match(p2, "sh$")) then
			return p2 .. "es"
		else
			return p2 .. "s"
		end
	else
		return ""
	end
end