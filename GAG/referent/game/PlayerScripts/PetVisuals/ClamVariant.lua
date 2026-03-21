local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = nil
local v_u_4 = nil
local function v_u_6()
	-- upvalues: (copy) v_u_1, (ref) v_u_3, (ref) v_u_4
	for _, v5 in require(v_u_1.Modules.SelectiveAssetReplication):GetAssetAsync("Skins", "Clam Variants"):GetChildren() do
		if v5:IsA("Model") then
			if v5.Name == "Clam White Pearl" then
				v_u_3 = v5
			elseif v5.Name == "Clam Black Pearl" then
				v_u_4 = v5
			end
		end
	end
	if not v_u_3 then
		warn("Clam: Missing Clam White Pearl variant")
	end
	if not v_u_4 then
		warn("Clam: Missing Clam Black Pearl variant")
	end
end
local function v_u_13(p7, p8)
	for _, v9 in p7:GetDescendants() do
		if v9:IsA("BasePart") then
			local v10 = p8:FindFirstChild(v9.Name, true)
			if v10 and v10:IsA("BasePart") then
				v9.Color = v10.Color
				v9.Material = v10.Material
				for _, v11 in v9:GetChildren() do
					if v11:IsA("Decal") then
						local v12 = v10:FindFirstChild(v11.Name)
						if v12 and v12:IsA("Decal") then
							v11.Color3 = v12.Color3
						end
					end
				end
			end
		end
	end
end
local function v_u_17(p14)
	if p14.Name == "Clam" and (p14.Parent and p14.Parent.Parent) then
		local v15 = p14.Parent.Parent
		if v15:IsA("Tool") then
			local v16 = v15:GetAttribute("PET_UUID")
			if typeof(v16) == "string" and #v16 > 0 then
				return v16
			end
		end
	end
	return p14.Name
end
local function v_u_24(p18)
	-- upvalues: (copy) v_u_2, (copy) v_u_17, (ref) v_u_3, (ref) v_u_4, (copy) v_u_6, (copy) v_u_13
	if v_u_2:HasTag(p18, "ClamVariantColored") then
		return
	else
		local v19 = v_u_17(p18)
		if v19 then
			local v20 = 0
			for v21 = 1, #v19 do
				v20 = (v20 * 31 + string.byte(v19, v21)) % 10000007
			end
			local v22 = v20 % 1000 == 0
			local v23 = v20 % 10000 == 0
			if not (v_u_3 and v_u_4) then
				v_u_6()
			end
			if v23 and v_u_4 then
				v_u_13(p18, v_u_4)
			elseif v22 and v_u_3 then
				v_u_13(p18, v_u_3)
			end
			v_u_2:AddTag(p18, "ClamVariantColored")
		end
	end
end
for _, v25 in v_u_2:GetTagged("ClamVariant") do
	if typeof(v25) == "Instance" and v25:IsA("Model") then
		v_u_24(v25)
	end
end
v_u_2:GetInstanceAddedSignal("ClamVariant"):Connect(function(p26)
	-- upvalues: (copy) v_u_24
	if typeof(p26) == "Instance" and p26:IsA("Model") then
		v_u_24(p26)
	end
end)