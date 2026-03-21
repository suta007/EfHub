local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = {}
local function v_u_26(p4, p5)
	local v6 = {}
	for _, v7 in p4:GetDescendants() do
		if v7:IsA("BasePart") then
			local v8 = p5:FindFirstChild(v7.Name, true)
			if v8 and v8:IsA("BasePart") then
				local v9 = v7.Color
				local v10 = string.format
				local v11 = v9.R * 255 + 0.5
				local v12 = math.floor(v11)
				local v13 = v9.G * 255 + 0.5
				local v14 = math.floor(v13)
				local v15 = v9.B * 255 + 0.5
				local v16 = v10("%d,%d,%d", v12, v14, (math.floor(v15)))
				if not v6[v16] then
					v6[v16] = {
						["Color"] = v8.Color,
						["Material"] = v8.Material
					}
				end
				v7.Color = v8.Color
				v7.Material = v8.Material
			end
		end
	end
	for _, v17 in p4:GetDescendants() do
		if v17:IsA("BasePart") and not p5:FindFirstChild(v17.Name, true) then
			local v18 = v17.Color
			local v19 = string.format
			local v20 = v18.R * 255 + 0.5
			local v21 = math.floor(v20)
			local v22 = v18.G * 255 + 0.5
			local v23 = math.floor(v22)
			local v24 = v18.B * 255 + 0.5
			local v25 = v6[v19("%d,%d,%d", v21, v23, (math.floor(v24)))]
			if v25 then
				v17.Color = v25.Color
				if v25.Material then
					v17.Material = v25.Material
				end
			end
		end
	end
end
local function v_u_30(p27)
	local v28 = p27
	while p27 and p27 ~= game do
		if p27:IsA("Tool") then
			local v29 = p27:GetAttribute("PET_UUID")
			if typeof(v29) == "string" and #v29 > 0 then
				return v29
			end
			break
		end
		p27 = p27.Parent
	end
	return v28.Name
end
local function v_u_42(p31)
	-- upvalues: (copy) v_u_2, (ref) v_u_3, (copy) v_u_1, (copy) v_u_30, (copy) v_u_26
	if v_u_2:HasTag(p31, "ChubbyChipmunkVariantColored") then
		return
	else
		if #v_u_3 == 0 then
			local v32 = require(v_u_1.Modules.SelectiveAssetReplication):GetAssetAsync("Skins", "Chubby Chipmunk Variants"):GetChildren()
			table.sort(v32, function(p33, p34)
				local v35 = p33.Name
				local v36 = tostring(v35)
				local v37 = p34.Name
				return v36 < tostring(v37)
			end)
			v_u_3 = v32
		end
		if #v_u_3 == 0 then
			warn("No Chubby Chipmunk variants found")
			return
		else
			local v38 = v_u_30(p31)
			if v38 and #v38 ~= 0 then
				local v39 = v_u_3
				local v40 = 0
				for v41 = 1, #v38 do
					v40 = (v40 * 31 + string.byte(v38, v41)) % 10000007
				end
				v_u_26(p31, v39[v40 % #v39 + 1])
				v_u_2:AddTag(p31, "ChubbyChipmunkVariantColored")
			end
		end
	end
end
for _, v43 in v_u_2:GetTagged("ChubbyChipmunkVariant") do
	if v43:IsA("Model") then
		v_u_42(v43)
	end
end
v_u_2:GetInstanceAddedSignal("ChubbyChipmunkVariant"):Connect(function(p44)
	-- upvalues: (copy) v_u_42
	if p44:IsA("Model") then
		v_u_42(p44)
	end
end)