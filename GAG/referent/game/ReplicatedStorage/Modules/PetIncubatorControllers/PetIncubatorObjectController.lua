local v_u_1 = {}
game:GetService("ServerScriptService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = require(v2.Modules.PetIncubatorControllers.PetIncubatorController)
local v_u_6 = require(v2.Data.EnumRegistry.InventoryServiceEnums)
local v_u_7 = require(v2.Modules.SelectiveAssetReplication)
local v_u_8 = require(v2.Data.PetRegistry.PetIncubationConfig)
local v_u_9 = require(v2.Modules.PetServices.PetUtilities)
local v_u_10 = require(v2.Data.EnumRegistry.ItemTypeEnums)
local v_u_11 = require(v2.Modules.GetPlayerFromFarm)
local v_u_12 = require(v2.Modules.CreateTagHandler)
require(v2.Modules.InventoryService)
local v13 = require(v2.Data.PetRegistry.PetConfig)
local v_u_14 = require(v2.Modules.DataService)
local v_u_15 = require(v2.Modules.TimeHelper)
local v_u_16 = require(v2.Modules.Spring)
local v_u_17 = require(v2.Modules.Trove)
local v_u_18 = nil
local v_u_19 = v13.XP_CONFIG.MAX_LEVEL
local v_u_20 = nil
local v_u_21 = {}
function v_u_1.UpdateRender(_, p22, p23)
	-- upvalues: (copy) v_u_21, (copy) v_u_4, (copy) v_u_15, (copy) v_u_8, (copy) v_u_16, (copy) v_u_5, (ref) v_u_18, (copy) v_u_14, (copy) v_u_9, (copy) v_u_19
	if (v_u_21[p22] or {}).Owner == v_u_4 then
		local v24 = p22.Model.OuterGlass.billboard
		local v25 = p22:GetAttribute("BoostTime") or 0
		local v26 = tonumber(v25)
		if v26 then
			v24.boost.Visible = v26 ~= 0
			v24.boost.bar.canvas.label.Text = ("[2x EXP] %*"):format((v_u_15:GenerateColonFormatFromTime(v26)))
			local v27 = v26 / v_u_8.BoostAmountPerPlayer
			v_u_16.target(v24.boost.bar.holder.content, 1, 5, {
				["Size"] = UDim2.fromScale(v27, 1)
			})
			if p23 then
				return
			end
		end
		local v28 = v_u_5:GetMachineData(p22) or {
			["IncubatorEnergy"] = v_u_8.DefaultFuel
		}
		p22.Model.InnerGlass.ProximityPrompt.ActionText = v_u_18 and v_u_18:HasTag("FruitTool") and "Submit Fuel" or (v28.IncubatedPetUUID == nil and "Insert Pet" or "Remove Pet")
		local v29 = v_u_14:GetData()
		if v29 then
			local v30 = v29.PetsData.PetInventory.Data
			if v30 then
				local v31 = v30[v28.IncubatedPetUUID]
				if v31 then
					local v32 = v31.PetData.Level
					local v33 = v31.PetData.LevelProgress / v_u_9:GetCurrentLevelXPCost(v32)
					v_u_16.target(v24.xp.bar.holder.content, 1, 5, {
						["Size"] = UDim2.fromScale(v33, 1)
					})
					local v34 = v24.xp.bar.canvas.label
					local v35
					if v32 < v_u_19 then
						local v36 = v33 * 10000
						v35 = ("[LVL %*] %*%%"):format(v32, math.round(v36) / 100) or "[MAX LVL]"
					else
						v35 = "[MAX LVL]"
					end
					v34.Text = v35
				end
				v24.xp.Visible = v31 ~= nil
				if not v24.xp.Visible then
					v_u_16.stop(v24.xp.bar.holder.content)
					v24.xp.bar.holder.content.Size = UDim2.fromScale(0, 1)
				end
				local v37 = v28.IncubatorEnergy / v_u_8.MaxFuelCapacity
				local v38 = v37 * 10000
				local v39 = math.ceil(v38) / 100
				v24.fuel.bar.canvas.label.Text = ("FUEL %*%%"):format(v39)
				v_u_16.target(v24.fuel.bar.holder.content, 1, 5, {
					["Size"] = UDim2.fromScale(v37, 1)
				})
			end
		else
			return
		end
	else
		return
	end
end
function v_u_1.UpdateAll(_)
	-- upvalues: (copy) v_u_21, (copy) v_u_1
	for v_u_40 in v_u_21 do
		task.spawn(function()
			-- upvalues: (ref) v_u_1, (copy) v_u_40
			v_u_1:UpdateRender(v_u_40)
		end)
	end
end
function v_u_1.Start(_)
	-- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_17, (copy) v_u_21, (copy) v_u_16, (copy) v_u_4, (ref) v_u_20, (copy) v_u_5, (copy) v_u_6, (copy) v_u_10, (ref) v_u_18, (copy) v_u_1, (copy) v_u_7, (copy) v_u_3, (copy) v_u_14
	v_u_12({
		["Tag"] = "PetIncubator",
		["OnInstanceAdded"] = function(p_u_41)
			-- upvalues: (ref) v_u_11, (ref) v_u_17, (ref) v_u_21, (ref) v_u_16, (ref) v_u_4, (ref) v_u_20, (ref) v_u_5, (ref) v_u_6, (ref) v_u_10, (ref) v_u_18, (ref) v_u_1, (ref) v_u_7, (ref) v_u_3
			local v42 = v_u_11((p_u_41:FindFirstAncestor("Farm")))
			local v43 = v_u_17.new()
			local v_u_44 = v43:Extend()
			v_u_21[p_u_41] = {
				["Trove"] = v43,
				["Owner"] = v42,
				["IncubationTrove"] = v_u_44
			}
			local v45 = p_u_41:WaitForChild("Model"):WaitForChild("InnerGlass"):WaitForChild("ProximityPrompt")
			for _, v46 in p_u_41.Model.OuterGlass.billboard:GetChildren() do
				if v46:IsA("Frame") then
					v46.bar.canvas.GroupTransparency = 1
				end
			end
			v45.PromptShown:Connect(function()
				-- upvalues: (copy) p_u_41, (ref) v_u_16
				for _, v47 in p_u_41.Model.OuterGlass.billboard:GetChildren() do
					if v47:IsA("Frame") then
						v_u_16.target(v47.bar.canvas, 1, 5, {
							["GroupTransparency"] = 0
						})
					end
				end
			end)
			v45.PromptHidden:Connect(function()
				-- upvalues: (copy) p_u_41, (ref) v_u_16
				if p_u_41.Parent then
					for _, v48 in p_u_41.Model.OuterGlass.billboard:GetChildren() do
						if v48:IsA("Frame") then
							v_u_16.target(v48.bar.canvas, 1, 5, {
								["GroupTransparency"] = 1
							})
						end
					end
				end
			end)
			if v_u_4 == v42 then
				v45.Triggered:Connect(function()
					-- upvalues: (ref) v_u_4, (ref) v_u_20, (ref) v_u_5, (copy) p_u_41, (ref) v_u_6, (ref) v_u_10
					local v49 = v_u_4.Character
					if v49 then
						if v_u_20 then
							return
						else
							v_u_20 = true
							task.delay(0.5, function()
								-- upvalues: (ref) v_u_20
								v_u_20 = false
							end)
							local v50 = v_u_5:GetMachineData(p_u_41) or {}
							local v51 = v49:FindFirstChildWhichIsA("Tool")
							local v52
							if v51 then
								v52 = v51:GetAttribute(v_u_6.ITEM_TYPE)
								if v51:HasTag("FruitTool") then
									v_u_5:SubmitItem(p_u_41.Parent)
									return
								end
							else
								v52 = nil
							end
							if v50.IncubatedPetUUID then
								v_u_5:RemovePet(p_u_41.Parent)
								return
							elseif v51 and v52 == v_u_10.Pet then
								v_u_5:InputPet(p_u_41.Parent)
							end
						end
					else
						return
					end
				end)
				local function v56(p53)
					-- upvalues: (ref) v_u_18, (ref) v_u_1, (copy) p_u_41
					v_u_18 = p53:FindFirstChildOfClass("Tool")
					v_u_1:UpdateRender(p_u_41)
					p53.ChildAdded:Connect(function(p54)
						-- upvalues: (ref) v_u_18, (ref) v_u_1, (ref) p_u_41
						if p54:IsA("Tool") then
							v_u_18 = p54
							v_u_1:UpdateRender(p_u_41)
						end
					end)
					p53.ChildRemoved:Connect(function(p55)
						-- upvalues: (ref) v_u_18, (ref) v_u_1, (ref) p_u_41
						if p55:IsA("Tool") then
							v_u_18 = nil
							v_u_1:UpdateRender(p_u_41)
						end
					end)
				end
				v43:Add(v_u_4.CharacterAdded:Connect(v56))
				if v_u_4.Character then
					task.spawn(v56, v_u_4.Character)
				end
			else
				p_u_41.Model.InnerGlass.ProximityPrompt.ActionText = "Boost"
				p_u_41.Model.OuterGlass.billboard.Enabled = false
				v45.Triggered:Connect(function()
					-- upvalues: (ref) v_u_4, (ref) v_u_20, (copy) p_u_41, (ref) v_u_5
					if v_u_4.Character then
						if v_u_20 then
							return
						elseif p_u_41:GetAttribute("PetType") then
							v_u_20 = true
							task.delay(0.5, function()
								-- upvalues: (ref) v_u_20
								v_u_20 = false
							end)
							v_u_5:Boost(p_u_41.Parent)
						end
					else
						return
					end
				end)
			end
			local function v70()
				-- upvalues: (copy) p_u_41, (copy) v_u_44, (ref) v_u_7, (ref) v_u_3
				local v57 = p_u_41:GetAttribute("PetType")
				v_u_44:Clean()
				if v57 then
					local v_u_58 = p_u_41.Model.PetModelExtents
					local v_u_59 = v_u_44:Add(v_u_7:GetAssetAsync("PetAssets", v57):Clone())
					local v60 = v_u_59.PrimaryPart
					v_u_59.Name = "PetModel"
					if v60 then
						v60.Anchored = true
					else
						for _, v61 in v_u_59:GetChildren() do
							if v61:IsA("BasePart") then
								v61.Anchored = true
							end
						end
					end
					v_u_59:PivotTo(CFrame.new(v_u_58:GetPivot().Position) * CFrame.Angles(math.random(360), math.random(360), math.random(360)))
					local v62 = v_u_59:GetExtentsSize()
					local v63 = v_u_58:GetExtentsSize()
					local v64 = v63.X / v62.X
					local v65 = v63.Y / v62.Y
					local v66 = v63.Z / v62.Z
					v_u_59:ScaleTo((math.min(v64, v65, v66)))
					v_u_59.Parent = p_u_41
					v_u_44:Add(v_u_3.RenderStepped:Connect(function(p67)
						-- upvalues: (ref) p_u_41, (copy) v_u_59, (copy) v_u_58
						local v68 = p_u_41:GetAttribute("BoostTime")
						if v68 then
							v68 = v68 > 0
						end
						local v69 = CFrame.Angles(math.random() * p67, math.random() * p67 * (v68 and 10 or 1), 0)
						v_u_59:PivotTo(CFrame.new(v_u_58:GetPivot().Position) * v_u_59:GetPivot().Rotation * v69)
					end))
				end
			end
			v43:Add(p_u_41:GetAttributeChangedSignal("PetType"):Connect(v70))
			v43:Add(p_u_41:GetAttributeChangedSignal("BoostTime"):Connect(function()
				-- upvalues: (ref) v_u_1, (copy) p_u_41
				v_u_1:UpdateRender(p_u_41, true)
			end))
			v_u_1:UpdateRender(p_u_41)
			v70()
		end,
		["OnInstanceRemoved"] = function(p71)
			-- upvalues: (ref) v_u_21
			if v_u_21[p71].Trove then
				v_u_21[p71].Trove:Destroy()
			end
			v_u_21[p71] = nil
		end
	})
	v_u_14:GetPathSignal("PetsData/PetIncubatorData/@"):Connect(function()
		-- upvalues: (ref) v_u_1
		v_u_1:UpdateAll()
	end)
end
task.spawn(v_u_1.Start)
return v_u_1