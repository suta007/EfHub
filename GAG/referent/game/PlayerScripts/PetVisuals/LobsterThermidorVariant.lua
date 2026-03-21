local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = nil
local function v_u_10(p4, p5)
	for _, v6 in p4:GetDescendants() do
		if v6:IsA("BasePart") then
			local v7 = p5:FindFirstChild(v6.Name, true)
			if v7 and v7:IsA("BasePart") then
				v6.Color = v7.Color
				v6.Material = v7.Material
				for _, v8 in v6:GetChildren() do
					if v8:IsA("Decal") then
						local v9 = v7:FindFirstChild(v8.Name)
						if v9 and v9:IsA("Decal") then
							v8.Color3 = v9.Color3
						end
					end
				end
			end
		end
	end
end
local function v_u_14(p11)
	if p11.Name == "Lobster Thermidor" and (p11.Parent and p11.Parent.Parent) then
		local v12 = p11.Parent.Parent
		if v12:IsA("Tool") then
			local v13 = v12:GetAttribute("PET_UUID")
			if typeof(v13) == "string" and #v13 > 0 then
				return v13
			end
		end
	end
	return p11.Name
end
local function v_u_20(p15)
	-- upvalues: (copy) v_u_2, (copy) v_u_14, (ref) v_u_3, (copy) v_u_1, (copy) v_u_10
	if v_u_2:HasTag(p15, "LobsterThermidorVariantColored") then
		return
	else
		local v16 = v_u_14(p15)
		if v16 then
			local v17 = 0
			for v18 = 1, #v16 do
				v17 = (v17 * 31 + string.byte(v16, v18)) % 10000007
			end
			local v19 = v17 % 10000 == 0
			v_u_3 = (not v19 or v_u_3) and true or false or require(v_u_1.Modules.SelectiveAssetReplication):GetAssetAsync("Skins", "Lobster Thermidor Variants"):GetChildren()[1]
			if not v_u_3 then
				warn("Lobster Thermidor: No special variant found in \'Lobster Thermidor Variants\'")
			end
			if v19 and v_u_3 then
				v_u_10(p15, v_u_3)
			end
			v_u_2:AddTag(p15, "LobsterThermidorVariantColored")
		end
	end
end
for _, v21 in v_u_2:GetTagged("LobsterThermidorVariant") do
	if typeof(v21) == "Instance" and v21:IsA("Model") then
		v_u_20(v21)
	end
end
v_u_2:GetInstanceAddedSignal("LobsterThermidorVariant"):Connect(function(p22)
	-- upvalues: (copy) v_u_20
	if typeof(p22) == "Instance" and p22:IsA("Model") then
		v_u_20(p22)
	end
end)