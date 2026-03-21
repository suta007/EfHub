local v1 = script.Parent.Parent
local v_u_2 = require(v1.None)
local v_u_3 = require(script.Parent.Parent.utils.isDataStructure)
local v_u_4 = require(script.Parent.slice)
local v_u_5 = require(script.Parent.get)
local v_u_6 = require(script.Parent:FindFirstChild("remove"))
local v_u_7 = require(script.Parent.set)
local function v_u_20(p8, p9, p10, p11, p12)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_20, (copy) v_u_6, (copy) v_u_7
	local v13 = p8 == v_u_2
	if p10 == #p9 + 1 then
		if not v13 then
			p12 = p8
		end
		local v14 = p11(p12)
		if v14 == p12 then
			return p8
		else
			return v14
		end
	else
		if not (v13 or v_u_3(p8)) then
			local v15 = error
			local v16 = v_u_4(p9, 1, p10 - 1)
			v15("Cannot update within non-data-structure value in path [" .. table.concat(v16, ", ") .. "]: " .. tostring(p8))
		end
		local v17 = p9[p10]
		local v18
		if v13 then
			v18 = v_u_2
		else
			v18 = v_u_5(p8, v17, v_u_2)
		end
		local v19 = v_u_20(v18, p9, p10 + 1, p11, p12)
		if v19 == v18 then
			return p8
		elseif v19 == v_u_2 then
			return v_u_6(p8, v17)
		else
			return v_u_7(v13 and {} or p8, v17, v19)
		end
	end
end
return function(p21, p22, p23, p24)
	-- upvalues: (copy) v_u_20, (copy) v_u_2
	local v25 = v_u_20(p21, p22, 1, p23, p24)
	if v25 == v_u_2 then
		return p24
	else
		return v25
	end
end