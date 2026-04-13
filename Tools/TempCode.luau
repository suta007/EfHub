local data = require("./CraftingRecipeRegistry.lua")

local function ShowData(tbl, indent)
	local lclIndent = indent or 0
	local spacing = string.rep("  ", lclIndent)
	if type(tbl) == "table" then
		for k, v in pairs(tbl) do
			if type(v) == "table" then
				print(spacing .. "[" .. tostring(k) .. "] : (Table)")
				ShowData(v, lclIndent + 1)
			else
				print(spacing .. "[" .. tostring(k) .. "] : " .. tostring(v))
			end
			--return
		end
	else
		print(spacing .. tostring(tbl))
	end
end

ShowData(data)
