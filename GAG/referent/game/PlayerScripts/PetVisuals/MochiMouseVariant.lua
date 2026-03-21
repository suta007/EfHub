local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = {}
local v_u_4 = nil
local function v_u_8()
	-- upvalues: (copy) v_u_1, (ref) v_u_4, (ref) v_u_3
	local v5 = require(v_u_1.Modules.SelectiveAssetReplication):GetAssetAsync("Skins", "Mochi Mouse Variants")
	for _, v6 in ipairs(v5:GetChildren()) do
		if v6 ~= v_u_4 then
			local v7 = v_u_3
			table.insert(v7, v6)
		end
	end
	v_u_3 = v5:GetChildren()
	v_u_4 = v5:FindFirstChild("Mochi Mouse Rainbow")
end
local function v_u_15(p9, p10)
	for _, v11 in p9:GetDescendants() do
		if v11:IsA("BasePart") then
			local v12 = p10:FindFirstChild(v11.Name, true)
			if v12 and v12:IsA("BasePart") then
				v11.Color = v12.Color
				v11.Material = v12.Material
				for _, v13 in v11:GetChildren() do
					if v13:IsA("Decal") then
						local v14 = v12:FindFirstChild(v13.Name)
						if v14 and v14:IsA("Decal") then
							v13.Color3 = v14.Color3
						end
					end
				end
			end
		end
	end
end
local function v_u_22(p16, p17)
	-- upvalues: (ref) v_u_4, (copy) v_u_15
	local v18 = 0
	for v19 = 1, #p17 do
		v18 = (v18 * 31 + string.byte(p17, v19)) % 10000000
	end
	if v_u_4 and v18 % 100000 == 0 then
		v_u_15(p16, v_u_4)
		return
	elseif v18 % 1000000 == 0 then
		for _, v20 in p16:GetDescendants() do
			if v20:IsA("BasePart") then
				v20.Transparency = 0.5
				v20.Material = Enum.Material.ForceField
			end
		end
	else
		local v21 = v18 % 1000000 == 1 and (p16.PrimaryPart or p16:FindFirstChildWhichIsA("BasePart"))
		if v21 then
			p16:PivotTo(v21.CFrame)
			p16:ScaleTo(3)
		end
	end
end
local function v_u_29(p23)
	-- upvalues: (copy) v_u_2, (ref) v_u_3, (ref) v_u_4, (copy) v_u_8, (copy) v_u_15, (copy) v_u_22
	if v_u_2:HasTag(p23, "MochiMouseVariantColored") then
		return
	end
	if p23.Name == "Mochi Mouse" and (p23.Parent and p23.Parent.Parent) then
		local v24 = p23.Parent.Parent
		if v24:IsA("Tool") then
			v28 = v24:GetAttribute("PET_UUID")
			if typeof(v28) == "string" then
				::l9::
				if v28 then
					if #v_u_3 == 0 or not v_u_4 then
						v_u_8()
					end
					if #v_u_3 == 0 then
						warn("No mochi mouse variants found in folder")
					else
						local v25 = v_u_3
						local v26 = 0
						for v27 = 1, #v28 do
							v26 = v26 + string.byte(v28, v27)
						end
						v_u_15(p23, v25[v26 % #v25 + 1])
						v_u_22(p23, v28)
						v_u_2:AddTag(p23, "MochiMouseVariantColored")
					end
				else
					return
				end
			end
		end
	end
	local v28 = p23.Name
	goto l9
end
for _, v30 in v_u_2:GetTagged("MochiMouseVariant") do
	v_u_29(v30)
end
v_u_2:GetInstanceAddedSignal("MochiMouseVariant"):Connect(function(p31)
	-- upvalues: (copy) v_u_29
	if typeof(p31) == "Instance" and p31:IsA("Model") then
		v_u_29(p31)
	end
end)