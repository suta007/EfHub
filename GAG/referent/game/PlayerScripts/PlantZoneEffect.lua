local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(v2.Modules.PetServices.ActivePetsService)
require(v2.Modules.PetServices.PetUtilities)
local v_u_5 = require(v2.Data.PetRegistry).PetList
local v6 = v2.GameEvents.PetZoneAbility
local v_u_7 = v1.LocalPlayer
local v_u_8 = {}
v6.OnClientEvent:Connect(function(p_u_9, p10, p11, p12, p_u_13)
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_8, (copy) v_u_3
	local _ = v_u_4:GetClientPetState(v_u_7.Name)[p_u_9]
	local v14 = v_u_4:GetPetData(v_u_7.Name, p_u_9)
	if v14 then
		local v15 = v_u_5[v14.PetType]
		if p12 then
			local _ = v15.Passives
			if not v_u_8[p_u_9] then
				v_u_8[p_u_9] = {}
			end
			if p10 then
				if p11 and p_u_13 then
					local v16 = script.Zone:Clone()
					v16.Parent = p12
					v16:PivotTo(CFrame.new(p12:GetPivot().Position.X, 0.145, p12:GetPivot().Position.Z))
					v16.Size = Vector3.new(0, 0, 0)
					v_u_3:Create(v16, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						["Size"] = Vector3.new(p11, 0.1, p11)
					}):Play()
					local v17 = Instance.new("WeldConstraint")
					v17.Part0 = p12.PrimaryPart
					v17.Part1 = v16
					v17.Parent = v16
					if not v_u_8[p_u_9] then
						v_u_8[p_u_9] = {}
					end
					v_u_8[p_u_9][p_u_13] = v16
				end
			elseif p_u_13 and v_u_8[p_u_9] then
				local v_u_18 = v_u_8[p_u_9][p_u_13]
				if v_u_18 then
					local v19 = v_u_3:Create(v_u_18, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						["Size"] = Vector3.new(0, 0, 0)
					})
					v19:Play()
					v19.Completed:Once(function()
						-- upvalues: (copy) v_u_18, (ref) v_u_8, (copy) p_u_9, (copy) p_u_13
						if v_u_18 then
							local v20 = v_u_18:FindFirstChildOfClass("WeldConstraint")
							if v20 then
								v20:Destroy()
							end
							v_u_18:Destroy()
						end
						v_u_8[p_u_9][p_u_13] = nil
					end)
				end
			else
				return
			end
		else
			return
		end
	else
		return
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_8
	while true do
		for _, v21 in v_u_8 do
			for v22, v23 in v21 do
				if v23 == nil or typeof(v23) ~= "Instance" then
					v21[v22] = nil
				else
					local v24 = v23:FindFirstChild("OuterRange")
					if v24 then
						local v25 = v24.Image
						v25.Rotation = v25.Rotation + 0.3
					else
						v21[v22] = nil
					end
				end
			end
		end
		task.wait(0.01)
	end
end)