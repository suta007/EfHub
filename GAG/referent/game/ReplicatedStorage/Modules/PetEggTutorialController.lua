game:GetService("ServerScriptService")
local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("SoundService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("Players")
local v_u_6 = require(v_u_2.Modules.DataService)
local v_u_7 = require(v_u_2.Modules.TutorialController.TutorialUtils)
local v_u_8 = require(v_u_2.Modules.InventoryService)
local v_u_9 = require(v_u_2.Modules.PetServices.ActivePetsService)
local v_u_10 = require(v_u_2.Modules.PetServices.PetCardUserInterfaceService)
local v_u_11 = require(v_u_2.Modules.PetServices.PetActionUserInterfaceService)
local v_u_12 = require(v_u_2.Data.EnumRegistry.InventoryServiceEnums)
local v_u_13 = require(v_u_2.Data.EnumRegistry.ItemTypeEnums)
local v_u_14 = require(v_u_2.Modules.RebirthUnlocksSharedService)
local v_u_15 = require(v_u_2.Modules.TradeControllers.TradeWorldController)
require(v_u_2.Modules.ActivePetsUIController)
local v_u_16 = require(v_u_2.Modules.Notification)
local v_u_17 = require(v_u_2.Arrow_Module)
local v_u_18 = require(v_u_2.Modules.FastTween)
local v_u_19 = require(v_u_2.Modules.GetFarmAsync)
local v_u_20 = require(v_u_2.Data.PetRegistry)
local v_u_21 = require(v_u_2.Data.PetEggData)
local v_u_22 = v5.LocalPlayer
local v_u_23 = v_u_22.PlayerGui
local v_u_24 = workspace.CurrentCamera
local v_u_127 = {
	["Run"] = function(_)
		-- upvalues: (copy) v_u_22, (copy) v_u_19, (copy) v_u_6, (copy) v_u_4, (copy) v_u_17, (copy) v_u_1, (copy) v_u_8, (copy) v_u_20, (copy) v_u_21, (copy) v_u_14, (copy) v_u_16, (copy) v_u_7, (copy) v_u_2, (copy) v_u_12, (copy) v_u_13, (copy) v_u_9, (copy) v_u_23, (copy) v_u_18, (copy) v_u_24, (copy) v_u_11, (copy) v_u_10, (copy) v_u_3
		if not v_u_22.Character then
			v_u_22.CharacterAdded:Wait()
		end
		local v_u_25 = v_u_19(v_u_22)
		if not v_u_25 then
			warn("PetEggTutorialController:Run || Failed to execute tutorial because player has no farm")
			return
		end
		local v_u_26 = v_u_6:GetData()
		if not v_u_26 then
			warn("PetEggTutorialController:Run || Failed to execute tutorial because player data is missing")
			return
		end
		if not workspace.NPCS:WaitForChild("Pet Stand", 10) then
			warn("PetEggTutorialController:Run || Failed to execute tutorial because Pet Stand is missing")
			return
		end
		if not v_u_4:IsStudio() then
			return
		end
		local function v_u_37()
			-- upvalues: (copy) v_u_25, (ref) v_u_1
			local v27 = nil
			for _, v28 in v_u_25.Important.Plant_Locations:GetChildren() do
				if v28:IsA("BasePart") then
					local v29 = Random.new()
					local v30 = 15
					while true do
						if v30 <= 0 then
							v35 = v27
							break
						end
						local v31 = v28.Position
						local v32 = v29:NextUnitVector()
						local v33 = v28.Size.X
						local v34 = v28.Size.Z
						local v35 = v31 + v32 * Vector3.new(v33, 0, v34) * 0.5 * 0.7
						local v36 = OverlapParams.new()
						v36.FilterDescendantsInstances = v_u_1:GetTagged("Harvestable")
						v36.FilterType = Enum.RaycastFilterType.Include
						v36.MaxParts = 1
						if #workspace:GetPartBoundsInRadius(v35, 10, v36) == 0 then
							break
						end
						v30 = v30 - 1
					end
					if v35 then
						break
					end
					v27 = v35
				end
			end
		end
		local function v_u_42()
			-- upvalues: (copy) v_u_26
			for _, v38 in v_u_26.SavedObjects do
				if type(v38) == "table" and v38.ObjectType == "PetEgg" then
					local v39 = v38.Data
					if type(v39) == "table" and v38.Data.EggName == "Common Egg" then
						return true
					end
				end
			end
			for _, v40 in v_u_26.SaveSlots.AllSlots.DEFAULT.SavedObjects do
				if type(v40) == "table" and v40.ObjectType == "PetEgg" then
					local v41 = v40.Data
					if type(v41) == "table" and v40.Data.EggName == "Common Egg" then
						return true
					end
				end
			end
			return false
		end
		local function v_u_43()
			-- upvalues: (copy) v_u_26
			return next(v_u_26.PetsData.PetInventory.Data) ~= nil
		end
		local function v_u_44()
			-- upvalues: (copy) v_u_26
			return next(v_u_26.PetsData.EquippedPets) ~= nil
		end
		local v_u_45 = false
		local v_u_46 = false
		local function v_u_47()
			-- upvalues: (copy) v_u_26
			return next(v_u_26.PetsData.EquippedPets) ~= nil
		end
		local function v_u_54()
			-- upvalues: (ref) v_u_8, (copy) v_u_42, (copy) v_u_43, (copy) v_u_47, (copy) v_u_26, (ref) v_u_20, (ref) v_u_21
			local v49 = v_u_8:Find("PetEgg", function(p48)
				return p48.EggName == "Common Egg"
			end)
			local v50
			if type(v49) == "table" then
				v50 = next(v49) ~= nil
			else
				v50 = false
			end
			if v50 or v_u_42() or (v_u_43() or v_u_47()) then
				return true
			end
			local v51 = false
			for _, v52 in v_u_26.PetEggStock.Stocks do
				if v52.EggName == "Common Egg" and v52.Stock > 0 then
					v51 = true
					break
				end
			end
			if v_u_20.PetEggs["Common Egg"] then
				local v53 = v_u_21["Common Egg"]
				if v53 then
					return v51 and v_u_26.Sheckles >= v53.Price * 1.03 and true or false
				else
					return false
				end
			else
				return false
			end
		end
		local function v64()
			-- upvalues: (copy) v_u_54, (ref) v_u_6, (ref) v_u_14, (ref) v_u_22
			while not v_u_54() do
				local v_u_55 = false
				local v_u_56 = coroutine.running()
				local function v57()
					-- upvalues: (ref) v_u_55, (copy) v_u_56
					v_u_55 = true
					if coroutine.status(v_u_56) == "suspended" then
						task.spawn(v_u_56)
					end
				end
				local v58 = v_u_6
				local v59 = assert(v58:GetPathSignal("Sheckles")):Connect(v57)
				local v60 = v_u_6
				local v61 = assert(v60:GetPathSignal("PetEggStock/@")):Connect(v57)
				local v62
				if v_u_14:HasBeenAssignedABTest(v_u_22) then
					local v63 = v_u_6
					v62 = assert(v63:GetPathSignal("InventoryData/@")):Connect(v57)
				else
					v62 = nil
				end
				if not v_u_55 then
					coroutine.yield()
				end
				v59:Disconnect()
				v61:Disconnect()
				if v62 then
					v62:Disconnect()
				end
			end
			return true
		end
		local function v74()
			-- upvalues: (ref) v_u_8, (copy) v_u_42, (copy) v_u_26, (copy) v_u_44, (ref) v_u_17, (ref) v_u_22, (copy) v_u_54
			local v66 = v_u_8:Find("PetEgg", function(p65)
				return p65.EggName == "Common Egg"
			end)
			local v67
			if type(v66) == "table" then
				v67 = next(v66) ~= nil
			else
				v67 = false
			end
			if v67 or v_u_42() or (next(v_u_26.PetsData.PetInventory.Data) ~= nil or v_u_44()) then
				return true
			end
			local v68 = workspace.Tutorial_Points.Tutorial_Point_4.Position
			local v_u_69 = v_u_17.GenerateArrow(v_u_22, v68, math.random(1, 1000000))
			local function v70()
				-- upvalues: (ref) v_u_17, (copy) v_u_69
				v_u_17.Remove_Arrow(v_u_69)
			end
			while true do
				local v72 = v_u_8:Find("PetEgg", function(p71)
					return p71.EggName == "Common Egg"
				end)
				local v73
				if type(v72) == "table" then
					v73 = next(v72) ~= nil
				else
					v73 = false
				end
				if v73 or v_u_42() or (next(v_u_26.PetsData.PetInventory.Data) ~= nil or v_u_44()) then
					v70()
					return true
				end
				if v_u_22.Character and v_u_22:DistanceFromCharacter(v68) <= 8 or not v_u_54() then
					v70()
					return v_u_54()
				end
				task.wait(0.25)
			end
		end
		local v_u_75 = nil
		local function v85()
			-- upvalues: (copy) v_u_42, (copy) v_u_26, (ref) v_u_8, (ref) v_u_6, (copy) v_u_25, (ref) v_u_7, (ref) v_u_16, (ref) v_u_17, (ref) v_u_22, (ref) v_u_75, (copy) v_u_37, (ref) v_u_2, (ref) v_u_46
			if v_u_42() or (next(v_u_26.PetsData.PetInventory.Data) ~= nil or next(v_u_26.PetsData.EquippedPets) ~= nil) then
				return true
			end
			while true do
				local v77 = v_u_8:Find("PetEgg", function(p76)
					return p76.EggName == "Common Egg"
				end)
				local v78
				if type(v77) == "table" then
					v78 = next(v77) ~= nil
				else
					v78 = false
				end
				if v78 then
					local v79 = v_u_25.Spawn_Point.CFrame.Position
					if v_u_7.getDistanceTo(v79) > 10 then
						v_u_16:CreateNotification("Go back to your farm")
						local v_u_80 = v_u_17.GenerateArrow(v_u_22, v79, math.random(1, 1000000))
						local function v81()
							-- upvalues: (ref) v_u_17, (copy) v_u_80
							v_u_17.Remove_Arrow(v_u_80)
						end
						v_u_7.waitUntilDistance(v79, 10)
						v81()
					end
					v_u_16:CreateNotification("Equip the egg and place it in your Farm")
					if not v_u_75 then
						v_u_75 = v_u_37()
					end
					local v82 = v_u_2.Tutorial_Parts.Tutorial_Click:Clone()
					v82.Size = Vector3.new(0.001, 0.001, 0.001)
					v82.Position = v_u_75 or (v_u_25.Spawn_Point.CFrame * CFrame.new(15, -5, -15)).Position
					v82.Parent = workspace.Click_Points
					while not v_u_42() do
						local v83 = v_u_6
						assert(v83:GetPathSignal("SaveSlots/AllSlots/DEFAULT/SavedObjects/@")):Wait()
					end
					v_u_46 = true
					v82:Destroy()
					return true
				end
				local v84 = v_u_6
				assert(v84:GetPathSignal("InventoryData/@")):Wait()
			end
		end
		local function v103()
			-- upvalues: (copy) v_u_26, (ref) v_u_46, (ref) v_u_16, (ref) v_u_1, (ref) v_u_22, (ref) v_u_12, (ref) v_u_7, (ref) v_u_17, (ref) v_u_6
			if next(v_u_26.PetsData.PetInventory.Data) ~= nil or next(v_u_26.PetsData.EquippedPets) ~= nil then
				return true
			end
			local function v94()
				-- upvalues: (ref) v_u_26
				local v86 = (1 / 0)
				for _, v87 in v_u_26.SavedObjects do
					if type(v87) == "table" and v87.ObjectType == "PetEgg" then
						local v88 = v87.Data
						if type(v88) == "table" and v87.Data.EggName == "Common Egg" then
							local v89 = v87.Data.TimeToHatch
							if type(v89) == "number" then
								local v90 = v87.Data.TimeToHatch
								v86 = math.min(v86, v90)
							end
						end
					end
				end
				for _, v91 in v_u_26.SaveSlots.AllSlots.DEFAULT.SavedObjects do
					if type(v91) == "table" and v91.ObjectType == "PetEgg" then
						local v92 = v91.Data
						if type(v92) == "table" and v91.Data.EggName == "Common Egg" then
							local v93 = v91.Data.TimeToHatch
							v86 = math.min(v86, v93)
						end
					end
				end
				return v86
			end
			local v95 = v94()
			local _ = v95 <= 0
			if v95 > 0 and v_u_46 then
				v_u_16:CreateNotification("Wait until your egg is ready")
			end
			while v94() > 0 and next(v_u_26.PetsData.PetInventory.Data) == nil do
				task.wait(1)
			end
			v_u_16:CreateNotification("Your egg is ready to hatch!")
			local function v97()
				-- upvalues: (ref) v_u_1, (ref) v_u_22, (ref) v_u_12
				for _, v96 in v_u_1:GetTagged("PetEggServer") do
					if v96:GetAttribute("OWNER") == v_u_22.Name and (v96:GetAttribute(v_u_12.EggName) == "Common Egg" and v96:GetAttribute("READY")) then
						return v96
					end
				end
				return nil
			end
			local v98
			if next(v_u_26.PetsData.PetInventory.Data) ~= nil then
				v98 = nil
			else
				v98 = v97()
			end
			local v99
			if v98 then
				v99 = v98:GetPivot().Position
			else
				v99 = nil
			end
			if v98 ~= nil and v99 ~= nil then
				if v_u_7.getDistanceTo(v99) > 7 then
					local v_u_100 = v_u_17.GenerateArrow(v_u_22, v99, math.random(1, 1000000))
					local function v101()
						-- upvalues: (ref) v_u_17, (copy) v_u_100
						v_u_17.Remove_Arrow(v_u_100)
					end
					v_u_7.waitUntilDistance(v99, 7)
					v101()
				end
				v_u_16:CreateNotification("Hatch the egg!")
			end
			while next(v_u_26.PetsData.PetInventory.Data) == nil do
				local v102 = v_u_6
				assert(v102:GetPathSignal("PetsData/PetInventory/@")):Wait()
			end
			task.wait(0.5)
			while workspace.Visuals:FindFirstChild("Common Egg") or workspace.Visuals:FindFirstChild("EggExplode") do
				task.wait()
			end
			task.wait(0.5)
			return true
		end
		local function v107()
			-- upvalues: (copy) v_u_26, (ref) v_u_22, (ref) v_u_12, (ref) v_u_13, (ref) v_u_16, (ref) v_u_2, (ref) v_u_75, (copy) v_u_25, (ref) v_u_6, (ref) v_u_45
			if next(v_u_26.PetsData.EquippedPets) ~= nil then
				return true
			end
			local v104 = v_u_22.Character:FindFirstChildOfClass("Tool")
			if v104 and v104:GetAttribute(v_u_12.ITEM_TYPE) == v_u_13.Pet then
				v_u_16:CreateNotification("Now with your pet in hands, tap on your Farm")
			else
				v_u_16:CreateNotification("Now equip your pet and tap on your Farm")
			end
			local v105 = v_u_2.Tutorial_Parts.Tutorial_Click:Clone()
			v105.Size = Vector3.new(0.001, 0.001, 0.001)
			v105.Position = v_u_75 or (v_u_25.Spawn_Point.CFrame * CFrame.new(15, -5, -15)).Position
			v105.Parent = workspace.Click_Points
			while next(v_u_26.PetsData.EquippedPets) == nil do
				local v106 = v_u_6
				assert(v106:GetPathSignal("PetsData/EquippedPets/@")):Wait()
			end
			v_u_45 = true
			v105:Destroy()
			return true
		end
		local function v125()
			-- upvalues: (ref) v_u_45, (copy) v_u_26, (ref) v_u_9, (ref) v_u_22, (ref) v_u_23, (ref) v_u_18, (ref) v_u_4, (ref) v_u_24, (ref) v_u_11, (ref) v_u_10, (ref) v_u_1, (ref) v_u_3
			if not v_u_45 then
				return true
			end
			local _, v_u_108 = next(v_u_26.PetsData.EquippedPets)
			if not v_u_108 then
				return true
			end
			local v109 = 15
			while not v_u_9:GetClientPetStateUUID(v_u_22.Name, v_u_108) and v109 > 0 do
				v109 = v109 - task.wait()
			end
			if v109 <= 0 then
				return true
			end
			v_u_23.PetEggTutorial.Enabled = true
			local v_u_110 = v_u_23.PetEggTutorial.FocusPoint
			local v111 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
			local v112 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			v_u_110.Size = UDim2.fromScale(1.5, 1.5)
			v_u_18(v_u_110, v112, {
				["Size"] = UDim2.fromScale(0.3, 0.3)
			})
			v_u_18(v_u_110, v111, {
				["ImageTransparency"] = 0.3
			})
			v_u_18(v_u_110.UIStroke, v111, {
				["Transparency"] = 0.3
			})
			local v116 = v_u_4.PreRender:Connect(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_22, (copy) v_u_108, (ref) v_u_24, (copy) v_u_110
				local v113 = v_u_9:GetClientPetStateUUID(v_u_22.Name, v_u_108)
				if v113 and v113.LastUpdatedPosition then
					local v114, v115 = v_u_24:WorldToScreenPoint(v113.LastUpdatedPosition)
					if v115 then
						v_u_110.Position = UDim2.fromOffset(v114.X, v114.Y)
						v_u_110.Visible = true
						return
					end
				end
				v_u_110.Position = UDim2.fromScale(1.5, 1.5)
				v_u_110.Visible = false
			end)
			v_u_110.Step1.Visible = true
			v_u_18(v_u_110.Step1.Label1, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				["TextTransparency"] = 0
			})
			v_u_18(v_u_110.Step1.Label2, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0.3), {
				["TextTransparency"] = 0
			})
			local v117 = 7
			while not v_u_11.Active and v117 > 0 do
				v117 = v117 - task.wait()
			end
			v_u_18(v_u_110, v111, {
				["ImageTransparency"] = 1
			})
			v_u_18(v_u_110.UIStroke, v111, {
				["Transparency"] = 1
			})
			v_u_18(v_u_110.Step1.Label1, v111, {
				["TextTransparency"] = 1
			})
			v_u_18(v_u_110.Step1.Label2, v111, {
				["TextTransparency"] = 1
			})
			task.wait(0.5)
			v_u_110.Step1.Visible = false
			v116:Disconnect()
			while not v_u_23.PetUI.Enabled or v_u_23.PetUI.PetCard.Main.Position.X.Scale > 1 do
				task.wait()
			end
			if not v_u_10.Active then
				v_u_10:Toggle(true)
			end
			local v118 = v_u_10.Toggle
			function v_u_10.Toggle() end
			v_u_18(v_u_23.PetUI.Background, v111, {
				["BackgroundTransparency"] = 0.3
			})
			task.wait(0.5)
			local v119 = {}
			for _, v120 in v_u_1:GetTagged("PetTooltip") do
				if v120:IsDescendantOf(v_u_23.PetUI) then
					if v120.Parent.Parent:FindFirstChild("HUNGER_BAR") then
						table.insert(v119, 1, v120)
					elseif v120.Parent.Parent:FindFirstChild("PET_LEVEL") then
						table.insert(v119, 2, v120)
					elseif v120.Parent.Parent:FindFirstChild("PET_WEIGHT") then
						table.insert(v119, 3, v120)
					elseif v120.Parent.Parent:FindFirstChild("PET_ABILITY") then
						table.insert(v119, 4, v120)
					end
				end
			end
			for _, v121 in v119 do
				v_u_3.Click:Play()
				v121:SetAttribute("ForceTooltip", true)
				task.wait(3)
			end
			task.wait(3)
			for _, v122 in v119 do
				local v123 = "ForceTooltip"
				local v124
				if v122.Parent.Parent:FindFirstChild("PET_ABILITY") then
					v124 = false
				else
					v124 = nil
				end
				v122:SetAttribute(v123, v124)
			end
			v_u_18(v_u_23.PetUI.Background, v111, {
				["BackgroundTransparency"] = 1
			})
			v_u_10.Toggle = v118
			return true
		end
		while task.wait() do
			v_u_2.GameEvents.EggTutorial:FireServer(1)
			v64()
			v_u_2.GameEvents.EggTutorial:FireServer(2)
			if v74() then
				v_u_2.GameEvents.EggTutorial:FireServer(3)
				local v126
				if v_u_42() or (next(v_u_26.PetsData.PetInventory.Data) ~= nil or v_u_44()) then
					v126 = true
				else
					v_u_16:CreateNotification("Buy a Common Egg!")
					v126 = true
				end
				if v126 then
					v_u_2.GameEvents.EggTutorial:FireServer(4)
					if v85() then
						v_u_2.GameEvents.EggTutorial:FireServer(5)
						if v103() then
							v_u_2.GameEvents.EggTutorial:FireServer(6)
							if v107() then
								v_u_2.GameEvents.EggTutorial:FireServer(7)
								if v125() then
									v_u_2.GameEvents.EggTutorial:FireServer(8)
									break
								end
							end
						end
					end
				end
			end
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_15, (copy) v_u_2, (copy) v_u_127
		if not v_u_15:IsInWorld() then
			v_u_2.GameEvents.EggTutorial.OnClientEvent:Connect(function(_)
				-- upvalues: (ref) v_u_127
				v_u_127:Run()
			end)
		end
	end
}
task.spawn(v_u_127.Start, v_u_127)
return v_u_127