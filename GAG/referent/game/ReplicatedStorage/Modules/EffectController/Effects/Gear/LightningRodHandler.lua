local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = require(v_u_1.Modules.SoundPlayer)
local v_u_4 = require(v_u_1.Data.SoundData)
require(v_u_1.Modules.EffectController.Types)
return {
	["Create"] = function(p5)
		-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
		local v6 = p5.Parameters.ID
		local _ = p5.Parameters.Redirects
		p5.Cache[v6] = {}
		local v7 = p5.Parameters.LightningRodType
		local v8 = p5.Parameters.LightningRodCFrame
		local v9 = v_u_1.ObjectModels:FindFirstChild(v7)
		if v9 then
			local v10 = v9:Clone()
			if v9 then
				v_u_2:AddTag(v10, "LightningRod")
				v10:SetAttribute("ROD_ID", v6)
				for _, v11 in v10:GetDescendants() do
					if v11:IsA("BasePart") then
						v11.CanQuery = true
						v11.CanCollide = true
					end
				end
				p5.Cache[v6].Rod = v10
				local _, v12 = v10:GetBoundingBox()
				local v13 = v12.Y / 2 - 1
				v10.PrimaryPart.CFrame = v8 * CFrame.new(0, v13, 0)
				v10.Parent = workspace.Visuals
				local v14 = p5.Default:CreateEffect({
					["Object"] = script.PlaceEffect,
					["Emit"] = true,
					["Position"] = v8,
					["DebrisTime"] = 2
				})
				local v15 = {
					["RollOffMaxDistance"] = 50,
					["RollOffMinDistance"] = 10,
					["RollOffMode"] = Enum.RollOffMode.InverseTapered,
					["Volume"] = 1,
					["PlaybackSpeed"] = 1
				}
				v_u_3:PlaySound(v_u_4.Tools.Generic.Place, v15, nil, v14)
				local v16 = p5.Libraries.BoatTween
				local v17 = v10.PrimaryPart
				local v18 = {
					["Time"] = 0.8,
					["EasingStyle"] = "Smoother",
					["EasingDirection"] = "In",
					["StepType"] = "Heartbeat",
					["Goal"] = {
						["CFrame"] = v8 * CFrame.new(0, v13, 0)
					}
				}
				v16:Create(v17, v18):Play()
				p5.Cache[v6].Rod = v10
			end
		else
			return
		end
	end,
	["Destroy"] = function(p19)
		-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
		local v20 = p19.Parameters.ID
		local v_u_21 = p19.Cache[v20]
		if v_u_21 then
			v_u_21 = p19.Cache[v20].Rod
		end
		if v_u_21 then
			v_u_2:RemoveTag(v_u_21, "LightningRod")
			local v22 = p19.Libraries.BoatTween
			local v23 = v_u_21.PrimaryPart
			local v24 = {
				["Time"] = 0.6,
				["EasingStyle"] = "ExitExpressive",
				["EasingDirection"] = "In",
				["StepType"] = "Heartbeat",
				["Goal"] = {
					["CFrame"] = p19.Parameters.LightningRodCFrame * CFrame.new(0, 3, 0)
				}
			}
			v22:Create(v23, v24):Play()
			local v25 = {
				["RollOffMaxDistance"] = 50,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.InverseTapered,
				["Volume"] = 1,
				["PlaybackSpeed"] = 1
			}
			v_u_3:PlaySound(v_u_4.Tools.Generic.PlaceableStaffDestroy, v25, nil, v_u_21.PrimaryPart)
			task.delay(1.5, function()
				-- upvalues: (copy) v_u_21
				v_u_21:Destroy()
			end)
		end
	end,
	["Cancel"] = function(p26)
		p26.Container:Clean()
		p26.Cache = {}
	end
}