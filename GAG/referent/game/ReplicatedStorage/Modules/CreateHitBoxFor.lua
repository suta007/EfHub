local v_u_1 = {
	["Properties"] = {
		["Name"] = "HitBox",
		["CanCollide"] = false,
		["CanQuery"] = true,
		["Transparency"] = 1,
		["Anchored"] = true,
		["Color"] = Color3.fromRGB(255, 0, 0)
	},
	["Tags"] = { "CosmeticHitBox" }
}
local v_u_2 = v_u_1.Properties.Name
local function v_u_36(p3)
	-- upvalues: (copy) v_u_2
	if p3:IsA("Model") then
		local v4 = Vector3.new(1, 1, 1) * (1 / 0)
		local v5 = -v4
		local v6 = 0
		local v7 = p3:GetDescendants()
		if #v7 ~= 0 then
			for _, v8 in v7 do
				if v8:IsA("BasePart") and v8.Name ~= v_u_2 then
					local v9 = v8.CFrame
					local v10 = v8.Size
					local v11 = v10.X / 2
					local v12 = v10.Y / 2
					local v13 = v10.Z / 2
					local v14 = -v11
					local v15 = -v12
					local v16 = -v13
					for _, v17 in {
						v9 * Vector3.new(v14, v15, v16),
						v9 * Vector3.new(v11, v15, v16),
						v9 * Vector3.new(v14, v12, v16),
						v9 * Vector3.new(v11, v12, v16),
						v9 * Vector3.new(v14, v15, v13),
						v9 * Vector3.new(v11, v15, v13),
						v9 * Vector3.new(v14, v12, v13),
						v9 * Vector3.new(v11, v12, v13)
					} do
						local v18 = v4.X
						local v19 = v17.X
						local v20 = math.min(v18, v19)
						local v21 = v4.Y
						local v22 = v17.Y
						local v23 = math.min(v21, v22)
						local v24 = v4.Z
						local v25 = v17.Z
						local v26 = math.min(v24, v25)
						v4 = Vector3.new(v20, v23, v26)
						local v27 = v5.X
						local v28 = v17.X
						local v29 = math.max(v27, v28)
						local v30 = v5.Y
						local v31 = v17.Y
						local v32 = math.max(v30, v31)
						local v33 = v5.Z
						local v34 = v17.Z
						local v35 = math.max(v33, v34)
						v5 = Vector3.new(v29, v32, v35)
					end
					v6 = v6 + 1
				end
			end
			if v6 ~= 0 then
				return v4, v5
			end
		end
	else
		warn("Expected a Model, got:", p3)
		return
	end
end
return function(p37)
	-- upvalues: (copy) v_u_36, (copy) v_u_2, (copy) v_u_1
	if p37:IsA("Model") then
		local v38 = p37:FindFirstChild("HitBox") or p37:FindFirstChild("Hitbox")
		local v39, v40 = v_u_36(p37)
		if v39 then
			local v41 = (v39 + v40) / 2
			local v42 = v40 - v39
			local v43 = v38 or Instance.new("Part")
			v43.Name = v_u_2
			v43.Size = v42
			v43.CFrame = CFrame.new(v41)
			for v44, v45 in v_u_1.Properties do
				v43[v44] = v45
			end
			for _, v46 in v_u_1.Tags do
				v43:AddTag(v46)
			end
			v43.Parent = p37
			p37.PrimaryPart = v43
			return v43
		end
		warn("No valid parts found in model:", p37.Name)
	else
		warn("Expected a Model, got:", p37)
	end
end