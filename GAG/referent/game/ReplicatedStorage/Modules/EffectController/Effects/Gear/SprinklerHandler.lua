local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GetFarm)
require(v1.Modules.EffectController.Types)
local v4 = require(v1.Data.SprinklerData)
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = require(v5.Modules.SoundPlayer)
local v_u_7 = require(v5.Data.SoundData)
local v_u_8 = v4.SprinklerOffsets
return {
	["Create"] = function(p_u_9)
		-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
		local v_u_10 = p_u_9.Parameters.ID
		p_u_9.Cache[v_u_10] = {}
		local v_u_11 = p_u_9.Parameters.SprinklerType
		local v_u_12 = p_u_9.Parameters.SprinklerCFrame
		local v13 = p_u_9.Parameters.OWNER
		if not v13 then
			return
		end
		local v14 = v_u_2:FindFirstChild(v13)
		if not v14 then
			return
		end
		local v15 = v_u_3(v14)
		if not v15 then
			return
		end
		local v16 = v15:FindFirstChild("Important")
		if v16 then
			v16 = v16:FindFirstChild("Objects_Physical")
		end
		if not v16 then
			return
		end
		local v_u_17 = Instance.new("Part")
		v_u_17.Name = "SprinklerAnchor"
		v_u_17.Size = Vector3.new(0.5, 0.5, 0.5)
		v_u_17.CFrame = v_u_12 * CFrame.new(0, 1, 0)
		v_u_17.Anchored = true
		v_u_17.CanCollide = false
		v_u_17.CanTouch = false
		v_u_17.CanQuery = false
		v_u_17.Transparency = 1
		v_u_17.Massless = false
		v_u_17.Parent = workspace.Visuals
		local v18 = p_u_9.Parameters.OBJECT_UUID
		for _, v19 in v16:GetChildren() do
			if v19:GetAttribute("OBJECT_UUID") == v18 then
				v19.Destroying:Connect(function()
					-- upvalues: (copy) v_u_17
					v_u_17:Destroy()
				end)
				break
			end
		end
		local v20 = p_u_9.Default:CreateEffect({
			["Object"] = script.PlaceEffect,
			["Emit"] = true,
			["Position"] = v_u_12 * CFrame.Angles(0, 3.141592653589793, 3.141592653589793),
			["DebrisTime"] = 2
		})
		local v21 = {
			["RollOffMaxDistance"] = 50,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.InverseTapered,
			["Volume"] = 0.5,
			["PlaybackSpeed"] = 1
		}
		v_u_6:PlaySound(v_u_7.Gears.SprinklerHandler.PlaceSFX, v21, nil, v20)
		local v22 = p_u_9.Libraries.BoatTween
		local v23 = {
			["Time"] = 0.8,
			["EasingStyle"] = "Smoother",
			["EasingDirection"] = "In",
			["StepType"] = "Heartbeat",
			["Goal"] = {
				["CFrame"] = v_u_12 * v_u_8[v_u_11]
			}
		}
		v22:Create(v_u_17, v23):Play()
		task.delay(0.2, function()
			-- upvalues: (copy) p_u_9, (copy) v_u_11, (copy) v_u_17, (copy) v_u_12, (ref) v_u_6, (ref) v_u_7, (copy) v_u_10
			local v24 = p_u_9.Default:CreateEffect({
				["Object"] = script[string.format("%s VFX", v_u_11)],
				["Parent"] = v_u_17,
				["Position"] = v_u_12
			})
			local v25 = {
				["RollOffMaxDistance"] = 50,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.InverseTapered,
				["Volume"] = 0.5,
				["PlaybackSpeed"] = 1,
				["Looped"] = true
			}
			v_u_6:PlaySound(v_u_7.Gears.SprinklerHandler.SprinklerLoop, v25, nil, v24)
			p_u_9.Cache[v_u_10].SprinklerEffect = v24
		end)
		p_u_9.Cache[v_u_10].Sprinkler = v_u_17
	end,
	["Destroy"] = function(p26)
		local v27 = p26.Parameters.ID
		local v28 = p26.Cache[v27]
		if v28 and typeof(v28) == "table" then
			local v_u_29 = v28.Sprinkler
			if v_u_29 then
				local v30 = v28.SprinklerEffect
				if v30 then
					p26.Default:UpdateStatus(v30, false, {})
					local v31 = p26.Libraries.BoatTween
					local v32 = {
						["Time"] = 0.6,
						["EasingStyle"] = "ExitExpressive",
						["EasingDirection"] = "In",
						["StepType"] = "Heartbeat",
						["Goal"] = {
							["CFrame"] = p26.Parameters.SprinklerCFrame * CFrame.new(0, 3, 0)
						}
					}
					v31:Create(v_u_29, v32):Play()
					task.delay(0.6, function()
						-- upvalues: (copy) v_u_29
						if v_u_29 then
							v_u_29:Destroy()
						end
					end)
				end
			else
				return
			end
		else
			return
		end
	end,
	["Cancel"] = function(p33)
		p33.Container:Clean()
		p33.Cache = {}
	end
}