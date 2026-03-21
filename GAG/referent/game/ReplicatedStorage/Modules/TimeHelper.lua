local v_u_66 = {
	["ConvertSecondsToTime"] = function(_, p1)
		local v2 = p1 / 60
		local v3 = math.floor(v2)
		local v4 = p1 % 60
		local v5 = v3 / 60
		local v6 = math.floor(v5)
		local v7 = v3 % 60
		local v8 = v6 / 24
		local v9 = math.floor(v8)
		local v10 = v6 % 24
		local v11 = v9 / 365
		local v12 = math.floor(v11)
		local v13 = v9 % 365
		local v14 = v13 / 30
		local v15 = math.floor(v14)
		local v16 = v13 % 30
		local v17 = v12 / 10
		local v18 = math.floor(v17)
		local v19 = v12 % 10
		local v20 = v18 / 10
		local v21 = math.floor(v20)
		local v22 = v18 % 10
		local v23 = v21 / 10
		local v24 = math.floor(v23)
		local v25 = v21 % 10
		local v26 = v24 / 10
		local v27 = math.floor(v26)
		local v28 = v24 % 10
		local v29 = {}
		local v30 = {
			["Type"] = v27 == 1 and "Eon" or "Eons"
		}
		if v27 == 0 then
			v27 = nil
		end
		v30.Value = v27
		v30.Occupies = 1
		local v31 = {
			["Type"] = v28 == 1 and "Millenium" or "Millenia"
		}
		if v28 == 0 then
			v28 = nil
		end
		v31.Value = v28
		v31.Occupies = 1
		local v32 = {
			["Type"] = v25 == 1 and "Century" or "Centuries"
		}
		if v25 == 0 then
			v25 = nil
		end
		v32.Value = v25
		v32.Occupies = 1
		local v33 = {
			["Type"] = v22 == 1 and "Decade" or "Decades"
		}
		if v22 == 0 then
			v22 = nil
		end
		v33.Value = v22
		v33.Occupies = 1
		local v34 = {
			["Type"] = v19 == 1 and "Year" or "Years"
		}
		if v19 == 0 then
			v19 = nil
		end
		v34.Value = v19
		v34.Occupies = 1
		local v35 = {
			["Type"] = v15 == 1 and "Month" or "Months"
		}
		if v15 == 0 then
			v15 = nil
		end
		v35.Value = v15
		v35.Occupies = 2
		local v36 = {
			["Type"] = v16 == 1 and "Day" or "Days"
		}
		if v16 == 0 then
			v16 = nil
		end
		v36.Value = v16
		v36.Occupies = 2
		local v37 = {
			["Type"] = v10 == 1 and "Hour" or "Hours"
		}
		if v10 == 0 then
			v10 = nil
		end
		v37.Value = v10
		v37.Occupies = 1
		local v38 = {
			["Type"] = v7 == 1 and "Minute" or "Minutes"
		}
		if v7 == 0 then
			v7 = nil
		end
		v38.Value = v7
		v38.Occupies = 2
		local v39 = {
			["Type"] = v4 == 1 and "Second" or "Seconds"
		}
		if v4 == 0 then
			v4 = nil
		end
		v39.Value = v4
		v39.Occupies = 2
		v39.OverwriteOccupy = true
		__set_list(v29, 1, {v30, v31, v32, v33, v34, v35, v36, v37, v38, v39})
		return v29
	end,
	["GenerateTextFromTime"] = function(_, p40, p41)
		local v42 = p41 ~= false
		local v43 = p40 // 86400
		local v44 = p40 % 86400
		local v45 = v44 // 3600
		local v46 = v44 % 3600
		local v47 = v46 // 60
		local v48 = v46 % 60 // 1
		local v49 = ""
		if v43 > 0 then
			v49 = v49 .. v43 .. (v43 == 1 and " Day" or " Days")
		end
		if v45 > 0 then
			if #v49 > 0 then
				v49 = v49 .. (v42 and ", " or " ")
			end
			v49 = v49 .. v45 .. (v45 == 1 and " Hour" or " Hours")
		end
		if v47 > 0 then
			if #v49 > 0 then
				v49 = v49 .. (v42 and ", " or " ")
			end
			v49 = v49 .. v47 .. (v47 == 1 and " Minute" or " Minutes")
		end
		if v48 > 0 then
			if #v49 > 0 then
				v49 = v49 .. (v42 and ", " or " ")
			end
			v49 = v49 .. v48 .. (v48 == 1 and " Second" or " Seconds")
		end
		if v42 then
			local v50 = string.match(v49, "^(.*), ")
			if v50 then
				local v51 = #v50 + 3
				v49 = v50 .. " and " .. string.sub(v49, v51)
			end
		end
		return v49
	end,
	["GenerateColonFormatFromTime"] = function(_, p52)
		-- upvalues: (copy) v_u_66
		local v53 = v_u_66:ConvertSecondsToTime(p52)
		local v54 = ""
		local v55 = {
			"Second",
			"Seconds",
			"Minute",
			"Minutes"
		}
		for v56, v57 in v53 do
			local v58 = v57.Value
			local v59 = v57.Occupies
			local v60 = v57.Type
			local v61 = v53[v56 - 1]
			local v62 = v57.OverwriteOccupy
			if v62 then
				v61 = v62
			elseif v61 then
				v61 = v61.Value
			end
			local v63 = table.find(v55, v60) and (v58 or 0) or v58
			if v63 then
				local v64 = v61 and ("%%0%*d"):format(v59) or "%d"
				local v65 = string.format(v64, v63)
				v54 = #v53 == v56 and ("%*%*"):format(v54, v65) or ("%*%*:"):format(v54, v65)
			end
		end
		return v54
	end
}
local v_u_67 = {
	{
		["Name"] = "Year",
		["Singular"] = "Year",
		["Plural"] = "Years",
		["Value"] = 31536000
	},
	{
		["Name"] = "Month",
		["Singular"] = "Month",
		["Plural"] = "Months",
		["Value"] = 2592000
	},
	{
		["Name"] = "Day",
		["Singular"] = "Day",
		["Plural"] = "Days",
		["Value"] = 86400
	},
	{
		["Name"] = "Hour",
		["Singular"] = "Hour",
		["Plural"] = "Hours",
		["Value"] = 3600
	},
	{
		["Name"] = "Minute",
		["Singular"] = "Minute",
		["Plural"] = "Minutes",
		["Value"] = 60
	},
	{
		["Name"] = "Second",
		["Singular"] = "Second",
		["Plural"] = "Seconds",
		["Value"] = 1
	}
}
function v_u_66.GetLargestTime(_, p68, p69, p70)
	-- upvalues: (copy) v_u_67
	local v71 = p70 or 1
	local v72 = 0
	local v73 = {}
	local v74 = p69 or "floor"
	for _, v75 in ipairs(v_u_67) do
		if v71 <= v72 then
			break
		end
		local v76 = p68 / v75.Value
		local v77 = math.floor(v76)
		if v77 > 0 or #v73 == 0 and v75.Name == "Second" then
			if v72 == v71 - 1 and p68 % v75.Value > 0 then
				if v74 == "ceil" then
					v77 = v77 + 1
				elseif v74 == "round" and p68 % v75.Value >= v75.Value / 2 then
					v77 = v77 + 1
				end
			end
			local v78 = v77 .. " " .. (v77 == 1 and v75.Singular or v75.Plural)
			table.insert(v73, v78)
			p68 = p68 - v77 * v75.Value
			v72 = v72 + 1
		end
	end
	if #v73 == 0 then
		return "0 Seconds"
	end
	if #v73 == 1 then
		return v73[1]
	end
	if #v73 == 2 then
		return v73[1] .. " and " .. v73[2]
	end
	local v79 = table.remove(v73)
	return table.concat(v73, ", ") .. " and " .. v79
end
return v_u_66