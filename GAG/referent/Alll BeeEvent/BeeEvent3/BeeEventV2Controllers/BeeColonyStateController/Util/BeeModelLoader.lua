local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = v_u_1.Assets.Animations.PetAnimations
local v_u_4 = v_u_1.Assets.Models.BeeModels
local v_u_5 = require(v_u_1.Data.BeeEvent.BeeRegistry)
return function(p6, _) -- name: LoadBeeModel
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
	if p6.Client.Model then
		return
	else
		local v7 = p6.Server.BeeName or "Bee"
		local v8 = v_u_4:FindFirstChild(v7) or v_u_4:FindFirstChild("Bee")
		if v8 then
			local v9 = v8:Clone()
			local v10 = p6.Client.Hitbox
			if v10 then
				for _, v11 in v9:GetDescendants() do
					if v11:IsA("BasePart") then
						v11.CanCollide = false
						v11.CanQuery = true
						v11.Anchored = false
						if p6.Server.IsIllusion then
							v11.Color = v11.Color:Lerp(Color3.fromRGB(212, 212, 212), 0.6)
							v11.Transparency = 0.25
							v11.Material = Enum.Material.SmoothPlastic
						end
					end
				end
				local v12 = v9.PrimaryPart
				if v12 then
					local v13 = Instance.new("Weld")
					v13.Part0 = v10
					v13.Part1 = v12
					v13.C0 = CFrame.Angles(0, 1.5707963267948966, -3.141592653589793)
					v13.C1 = CFrame.identity
					v13.Parent = v12
					v9.Parent = v10
					v10.Transparency = 1
					p6.Client.IsSpawning = true
					p6.Client.SpawnElapsed = nil
					p6.Client.Model = v9
					local v14 = v9:FindFirstChildOfClass("AnimationController")
					if v14 then
						local v15 = v14:FindFirstChildOfClass("Animator")
						if v15 then
							local v16
							if v_u_5[v7].IdleAnimation then
								v16 = Instance.new("Animation")
								v16.AnimationId = v_u_5[v7].IdleAnimation
							else
								local v17 = v_u_3:FindFirstChild("Bee")
								if not v17 then
									return
								end
								v16 = v17:FindFirstChild("Idle")
							end
							local v18 = v15:LoadAnimation(v16)
							v18.Looped = true
							v18:Play()
							p6.Client.IdleAnimation = v18
							if v_u_5[v7].AttackAnimation then
								local v19 = Instance.new("Animation")
								v19.AnimationId = v_u_5[v7].AttackAnimation
								local v20 = v15:LoadAnimation(v19)
								p6.Client.AttackAnimation = v20
							end
							if v_u_5[v7].DamagedAnimation then
								local v21 = Instance.new("Animation")
								v21.AnimationId = v_u_5[v7].DamagedAnimation
								local v22 = v15:LoadAnimation(v21)
								p6.Client.DamagedAnimation = v22
							end
							if v7 ~= "Wasp King" and v7 ~= "Skeleton Bee" then
								local v23 = v_u_1.BeeHealthbar:Clone()
								v23.Adornee = v12
								v23.Enabled = false
								v23.Parent = v_u_2.LocalPlayer.PlayerGui
								p6.Client.HealthBar = v23
								local v24 = {}
								for v25 = 1, 4 do
									local v26 = v23:FindFirstChild((tostring(v25)))
									if v26 then
										v26 = v26:FindFirstChild("Heart")
									end
									if v26 then
										v26 = v26:FindFirstChildOfClass("UIGradient")
									end
									v24[v25] = v26 and v26.Rotation or 0
								end
								p6.Client.HeartBaseRotations = v24
							end
						end
					else
						return
					end
				else
					v9:Destroy()
					return
				end
			else
				v9:Destroy()
				return
			end
		else
			return
		end
	end
end