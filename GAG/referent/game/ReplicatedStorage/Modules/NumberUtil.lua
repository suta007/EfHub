local v1 = game:GetService("ReplicatedStorage")
local v2 = {
	"CENT",
	"VIG",
	"NOV",
	"OCT",
	"SEP",
	"SXD",
	"QUI",
	"QUA",
	"TR",
	"DU",
	"UN",
	"DE",
	"NO",
	"OC",
	"SP",
	"SX",
	"QI",
	"QA",
	"T",
	"B",
	"M",
	"K"
}
local v3 = #v2 - 1
local v_u_4 = {}
local v_u_21 = {
	["autoColon"] = function(p5)
		if p5 >= 86400 then
			return string.format("%02i:%02i:%02i:%02i", p5 / 86400, p5 / 3600 % 24, p5 / 60 % 60, p5 % 60)
		elseif p5 >= 3600 then
			return string.format("%02i:%02i:%02i", p5 / 3600, p5 / 60 % 60, p5 % 60)
		else
			return string.format("%02i:%02i", p5 / 60, p5 % 60)
		end
	end,
	["toMS"] = function(p6)
		return string.format("%01i:%02i", p6 / 60, p6 % 60)
	end,
	["toHMS"] = function(p7)
		return string.format("%02i:%02i:%02i", p7 / 3600, p7 / 60 % 60, p7 % 60)
	end,
	["toDHMS"] = function(p8)
		if p8 >= 86400 then
			return ("%*d %*h"):format(p8 // 86400, p8 % 86400 // 3600)
		elseif p8 >= 3600 then
			return ("%*h %*m"):format(p8 // 3600, p8 % 3600 // 60)
		else
			return ("%*m %*s"):format(p8 // 60, p8 // 1 % 60)
		end
	end,
	["toHMSExtended"] = function(p9)
		local v10 = p9 / 3600
		if v10 < 24 then
			return string.format("%02i:%02i:%02i", v10, p9 / 60 % 60, p9 % 60)
		end
		if v10 < 48 then
			return string.format("1 day, %02i hours", v10 - 24)
		end
		local v11 = v10 / 24
		return string.format("%02i days", v11)
	end,
	["compactFormat"] = function(p12, p13)
		if p12 >= 86400 then
			local v14 = p12 % 86400 // 3600
			return ("%*d%*"):format(p12 // 86400, (v14 <= 0 or p13) and "" or (" %*h"):format(v14))
		end
		if p12 >= 3600 then
			local v15 = p12 % 3600 // 60
			return ("%*h%*"):format(p12 // 3600, (v15 <= 0 or p13) and "" or (" %*m"):format(v15))
		end
		if p12 < 60 then
			return ("%*s"):format(p12 // 1)
		end
		local v16 = p12 // 1 % 60
		return ("%*m%*"):format(p12 // 60, (v16 <= 0 or p13) and "" or (" %*s"):format(v16))
	end,
	["formatShopTime"] = function(p17)
		if p17 >= 86400 then
			local v18 = p17 / 86400
			local v19 = math.ceil(v18)
			return ("%* Day%*"):format(v19, v19 == 1 and "" or "s")
		end
		if p17 >= 3600 then
			return "Today"
		end
		if p17 < 60 then
			return ("%* Seconds"):format(p17 // 1)
		end
		local v20 = p17 // 60
		return ("%* Minute%*"):format(v20, v20 == 1 and "" or "s")
	end
}
for _, v22 in v2 do
	local v23 = {
		["Number"] = math.pow(1000, v3) * 1000,
		["Symbol"] = v22
	}
	table.insert(v_u_4, v23)
	v3 = v3 - 1
end
function v_u_21.FormatCompactPrice(p24, p25)
	-- upvalues: (copy) v_u_4
	for _, v26 in v_u_4 do
		local v27 = v26.Number
		local v28 = v26.Symbol
		if v27 <= p24 then
			local v29 = p24 / v27
			return ("%*%*"):format(("%%.%*f"):format(p25 or "1"):format(v29):gsub("0+$", ""):gsub("%.$", ""), v28)
		end
	end
	return ("%.0f"):format(p24)
end
function v_u_21.ReverseLerp(p30, p31, p32)
	return (p32 - p30) / (p31 - p30)
end
function v_u_21.RoundToDP(p33, p34)
	local v35 = p33 * 10 ^ p34
	return math.round(v35) / 10 ^ p34
end
local v_u_36 = require(v1.Comma_Module)
function v_u_21.Comma(p37)
	-- upvalues: (copy) v_u_36
	return v_u_36.Comma(p37)
end
local v_u_38 = {
	{
		["Name"] = "Flower",
		["Icon"] = "\240\159\140\184",
		["Value"] = 1000000000000000
	}
}
table.sort(v_u_38, function(p39, p40)
	return p39.Value > p40.Value
end)
function v_u_21.FormatSheckles(p41)
	-- upvalues: (copy) v_u_38, (copy) v_u_21
	local v42 = {}
	for _, v43 in v_u_38 do
		if v43.Value <= p41 then
			local v44 = p41 / v43.Value
			local v45 = math.floor(v44)
			local v46 = p41 % v43.Value
			p41 = math.floor(v46)
			local v47
			if v45 >= 1000 then
				v47 = v_u_21.FormatCompactPrice(v45)
			else
				v47 = tostring(v45)
			end
			local v48 = ("%*%*"):format(v47, v43.Icon)
			table.insert(v42, v48)
		end
	end
	if p41 > 0 then
		local v49 = v_u_21.FormatCompactPrice(p41) .. "\194\162"
		table.insert(v42, v49)
	end
	if #v42 == 0 then
		return "0\194\162"
	end
	if #v42 == 1 then
		return v42[1]
	end
	local v50 = table.remove(v42)
	return table.concat(v42, ", ") .. " " .. v50
end
function v_u_21.BreakdownSheckles(p51)
	-- upvalues: (copy) v_u_38
	local v52 = {}
	for _, v53 in v_u_38 do
		if v53.Value <= p51 then
			local v54 = p51 / v53.Value
			local v55 = math.floor(v54)
			p51 = p51 % v53.Value
			local v56 = {
				["Name"] = v53.Name,
				["Icon"] = v53.Icon,
				["Count"] = v55
			}
			table.insert(v52, v56)
		end
	end
	return {
		["Tiers"] = v52,
		["Remainder"] = p51
	}
end
function v_u_21.DisplaySheckles(p57)
	-- upvalues: (copy) v_u_21
	if type(p57) == "string" then
		p57 = tonumber(p57)
	end
	if p57 then
		local v58 = math.abs(p57)
		local v59 = math.floor(v58)
		if v59 >= 1000000000000000 then
			return v_u_21.FormatSheckles(v59)
		elseif v59 >= 1000 then
			return v_u_21.FormatCompactPrice(v59, "3") .. "\194\162"
		else
			return v_u_21.Comma(v59) .. "\194\162"
		end
	else
		warn("Incorrect type for amount")
		return
	end
end
return v_u_21