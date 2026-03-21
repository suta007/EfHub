local v_u_9 = {
	["StipFlavourText"] = function(_, p1)
		if p1 and p1 ~= "" then
			return p1:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")
		end
		warn("StringUtils:StipFlavourText | No item name passed!")
		return ""
	end,
	["FormatGearName"] = function(_, p2)
		-- upvalues: (copy) v_u_9
		if p2 and p2 ~= "" then
			return v_u_9:StipFlavourText(p2):gsub("%s+", ""):gsub("(%u)", " %1"):gsub("^%s+", "")
		end
		warn("StringUtils:FormatGearName | No gear name passed!")
		return ""
	end,
	["Pluralize"] = function(_, p3)
		if string.match(p3, "[^aeiou]y$") then
			return string.sub(p3, 1, -2) .. "ies"
		elseif string.match(p3, "(s|x|z)$") or (string.match(p3, "ch$") or string.match(p3, "sh$")) then
			return p3 .. "es"
		else
			return p3 .. "s"
		end
	end,
	["TryPluralize"] = function(_, p4, p5)
		-- upvalues: (copy) v_u_9
		if p5 == 1 then
			return p4
		else
			return v_u_9:Pluralize(p4)
		end
	end,
	["NormalizeRecipeName"] = function(_, p6)
		local v7 = string.find(p6, "@")
		if not v7 then
			return p6
		end
		local v8 = v7 - 1
		return string.sub(p6, 1, v8)
	end
}
return v_u_9