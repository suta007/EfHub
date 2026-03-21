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
local function v_u_17(p11)
	-- upvalues: (copy) v_u_2, (ref) v_u_3, (copy) v_u_1, (copy) v_u_10
	if v_u_2:HasTag(p11, "GlimmeringSpriteVariantColored") then
		return
	end
	if p11.Name == "Glimmering Sprite" and (p11.Parent and p11.Parent.Parent) then
		local v12 = p11.Parent.Parent
		if v12:IsA("Tool") then
			v16 = v12:GetAttribute("PET_UUID")
			if typeof(v16) == "string" then
				::l9::
				if v16 then
					if #v_u_3 == 0 then
						v_u_3 = require(v_u_1.Modules.SelectiveAssetReplication):GetAssetAsync("Skins", "Glimmering Sprite Variants"):GetChildren()
					end
					if #v_u_3 == 0 then
						warn("No Glimmering Sprite variants found in folder")
					else
						local v13 = v_u_3
						local v14 = 0
						for v15 = 1, #v16 do
							v14 = v14 + string.byte(v16, v15)
						end
						v_u_10(p11, v13[v14 % #v13 + 1])
						v_u_2:AddTag(p11, "GlimmeringSpriteVariantColored")
					end
				else
					return
				end
			end
		end
	end
	local v16 = p11.Name
	goto l9
end
for _, v18 in v_u_2:GetTagged("GlimmeringSpriteVariant") do
	if typeof(v18) == "Instance" and v18:IsA("Model") then
		v_u_17(v18)
	end
end
v_u_2:GetInstanceAddedSignal("GlimmeringSpriteVariant"):Connect(function(p19)
	-- upvalues: (copy) v_u_17
	if typeof(p19) == "Instance" and p19:IsA("Model") then
		v_u_17(p19)
	end
end)