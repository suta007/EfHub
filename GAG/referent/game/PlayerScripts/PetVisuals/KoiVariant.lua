local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = {}
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
local function v_u_17(p11, p12)
	local v13 = 0
	for v14 = 1, #p12 do
		v13 = (v13 * 31 + string.byte(p12, v14)) % 10000000
	end
	if v13 % 1000000 == 0 then
		for _, v15 in p11:GetDescendants() do
			if v15:IsA("BasePart") then
				v15.Transparency = 0.5
				v15.Material = "ForceField"
			end
		end
	else
		local v16 = v13 % 1000000 == 1 and (p11.PrimaryPart or p11:FindFirstChildWhichIsA("BasePart"))
		if v16 then
			p11:PivotTo(v16.CFrame)
			p11:ScaleTo(3)
		end
	end
end
local function v_u_24(p18)
	-- upvalues: (copy) v_u_2, (ref) v_u_3, (copy) v_u_1, (copy) v_u_10, (copy) v_u_17
	if v_u_2:HasTag(p18, "KoiVariantColored") then
		return
	end
	if p18.Name == "Koi" and (p18.Parent and p18.Parent.Parent) then
		local v19 = p18.Parent.Parent
		if v19:IsA("Tool") then
			v23 = v19:GetAttribute("PET_UUID")
			if typeof(v23) == "string" then
				::l9::
				if v23 then
					if #v_u_3 == 0 then
						v_u_3 = require(v_u_1.Modules.SelectiveAssetReplication):GetAssetAsync("Skins", "Koi Variants"):GetChildren()
					end
					if #v_u_3 == 0 then
						warn("No koi variants found in folder")
					else
						local v20 = v_u_3
						local v21 = 0
						for v22 = 1, #v23 do
							v21 = v21 + string.byte(v23, v22)
						end
						v_u_10(p18, v20[v21 % #v20 + 1])
						v_u_17(p18, v23)
						v_u_2:AddTag(p18, "KoiVariantColored")
					end
				else
					return
				end
			end
		end
	end
	local v23 = p18.Name
	goto l9
end
for _, v25 in v_u_2:GetTagged("KoiVariant") do
	v_u_24(v25)
end
v_u_2:GetInstanceAddedSignal("KoiVariant"):Connect(function(p26)
	-- upvalues: (copy) v_u_24
	if typeof(p26) == "Instance" and p26:IsA("Model") then
		v_u_24(p26)
	end
end)