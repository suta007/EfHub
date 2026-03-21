return {
	["Comma"] = function(p1)
		repeat
			local v2
			p1, v2 = string.gsub(p1, "^(-?%d+)(%d%d%d)", "%1,%2")
		until v2 == 0
		return p1
	end
}