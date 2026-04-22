local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local v_u_3 = require(v2.Arrow_Module)
local v_u_4 = require(v2.Modules.PlantTraitsData)
local v5 = require(v2.Modules.UpdateService)
local v_u_6 = require(v2.Modules.DataService)
local v7 = require(v2.Data.TradeWorldData)
require(v2.Modules.GetFarm)
local v_u_8 = require(v2.Modules.GetFarmAsync)
local v_u_9 = require(v2.Modules.Notification)
require(v2.Modules.TutorialController.TutorialUtils)
require(v2.Modules.DeviceController)
local v_u_10 = v1.LocalPlayer
assert(v_u_10, "LocalPlayer not found")
if game.PlaceId == v7.PlaceId then
	return
else
	if not v_u_10.Character then
		v_u_10.CharacterAdded:Wait()
	end
	if not v5:IsUpdateDone() then
		v5.OnUpdated:Wait()
	end
	local v_u_11 = v_u_6:GetData()
	while not v_u_11 do
		task.wait(1)
		v_u_11 = v_u_6:GetData()
	end
	if v_u_10:GetAttribute("InTutorial") then
		while v_u_10:GetAttribute("InTutorial") do
			task.wait(1)
		end
		task.wait(2)
	end
	local v_u_12 = v_u_11.EasterEventData
	warn("[FTUE] EARLY CHECK \226\128\148 easterData exists:", v_u_12 ~= nil)
	if v_u_12 then
		warn("[FTUE] FLAGS:", "HasEnabled=", v_u_12.HasEnabledEasterGarden, "HasPurchased=", v_u_12.HasPurchasedEasterPlant, "HasSold=", v_u_12.HasSoldEasterPlant, "HasSeenPopup=", v_u_12.HasSeenPopup, "HasStarterPack=", v_u_12.HasBeenGivenStarterPack)
	end
	if v_u_12 and v_u_12.HasSoldEasterPlant == true then
		warn("[FTUE] EXITING \226\128\148 HasSoldEasterPlant is true")
		return
	elseif workspace:FindFirstChild("Tutorial_Arrows") then
		local v13 = workspace.Interaction:FindFirstChild("UpdateItems")
		local v14
		if v13 then
			v14 = v13:FindFirstChild("Easter2026")
		else
			v14 = v13
		end
		if not v14 then
			local v15 = v2.Modules:FindFirstChild("UpdateService")
			if v15 then
				v14 = v15:FindFirstChild("Easter2026")
				if v14 and v13 then
					v14.Parent = v13
				end
			end
		end
		if v14 then
			local v16 = v14:FindFirstChild("EasterShop")
			local v17 = v14:FindFirstChild("SellStuff")
			if v16 and v17 then
				local v18 = v16:FindFirstChild("Poppy")
				local v_u_19
				if v18 and v18:FindFirstChild("HumanoidRootPart") then
					v_u_19 = v18.HumanoidRootPart.Position
				else
					v_u_19 = v16:GetPivot().Position
				end
				local v20 = v17:FindFirstChild("Alan", true)
				local v_u_21
				if v20 and v20:FindFirstChild("HumanoidRootPart") then
					v_u_21 = v20.HumanoidRootPart.Position
				else
					v_u_21 = v17:GetPivot().Position
				end
				local function v_u_31()
					-- upvalues: (copy) v_u_10, (copy) v_u_4
					for _, v22 in v_u_10.Backpack:GetChildren() do
						local v23
						if v22:IsA("Tool") then
							local v24 = v22:FindFirstChild("Item_String")
							local v25
							if v24 and (v24:IsA("StringValue") and v24.Value ~= "") then
								v25 = v24.Value
							else
								v25 = nil
							end
							if v25 then
								v23 = v_u_4.HasTrait(v25, "Easter")
							else
								v23 = false
							end
						else
							v23 = false
						end
						if v23 then
							return true
						end
					end
					local v26 = v_u_10.Character
					local v27 = v26 and v26:FindFirstChildWhichIsA("Tool")
					if v27 then
						local v28
						if v27:IsA("Tool") then
							local v29 = v27:FindFirstChild("Item_String")
							local v30
							if v29 and (v29:IsA("StringValue") and v29.Value ~= "") then
								v30 = v29.Value
							else
								v30 = nil
							end
							if v30 then
								v28 = v_u_4.HasTrait(v30, "Easter")
							else
								v28 = false
							end
						else
							v28 = false
						end
						if v28 then
							return true
						end
					end
					return false
				end
				local function v_u_34(p32)
					-- upvalues: (copy) v_u_4
					if p32:IsA("Tool") then
						if string.find(p32.Name, "Seed") then
							local v33 = p32:GetAttribute("Seed")
							if v33 then
								return v_u_4.HasTrait(v33, "Easter")
							else
								return false
							end
						else
							return false
						end
					else
						return false
					end
				end
				local function v_u_38()
					-- upvalues: (copy) v_u_10, (copy) v_u_34
					for _, v35 in v_u_10.Backpack:GetChildren() do
						if v_u_34(v35) then
							return true
						end
					end
					local v36 = v_u_10.Character
					if v36 then
						local v37 = v36:FindFirstChildWhichIsA("Tool")
						if v37 and v_u_34(v37) then
							return true
						end
					end
					return false
				end
				local v_u_39 = nil
				local v_u_40 = false
				local function v_u_42(p41)
					-- upvalues: (ref) v_u_40, (copy) v_u_10, (ref) v_u_39, (copy) v_u_3
					if not v_u_40 then
						while not (v_u_10.Character and v_u_10.Character:FindFirstChild("HumanoidRootPart")) do
							v_u_10.CharacterAdded:Wait()
							task.wait(0.5)
						end
						v_u_40 = true
						v_u_39 = v_u_3.GenerateArrow(v_u_10, p41, math.random(1, 1000000))
					end
				end
				local v_u_43 = v_u_10.CharacterAdded:Connect(function()
					-- upvalues: (ref) v_u_40, (ref) v_u_39, (copy) v_u_3
					if v_u_40 then
						v_u_40 = false
						if v_u_39 then
							v_u_3.Remove_Arrow(v_u_39)
							v_u_39 = nil
						end
					end
				end)
				local function v_u_50(p44, p45)
					-- upvalues: (copy) v_u_10, (ref) v_u_11, (copy) v_u_6, (ref) v_u_12
					while not v_u_10:GetAttribute(p44) do
						v_u_11 = v_u_6:GetData()
						local v46 = v_u_11
						if v46 then
							v46 = v_u_11.EasterEventData
						end
						v_u_12 = v46
						if p45() then
							return
						end
						local v_u_47 = false
						local v48 = v_u_10:GetAttributeChangedSignal(p44):Connect(function()
							-- upvalues: (ref) v_u_47
							v_u_47 = true
						end)
						local v49 = os.clock()
						while not v_u_47 and os.clock() - v49 < 3 do
							task.wait(0.2)
						end
						v48:Disconnect()
					end
				end
				local function v_u_62()
					-- upvalues: (copy) v_u_31, (copy) v_u_10, (copy) v_u_4
					if not v_u_31() then
						local v_u_51 = false
						local v56 = v_u_10.Backpack.ChildAdded:Connect(function(p52)
							-- upvalues: (ref) v_u_4, (ref) v_u_51
							if p52:IsA("Tool") then
								local v53
								if p52:IsA("Tool") then
									local v54 = p52:FindFirstChild("Item_String")
									local v55
									if v54 and (v54:IsA("StringValue") and v54.Value ~= "") then
										v55 = v54.Value
									else
										v55 = nil
									end
									if v55 then
										v53 = v_u_4.HasTrait(v55, "Easter")
									else
										v53 = false
									end
								else
									v53 = false
								end
								if v53 then
									v_u_51 = true
								end
							end
						end)
						local v57
						if v_u_10.Character then
							v57 = v_u_10.Character.ChildAdded:Connect(function(p58)
								-- upvalues: (ref) v_u_4, (ref) v_u_51
								if p58:IsA("Tool") then
									local v59
									if p58:IsA("Tool") then
										local v60 = p58:FindFirstChild("Item_String")
										local v61
										if v60 and (v60:IsA("StringValue") and v60.Value ~= "") then
											v61 = v60.Value
										else
											v61 = nil
										end
										if v61 then
											v59 = v_u_4.HasTrait(v61, "Easter")
										else
											v59 = false
										end
									else
										v59 = false
									end
									if v59 then
										v_u_51 = true
									end
								end
							end)
						else
							v57 = nil
						end
						while not v_u_51 do
							task.wait(0.5)
							v_u_51 = v_u_31() and true or v_u_51
						end
						v56:Disconnect()
						if v57 then
							v57:Disconnect()
						end
					end
				end
				task.spawn(function()
					-- upvalues: (ref) v_u_11, (copy) v_u_6, (ref) v_u_12, (copy) v_u_38, (copy) v_u_31, (copy) v_u_8, (copy) v_u_10, (copy) v_u_42, (ref) v_u_40, (ref) v_u_39, (copy) v_u_3, (ref) v_u_19, (copy) v_u_9, (copy) v_u_50, (copy) v_u_62, (ref) v_u_21, (copy) v_u_43
					v_u_11 = v_u_6:GetData()
					local v63 = v_u_11
					if v63 then
						v63 = v_u_11.EasterEventData
					end
					v_u_12 = v63
					local v64 = warn
					local v65 = "[FTUE] START"
					local v66 = "HasEnabled="
					local v67 = v_u_12
					if v67 then
						v67 = v_u_12.HasEnabledEasterGarden
					end
					local v68 = "HasPurchased="
					local v69 = v_u_12
					if v69 then
						v69 = v_u_12.HasPurchasedEasterPlant
					end
					local v70 = "HasSold="
					local v71 = v_u_12
					if v71 then
						v71 = v_u_12.HasSoldEasterPlant
					end
					v64(v65, v66, v67, v68, v69, v70, v71, "hasSeed=", v_u_38(), "hasFruit=", (v_u_31()))
					v_u_11 = v_u_6:GetData()
					local v72 = v_u_11
					if v72 then
						v72 = v_u_11.EasterEventData
					end
					v_u_12 = v72
					v_u_11 = v_u_6:GetData()
					local v73 = v_u_11
					if v73 then
						v73 = v_u_11.EasterEventData
					end
					v_u_12 = v73
					local v74
					if v_u_11 and (v_u_11.SaveSlots and v_u_11.SaveSlots.AllSlots) then
						v74 = v_u_11.SaveSlots.AllSlots.EASTER_2026 ~= nil
					else
						v74 = false
					end
					local v75 = not v74 and v_u_8(v_u_10)
					local v76 = v75 and (v75:FindFirstChild("EasterSign") or v75:WaitForChild("EasterSign", 30))
					if v76 then
						local v77 = v76:FindFirstChild("Sign_Part")
						local v78
						if v77 then
							v78 = v77.Position
						else
							v78 = v76:GetPivot().Position
						end
						v_u_42(v78)
						while true do
							v_u_11 = v_u_6:GetData()
							local v79 = v_u_11
							if v79 then
								v79 = v_u_11.EasterEventData
							end
							v_u_12 = v79
							local v80
							if v_u_11 and (v_u_11.SaveSlots and v_u_11.SaveSlots.AllSlots) then
								v80 = v_u_11.SaveSlots.AllSlots.EASTER_2026 ~= nil
							else
								v80 = false
							end
							if v80 then
								break
							end
							task.wait(1)
						end
						if v_u_40 then
							v_u_40 = false
							if v_u_39 then
								v_u_3.Remove_Arrow(v_u_39)
								v_u_39 = nil
							end
						end
					end
					v_u_11 = v_u_6:GetData()
					local v81 = v_u_11
					if v81 then
						v81 = v_u_11.EasterEventData
					end
					v_u_12 = v81
					if not (v_u_12 and v_u_12.HasPurchasedEasterPlant) then
						while true do
							v_u_11 = v_u_6:GetData()
							local v82 = v_u_11
							if v82 then
								v82 = v_u_11.EasterEventData
							end
							v_u_12 = v82
							if (v_u_11 and (v_u_11.SpecialCurrency and v_u_11.SpecialCurrency.ChocCoins) or 0) >= 1 or v_u_12 and v_u_12.HasPurchasedEasterPlant then
								break
							end
							task.wait(2)
						end
						v_u_11 = v_u_6:GetData()
						local v83 = v_u_11
						if v83 then
							v83 = v_u_11.EasterEventData
						end
						v_u_12 = v83
						if not (v_u_12 and v_u_12.HasPurchasedEasterPlant) then
							v_u_42(v_u_19)
							v_u_9:CreateNotification("Buy easter seeds, using chocolate coins")
							v_u_50("HasPurchasedEasterPlant", function()
								-- upvalues: (ref) v_u_12
								local v84 = v_u_12
								if v84 then
									v84 = v_u_12.HasPurchasedEasterPlant == true
								end
								return v84
							end)
							warn("[FTUE] Step 2 purchase detected, hiding beam")
							if v_u_40 then
								v_u_40 = false
								if v_u_39 then
									v_u_3.Remove_Arrow(v_u_39)
									v_u_39 = nil
								end
							end
						end
					end
					v_u_11 = v_u_6:GetData()
					local v85 = v_u_11
					if v85 then
						v85 = v_u_11.EasterEventData
					end
					v_u_12 = v85
					local v86 = warn
					local v87 = "[FTUE] Step 3 check:"
					local v88 = "HasSold="
					local v89 = v_u_12
					if v89 then
						v89 = v_u_12.HasSoldEasterPlant
					end
					v86(v87, v88, v89, "hasFruit=", v_u_31(), "hasSeed=", (v_u_38()))
					if not (v_u_12 and v_u_12.HasSoldEasterPlant) and (not v_u_31() and v_u_38()) then
						warn("[FTUE] Step 3 ENTERED - guiding to plant")
						local v90 = v_u_8(v_u_10)
						local v91 = v90 and v90:FindFirstChild("Spawn_Point")
						if v91 then
							v_u_42((v91.CFrame * CFrame.new(0, 0, -10)).Position)
							v_u_9:CreateNotification("Go to your plot and plant your Easter seed!")
							local v92 = v90:FindFirstChild("Important")
							if v92 then
								v92 = v90.Important:FindFirstChild("Plants_Physical")
							end
							if v92 then
								while #v92:GetChildren() <= 0 do
									task.wait(0.5)
								end
							end
							if v_u_40 then
								v_u_40 = false
								if v_u_39 then
									v_u_3.Remove_Arrow(v_u_39)
									v_u_39 = nil
								end
							end
							v_u_9:CreateNotification("Wait for your plant to grow then collect it!")
						end
					end
					v_u_11 = v_u_6:GetData()
					local v93 = v_u_11
					if v93 then
						v93 = v_u_11.EasterEventData
					end
					v_u_12 = v93
					if not (v_u_12 and v_u_12.HasSoldEasterPlant) then
						if not v_u_31() then
							local v94 = v_u_8(v_u_10)
							local v95 = v94 and v94:FindFirstChild("Spawn_Point")
							if v95 then
								v_u_42((v95.CFrame * CFrame.new(0, 0, -10)).Position)
								v_u_9:CreateNotification("Collect your Easter plant!")
							end
						end
						v_u_62()
						if v_u_40 then
							v_u_40 = false
							if v_u_39 then
								v_u_3.Remove_Arrow(v_u_39)
								v_u_39 = nil
							end
						end
						v_u_42(v_u_21)
						v_u_9:CreateNotification("Sell your Easter plant here!")
						v_u_50("HasSoldEasterPlant", function()
							-- upvalues: (ref) v_u_12
							local v96 = v_u_12
							if v96 then
								v96 = v_u_12.HasSoldEasterPlant == true
							end
							return v96
						end)
						if v_u_40 then
							v_u_40 = false
							if v_u_39 then
								v_u_3.Remove_Arrow(v_u_39)
								v_u_39 = nil
							end
						end
					end
					v_u_43:Disconnect()
				end)
			end
		else
			return
		end
	else
		warn("[FTUE] EXITING \226\128\148 no Tutorial_Arrows")
		return
	end
end