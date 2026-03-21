local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = {}
local function v_u_14(p4, p5)
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
				for _, v10 in v6:GetDescendants() do
					if v10:IsA("ParticleEmitter") then
						local v11 = v7:FindFirstChild(v10.Name, true)
						if v11 and v11:IsA("ParticleEmitter") then
							v10.Color = v11.Color
						end
					end
				end
				for _, v12 in v6:GetDescendants() do
					if v12:IsA("Trail") then
						local v13 = v7:FindFirstChild(v12.Name, true)
						if v13 and v13:IsA("Trail") then
							v12.Color = v13.Color
							v12.Transparency = v13.Transparency
						end
					end
				end
			end
		end
	end
end
local function v_u_24(p15)
	-- upvalues: (copy) v_u_2, (ref) v_u_3, (copy) v_u_1, (copy) v_u_14
	if v_u_2:HasTag(p15, "WispVariantColored") then
		return
	end
	if p15.Name == "Wisp" and (p15.Parent and p15.Parent.Parent) then
		local v16 = p15.Parent.Parent
		if v16:IsA("Tool") then
			v23 = v16:GetAttribute("PET_UUID")
			if typeof(v23) == "string" then
				::l9::
				if v23 then
					if #v_u_3 == 0 then
						v_u_3 = require(v_u_1.Modules.SelectiveAssetReplication):GetAssetAsync("Skins", "Wisp Variants"):GetChildren()
					end
					if #v_u_3 == 0 then
						warn("No Wisp variants found in folder")
					else
						local v17 = v_u_3
						local v18 = 0
						for v19 = 1, #v23 do
							v18 = v18 + string.byte(v23, v19)
						end
						local v20 = v17[v18 % #v17 + 1]
						local v21 = p15:GetAttribute("VariantType")
						if v21 then
							for _, v22 in v_u_3 do
								if string.match(v22.Name, v21) then
									v20 = v22
								end
							end
						end
						v_u_14(p15, v20)
						v_u_2:AddTag(p15, "WispVariantColored")
					end
				else
					return
				end
			end
		end
	end
	local v23 = p15.Name
	goto l9
end
for _, v25 in v_u_2:GetTagged("WispVariant") do
	if typeof(v25) == "Instance" and v25:IsA("Model") then
		v_u_24(v25)
	end
end
v_u_2:GetInstanceAddedSignal("WispVariant"):Connect(function(p26)
	-- upvalues: (copy) v_u_24
	if typeof(p26) == "Instance" and p26:IsA("Model") then
		v_u_24(p26)
	end
end)