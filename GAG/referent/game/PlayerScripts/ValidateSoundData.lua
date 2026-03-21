local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("SoundService")
local v3 = require(v1.Data.SoundData.SoundServiceData)
warn("Starting sound scan")
local v_u_4 = {
	["RollOffMaxDistance"] = 10000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Looped"] = false,
	["PlaybackSpeed"] = 1,
	["TimePosition"] = 0,
	["Volume"] = 0.5
}
local v5 = v2:GetDescendants()
local function v13(p6, p7)
	local v8 = p7.Tags or {}
	local v9 = p6:GetTags()
	local v10 = true
	for _, v11 in pairs(v8) do
		if not p6:HasTag(v11) then
			warn((("Sound %*: missing tag \"%*\""):format(p6.Name, v11)))
			v10 = false
		end
	end
	for _, v12 in pairs(v9) do
		if not table.find(v8, v12) then
			warn((("Sound %*: unexpected tag \"%*\""):format(p6.Name, v12)))
			v10 = false
		end
	end
	return v10
end
local v14 = 0
local function v26(p15, p16, p17)
	-- upvalues: (copy) v_u_4
	local v18 = p15[p17]
	local v19 = p16[p17]
	local v20 = v_u_4[p17]
	local v21
	if type(v18) == "number" and type(v20) == "number" then
		local v22 = v18 - v20
		v21 = (nil or 0.0001) > math.abs(v22)
	else
		v21 = v18 == v20
	end
	local v23 = v19 ~= nil
	if v21 then
		if v23 then
			warn((("Sound %*: %* is default (%*), but is listed in SoundServiceData"):format(p15.Name, p17, v20)))
			return false
		end
	else
		if not v23 then
			warn((("Sound %*: %* is %*, but is not listed in SoundServiceData"):format(p15.Name, p17, v18)))
			return false
		end
		local v24
		if type(v18) == "number" and type(v19) == "number" then
			local v25 = v18 - v19
			v24 = (nil or 0.0001) > math.abs(v25)
		else
			v24 = v18 == v19
		end
		if not v24 then
			warn((("Sound %*: %* is %*, expected %*"):format(p15.Name, p17, v18, v19)))
			return false
		end
	end
	return true
end
local v27 = 0
local function v42(p28, p29)
	local v30 = p29.Effects or {}
	local v31 = true
	for v32, v33 in pairs(v30) do
		local v34 = p28:FindFirstChildWhichIsA(v32)
		if v34 then
			for v35, v36 in pairs(v33) do
				local v37 = v34[v35]
				local v38
				if type(v37) == "number" and type(v36) == "number" then
					local v39 = v37 - v36
					v38 = (nil or 0.0001) > math.abs(v39)
				else
					v38 = v37 == v36
				end
				if not v38 then
					warn((("Sound %*: %*.%* is %*, expected %*"):format(p28.Name, v32, v35, v37, v36)))
					v31 = false
				end
			end
		else
			warn((("Sound %*: missing effect %*"):format(p28.Name, v32)))
			v31 = false
		end
	end
	for _, v40 in pairs(p28:GetChildren()) do
		if v40:IsA("SoundEffect") then
			local v41 = v40.ClassName
			if not v30[v41] then
				warn((("Sound %*: unexpected effect %*"):format(p28.Name, v41)))
				v31 = false
			end
		end
	end
	return v31
end
for _, v43 in pairs(v5) do
	if v43:IsA("Sound") then
		v14 = v14 + 1
		local v44 = v3[v43.Name]
		if v44 then
			local v45 = v44.SoundProperties or {}
			local v46 = v43.SoundId
			if v43:HasTag("LazyLoadSound") then
				v46 = v43:GetAttribute("SoundId") or v46
			end
			if v46 ~= v44.Id then
				warn((("Sound %*: SoundId is %*, expected %*"):format(v43.Name, v46, v44.Id)))
				v27 = v27 + 1
			end
			for v47 in pairs(v_u_4) do
				if not v26(v43, v45, v47) then
					v27 = v27 + 1
				end
			end
			if not v42(v43, v44) then
				v27 = v27 + 1
			end
			if not v13(v43, v44) then
				v27 = v27 + 1
			end
		else
			warn((("Sound %* not found in SoundServiceData"):format(v43.Name)))
			v27 = v27 + 1
		end
	end
end
warn((("Finished sound scan: %* sounds, %* issues found"):format(v14, v27)))