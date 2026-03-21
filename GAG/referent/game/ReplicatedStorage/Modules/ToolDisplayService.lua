game:GetService("ReplicatedStorage")
game:GetService("Players")
local v1 = {}
local function v_u_7(p2)
	local v3 = Instance.new("Model")
	for _, v4 in p2:GetDescendants() do
		if v4:IsA("BasePart") or (v4:IsA("MeshPart") or v4:IsA("UnionOperation")) then
			local v5 = v4:Clone()
			for _, v6 in ipairs(v5:GetChildren()) do
				if not (v6:IsA("BasePart") or (v6:IsA("MeshPart") or v6:IsA("UnionOperation"))) then
					v6:Destroy()
				end
			end
			v5.Anchored = true
			v5.CanCollide = false
			v5.CanTouch = false
			v5.CanQuery = false
			v5.Parent = v3
		end
	end
	return v3
end
function v1.DisplayToolModel(_, p8, p9)
	-- upvalues: (copy) v_u_7
	local v10
	if p8 then
		v10 = p8:IsA("Tool")
	else
		v10 = p8
	end
	assert(v10, "Invalid Tool")
	local v11 = typeof(p9) == "CFrame"
	assert(v11, "Invalid Position")
	local v12 = ("Display_%*_%*"):format(p8.Name, (tick()))
	local v13 = v_u_7(p8)
	v13.Name = v12
	local v14 = v13:FindFirstChild("Handle") or v13:FindFirstChildWhichIsA("BasePart")
	if v14 then
		v13.PrimaryPart = v14
		local _, v15 = v13:GetBoundingBox()
		local v16 = v15.Y / 2 + 0.2
		v13:SetPrimaryPartCFrame(p9 + Vector3.new(0, v16, 0))
	else
		v13:Destroy()
	end
end
function v1.PreviewCloneModel(_, p17)
	-- upvalues: (copy) v_u_7
	if p17 and p17:IsA("Tool") then
		local v18 = v_u_7(p17)
		if #v18:GetChildren() == 0 then
			v18:Destroy()
			return nil
		else
			v18.Parent = workspace
			return v18
		end
	else
		return
	end
end
return v1