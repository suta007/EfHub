local v1 = game:GetService("Players")
local v2 = game:GetService("CollectionService")
local v_u_3 = v1.LocalPlayer
local function v_u_7(p4)
	-- upvalues: (copy) v_u_3
	if p4 and p4:IsDescendantOf(workspace) then
		local v5 = p4:GetAttribute("OWNER")
		if v5 and v5 == v_u_3.UserId then
			for _, v6 in p4:GetDescendants() do
				if v6:IsA("BasePart") then
					v6.Transparency = 0
				end
			end
		end
	else
		return
	end
end
v2:GetInstanceAddedSignal("AcornReward"):Connect(function(p8)
	-- upvalues: (copy) v_u_7
	v_u_7(p8)
end)
for _, v9 in v2:GetTagged("AcornReward") do
	v_u_7(v9)
end