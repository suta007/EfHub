local v_u_1 = {}
game:GetService("ServerScriptService")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = require(v2.Modules.PetEggIncubatorControllers.PetEggIncubatorController)
local v_u_5 = require(v2.Data.EnumRegistry.InventoryServiceEnums)
require(v2.Modules.SelectiveAssetReplication)
local v_u_6 = require(v2.Data.PetRegistry.PetEggIncubationConfig)
require(v2.Modules.PetServices.PetUtilities)
local v_u_7 = require(v2.Data.EnumRegistry.ItemTypeEnums)
local v_u_8 = require(v2.Modules.GetPlayerFromFarm)
local v_u_9 = require(v2.Modules.CreateTagHandler)
require(v2.Modules.InventoryService)
require(v2.Modules.Notification)
local v_u_10 = require(v2.Modules.DataService)
local v_u_11 = require(v2.Modules.TimeHelper)
local v_u_12 = require(v2.Data.PetRegistry)
require(v2.Modules.Observers)
local v_u_13 = require(v2.Modules.Spring)
local v14 = require(v2.Modules.Signal)
local v_u_15 = require(v2.Modules.Trove)
local v_u_16 = v2.Assets.Models.EggModels
local v_u_17 = nil
local v_u_18 = v14.new()
local v_u_19 = nil
local v_u_20 = {}
function v_u_1.UpdateRender(_, p_u_21)
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_8, (copy) v_u_3, (ref) v_u_17, (copy) v_u_12, (copy) v_u_13, (copy) v_u_11, (copy) v_u_6, (copy) v_u_20, (copy) v_u_18
	local v_u_22 = v_u_4:GetMachineData(p_u_21)
	if v_u_22 then
		if v_u_10:GetData() then
			local v_u_23 = v_u_8((p_u_21:FindFirstAncestor("Farm")))
			local v_u_24 = p_u_21.Model.OuterGlass.billboard
			local function v25()
				-- upvalues: (copy) p_u_21, (copy) v_u_23, (ref) v_u_3, (ref) v_u_17, (copy) v_u_22
				p_u_21.Model.InnerGlass.ProximityPrompt.ActionText = v_u_23 == v_u_3 and (v_u_17 and v_u_17:HasTag("FruitTool") and "Submit Fuel" or (v_u_22.IncubatedEgg == nil and "Submit Egg" or "Remove Egg")) or "Boost"
			end
			local function v29()
				-- upvalues: (copy) p_u_21, (copy) v_u_22, (ref) v_u_12, (ref) v_u_13, (copy) v_u_24, (ref) v_u_11
				p_u_21.Parent:GetAttribute("IsDoubled")
				if v_u_22.IncubatorEnergy > 0 then
					local _ = v_u_22.IncubatedEgg == nil
				end
				local v26 = v_u_22.HatchTime or 0
				local v27
				if v_u_22.IncubatedEgg then
					local v28 = v_u_12.PetEggs[v_u_22.IncubatedEgg].HatchTime
					v27 = (v28 - v26) / v28
				else
					v27 = 0
				end
				p_u_21.Model.EggModelExtents.Extents:SetAttribute("HatchTime", v26)
				v_u_13.target(v_u_24.xp.bar.holder.content, 1, 5, {
					["Size"] = UDim2.fromScale(v27, 1)
				})
				v_u_24.xp.bar.canvas.label.Text = v26 == 0 and "Ready" or v_u_11:GenerateColonFormatFromTime(v26)
				v_u_24.xp.Visible = v_u_22.IncubatedEgg ~= nil
				if not v_u_24.xp.Visible then
					v_u_13.stop(v_u_24.xp.bar.holder.content)
					v_u_24.xp.bar.holder.content.Size = UDim2.fromScale(0, 1)
				end
			end
			local v30 = v_u_22.IncubatorEnergy / v_u_6.MaxFuelCapacity
			local v31 = v30 * 10000
			local v32 = math.round(v31) / 100
			v_u_24.fuel.bar.canvas.label.Text = ("FUEL %*%%"):format(v32)
			v_u_13.target(v_u_24.fuel.bar.holder.content, 1, 5, {
				["Size"] = UDim2.fromScale(v30, 1)
			})
			local v33 = v_u_20[p_u_21].IncubationTrove
			v33:Add(p_u_21.Parent:GetAttributeChangedSignal("IsDoubled"):Connect(v29))
			v29()
			v33:Add(v_u_18:Connect(v25))
			p_u_21.Model.InnerGlass.ProximityPrompt.ActionText = v_u_23 == v_u_3 and (v_u_17 and v_u_17:HasTag("FruitTool") and "Submit Fuel" or (v_u_22.IncubatedEgg == nil and "Submit Egg" or "Remove Egg")) or "Boost"
		end
	else
		return
	end
end
function v_u_1.UpdateAll(_)
	-- upvalues: (copy) v_u_20, (copy) v_u_1
	for v_u_34 in v_u_20 do
		task.spawn(function()
			-- upvalues: (ref) v_u_1, (copy) v_u_34
			v_u_1:UpdateRender(v_u_34)
		end)
	end
end
function v_u_1.Start(_)
	-- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_15, (copy) v_u_20, (copy) v_u_13, (copy) v_u_3, (ref) v_u_19, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7, (copy) v_u_16, (copy) v_u_12, (copy) v_u_10, (copy) v_u_1, (ref) v_u_17, (copy) v_u_18
	v_u_9({
		["Tag"] = "PetEggIncubator",
		["OnInstanceAdded"] = function(p_u_35)
			-- upvalues: (ref) v_u_8, (ref) v_u_15, (ref) v_u_20, (ref) v_u_13, (ref) v_u_3, (ref) v_u_19, (ref) v_u_4, (ref) v_u_5, (ref) v_u_7, (ref) v_u_16, (ref) v_u_12, (ref) v_u_10, (ref) v_u_1
			local v36 = v_u_8((p_u_35:FindFirstAncestor("Farm")))
			local v37 = v_u_15.new()
			local v_u_38 = v37:Extend()
			v_u_20[p_u_35] = {
				["Trove"] = v37,
				["IncubationTrove"] = v37:Extend()
			}
			local v39 = p_u_35:WaitForChild("Model"):WaitForChild("InnerGlass"):WaitForChild("ProximityPrompt")
			for _, v40 in p_u_35.Model.OuterGlass.billboard:GetChildren() do
				if v40:IsA("Frame") then
					v40.bar.canvas.GroupTransparency = 1
				end
			end
			v39.PromptShown:Connect(function()
				-- upvalues: (copy) p_u_35, (ref) v_u_13
				for _, v41 in p_u_35.Model.OuterGlass.billboard:GetChildren() do
					if v41:IsA("Frame") then
						v_u_13.target(v41.bar.canvas, 1, 5, {
							["GroupTransparency"] = 0
						})
					end
				end
			end)
			v39.PromptHidden:Connect(function()
				-- upvalues: (copy) p_u_35, (ref) v_u_13
				if p_u_35.Parent then
					for _, v42 in p_u_35.Model.OuterGlass.billboard:GetChildren() do
						if v42:IsA("Frame") then
							v_u_13.target(v42.bar.canvas, 1, 5, {
								["GroupTransparency"] = 1
							})
						end
					end
				end
			end)
			if v_u_3 == v36 then
				v37:Add(v39.Triggered:Connect(function()
					-- upvalues: (ref) v_u_3, (ref) v_u_19, (ref) v_u_4, (copy) p_u_35, (ref) v_u_5, (ref) v_u_7
					local v43 = v_u_3.Character
					if v43 then
						if v_u_19 then
							return
						else
							v_u_19 = true
							task.delay(0.5, function()
								-- upvalues: (ref) v_u_19
								v_u_19 = false
							end)
							local v44 = v_u_4:GetMachineData(p_u_35)
							if v44 then
								local v45 = p_u_35.Parent:GetAttribute("CosmeticUUID")
								if v45 then
									local v46 = v43:FindFirstChildWhichIsA("Tool")
									local v47
									if v46 then
										v47 = v46:GetAttribute(v_u_5.ITEM_TYPE)
										if v46:HasTag("FruitTool") then
											v_u_4:SubmitItem(v45)
											return
										end
									else
										v47 = nil
									end
									if v44.IncubatedEgg then
										v_u_4:RemoveEgg(v45, true)
										return
									elseif v46 and v47 == v_u_7.PetEgg then
										v_u_4:InputEgg(v45)
									end
								else
									return
								end
							else
								return
							end
						end
					else
						return
					end
				end))
			else
				v37:Add(v39.Triggered:Connect(function()
					-- upvalues: (ref) v_u_3, (ref) v_u_19, (copy) p_u_35, (ref) v_u_4
					if v_u_3.Character then
						if v_u_19 then
							return
						elseif p_u_35.Parent:GetAttribute("CosmeticUUID") then
							v_u_19 = true
							task.delay(0.5, function()
								-- upvalues: (ref) v_u_19
								v_u_19 = false
							end)
							v_u_4:Boost(p_u_35)
						end
					else
						return
					end
				end))
			end
			local function v62()
				-- upvalues: (copy) v_u_38, (copy) p_u_35, (ref) v_u_16, (ref) v_u_12, (ref) v_u_4, (ref) v_u_10
				v_u_38:Clean()
				local v48 = p_u_35.Parent:GetAttribute("EggName")
				if v48 then
					local v49 = v_u_16:FindFirstChild(v48)
					if not v49 then
						return warn((("Could not find egg model associated with %*"):format(v48)))
					end
					local v_u_50 = v_u_38:Clone(v49)
					v_u_50.Name = "Egg"
					local v_u_51 = p_u_35.Model.EggModelExtents.Extents
					local v_u_52 = v_u_12.PetEggs[v48].HatchTime
					workspace.Terrain.EggParticle.WorldCFrame = v_u_51:GetPivot()
					for _, v53 in workspace.Terrain.EggParticle:GetDescendants() do
						v53:Emit(v53:GetAttribute("EmitCount"))
					end
					local function v57()
						-- upvalues: (ref) v_u_4, (ref) p_u_35, (copy) v_u_52, (copy) v_u_50, (copy) v_u_51
						local v54 = v_u_4:GetMachineData(p_u_35)
						local v55 = v_u_50
						local v56 = 1 - 0.5 * ((v54 and v54.HatchTime or v_u_52) / v_u_52)
						v55:ScaleTo((math.clamp(v56, 0.2, 1)))
						v_u_50:PivotTo(v_u_51:GetPivot())
					end
					v_u_38:Add(v_u_51:GetAttributeChangedSignal("TimeToHatch"):Connect(v57))
					v_u_38:Add(v_u_10:GetPathSignal("PetsData/PetEggIncubatorData/@"):Connect(v57))
					local v58 = v_u_4:GetMachineData(p_u_35)
					local v59
					if v58 then
						v59 = v58.HatchTime or v_u_52
					else
						v59 = v_u_52
					end
					local v60 = 1 - 0.5 * (v59 / v_u_52)
					v_u_50:ScaleTo((math.clamp(v60, 0.2, 1)))
					v_u_50:PivotTo(v_u_51:GetPivot())
					if v_u_50.PrimaryPart then
						v_u_50.PrimaryPart.Anchored = false
						local v61 = v_u_38:Add(Instance.new("WeldConstraint"))
						v61.Part0 = v_u_50.PrimaryPart
						v61.Part1 = v_u_51
						v61.Parent = v_u_50.PrimaryPart
					end
					v_u_50.Parent = v_u_51
				end
			end
			v_u_1:UpdateRender(p_u_35)
			v37:Add(p_u_35.Parent:GetAttributeChangedSignal("EggName"):Connect(v62))
			v62()
		end,
		["OnInstanceRemoved"] = function(p63)
			-- upvalues: (ref) v_u_20
			if v_u_20[p63].Trove then
				v_u_20[p63].Trove:Destroy()
			end
			v_u_20[p63] = nil
		end
	})
	v_u_10:GetPathSignal("PetsData/PetEggIncubatorData/@"):Connect(function()
		-- upvalues: (ref) v_u_1
		v_u_1:UpdateAll()
	end)
	local function v68(p64)
		-- upvalues: (ref) v_u_17, (ref) v_u_18
		local v65 = p64:FindFirstChildOfClass("Tool")
		if v_u_17 ~= v65 then
			v_u_17 = v65
			v_u_18:Fire(v65)
		end
		p64.ChildAdded:Connect(function(p66)
			-- upvalues: (ref) v_u_17, (ref) v_u_18
			if p66:IsA("Tool") then
				if v_u_17 == p66 then
					return
				end
				v_u_17 = p66
				v_u_18:Fire(p66)
			end
		end)
		p64.ChildRemoved:Connect(function(p67)
			-- upvalues: (ref) v_u_17, (ref) v_u_18
			if p67:IsA("Tool") then
				if v_u_17 == nil then
					return
				end
				v_u_17 = nil
				v_u_18:Fire(nil)
			end
		end)
	end
	v_u_3.CharacterAdded:Connect(v68)
	if v_u_3.Character then
		task.spawn(v68, v_u_3.Character)
	end
end
task.spawn(v_u_1.Start, v_u_1)
return v_u_1