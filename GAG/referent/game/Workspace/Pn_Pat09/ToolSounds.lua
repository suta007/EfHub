local v1 = game.Players.LocalPlayer.Character
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("SoundService")
local v_u_4 = require(v2.Modules.SoundPlayer)
local v_u_5 = require(v2.Data.SoundData)
local v_u_6 = require(v2.Data.SoundData.SoundServiceData)
local v_u_7 = {}
local v_u_8 = os.clock()
local v_u_9 = v1:FindFirstChild("Animator", true):LoadAnimation(script.TwoHandedFruitAnimation)
local function v_u_14(p10, p11)
	-- upvalues: (ref) v_u_8
	v_u_8 = os.clock()
	local v12 = p10:Clone()
	local v_u_13 = Instance.new("Part")
	v_u_13.Parent = workspace
	v_u_13.CanCollide = false
	v_u_13.CanQuery = false
	v_u_13.Anchored = true
	v_u_13.Position = p11.Position
	v_u_13.Transparency = 1
	v12.Parent = v_u_13
	v12:Play()
	v12.Ended:Once(function()
		-- upvalues: (copy) v_u_13
		v_u_13:Destroy()
	end)
	game.Debris:AddItem(v_u_13, v12.TimeLength)
end
v1.ChildAdded:Connect(function(p_u_15)
	-- upvalues: (copy) v_u_9, (copy) v_u_14, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7
	if p_u_15:IsA("Tool") then
		local v_u_16 = p_u_15:WaitForChild("Handle", 10)
		if v_u_16 then
			v_u_7[p_u_15] = { p_u_15.Equipped:Connect(function()
					-- upvalues: (copy) v_u_16, (copy) p_u_15, (ref) v_u_9, (ref) v_u_14, (ref) v_u_4, (ref) v_u_5
					local v17 = v_u_16:FindFirstChild("Equip")
					if p_u_15:HasTag("TwoHandedFruit") then
						v_u_9:Play()
					end
					if v17 then
						v_u_14(v17, v_u_16)
					else
						v_u_4:PlaySound(v_u_5.Tools.Generic.Equip)
					end
				end), (p_u_15.Unequipped:Connect(function()
					-- upvalues: (copy) v_u_16, (copy) p_u_15, (ref) v_u_9, (ref) v_u_14, (ref) v_u_4, (ref) v_u_5
					local v18 = v_u_16:FindFirstChild("Unequip")
					if p_u_15:HasTag("TwoHandedFruit") then
						v_u_9:Stop()
					end
					if v18 then
						v_u_14(v18, v_u_16)
					else
						v_u_4:PlaySound(v_u_5.Tools.Generic.Unequip)
					end
				end)) }
		end
	else
		return
	end
end)
v1.ChildRemoved:Connect(function(p19)
	-- upvalues: (copy) v_u_7, (copy) v_u_9
	if p19:IsA("Tool") then
		if v_u_7[p19] then
			for _, v20 in v_u_7[p19] do
				v20:Disconnect()
			end
			if p19:HasTag("TwoHandedFruit") then
				v_u_9:Stop()
			end
		end
	end
end)
v2.GameEvents.PlaySound.OnClientEvent:Connect(function(p21)
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v22 = v_u_6[p21]
	if v22 then
		v_u_4:PlaySound(v22.Id, v22.SoundProperties, nil, nil, v22.Tags, v22.Effects)
		return
	else
		local v23 = v_u_3:FindFirstChild(p21, true)
		if v23 then
			v23:Play()
		end
	end
end)
local function v28(p24, p25)
	-- upvalues: (copy) v_u_3
	local v26 = v_u_3:FindFirstChild(p24, true)
	if v26 then
		local v27 = v26:Clone()
		if p25 then
			v27.Parent = p25
		else
			v27.Parent = workspace
		end
		v27:Play()
		game.Debris:AddItem(v27, 5)
	end
end
v2.GameEvents.PickupEvent.Event:Connect(v28)
v2.GameEvents.PickupSound.OnClientEvent:Connect(v28)