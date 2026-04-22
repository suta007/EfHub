local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = require(v_u_1.Modules.NPCDialogueController)
local v_u_5 = require(v_u_1.Modules.GameConfigController)
local v_u_6 = require(v_u_1.Modules.CreateTagHandler)
local v_u_7 = require(v_u_1.Modules.InventoryService)
local v_u_8 = require(v_u_1.Modules.GuiController)
local v_u_9 = require(v_u_1.Modules.Notification)
local v_u_10 = require(v_u_1.Modules.DataService)
local v_u_11 = require(v_u_1.Field_Of_View_Module)
local v_u_12 = require(v_u_1.Modules.Spring)
local v_u_13 = require(v_u_1.Modules.Chalk)
local v_u_14 = require(v_u_1.Top_Text)
local v_u_15 = require(v_u_1.Blur_Module)
local v_u_16 = v3.LocalPlayer
local v17 = v_u_16:WaitForChild("PlayerGui")
local v_u_18 = v17:WaitForChild("Teleport_UI")
local v_u_19 = v17:WaitForChild("CandyBlossomCraftingUI")
local v20 = {}
local v_u_21 = require(script.Config).Item
local v_u_22 = {
	["Golden Egg"] = true,
	["Premium Golden Egg"] = true,
	[v_u_21] = true
}
function v20.Start()
	-- upvalues: (copy) v_u_19, (copy) v_u_8, (copy) v_u_11, (copy) v_u_18, (copy) v_u_15, (copy) v_u_2, (copy) v_u_5, (copy) v_u_10, (copy) v_u_21, (copy) v_u_9, (copy) v_u_13, (copy) v_u_1, (copy) v_u_16, (copy) v_u_7, (copy) v_u_22, (copy) v_u_12, (copy) v_u_6, (copy) v_u_14, (copy) v_u_4
	v_u_19.Easter.Header.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_19
		v_u_8:Close(v_u_19)
	end)
	local v23 = v_u_8:GetStateForGui(v_u_19)
	v23.ChangeEnabled:Set(true)
	v23.Visible:Observe(function(p24)
		-- upvalues: (ref) v_u_11, (ref) v_u_18, (ref) v_u_15, (ref) v_u_19
		v_u_11.Change_FOV(p24 and 60 or 70)
		v_u_18.Enabled = not p24
		v_u_15.Blur(p24 and 15 or 0, 0.1)
		if not p24 then
			v_u_19.Easter.Main.Content.Holder.CraftContent.SeedProgress.Info.Tooltip.Visible = false
		end
	end)
	local v_u_25 = v_u_19.Easter.Main.Content.Tap.Rays.Rays
	local v_u_26 = v_u_19.Easter.Main.Content.Holder.ValueContent.Slots.Ingredient2.UIStroke.UIGradient
	v_u_2.Heartbeat:Connect(function(p27)
		-- upvalues: (copy) v_u_25, (copy) v_u_26
		v_u_25.Rotation = (v_u_25.Rotation + p27 * 30) % 360
		v_u_26.Rotation = (v_u_26.Rotation + p27 * 30) % 360
	end)
	v_u_19.Easter.Main.Content.Holder.CraftContent.CantSubmitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_13, (ref) v_u_21
		v_u_9:CreateNotification((("Hold out a %* or a %* to submit your entry!"):format(v_u_13.yellow("[Golden Egg]"), (v_u_13.color(0, 229, 255)((("[%*]"):format(v_u_21)))))))
	end)
	v_u_19.Easter.Main.Content.Holder.CraftContent.SubmitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_5, (ref) v_u_21, (ref) v_u_1
		local v28 = v_u_10:GetData()
		local v29
		if v28 then
			local v30 = v28.CandyBlossomCraftingProgress.Eggs
			local v31 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_REQUIREMENT")
			local v32 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_GROWTH")
			local v33 = v_u_10:GetData()
			if v33 and v33.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
				v31 = v31 + v32 * v33.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
			end
			if v30 < v31 then
				v29 = false
			else
				local v34 = v28.CandyBlossomCraftingProgress[v_u_21] or 0
				local v35 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_REQUIREMENT")
				local v36 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_GROWTH")
				local v37 = v_u_10:GetData()
				if v37 and v37.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
					v35 = v35 + v36 * v37.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
				end
				v29 = v34 >= v35
			end
		else
			v29 = false
		end
		if v29 then
			v_u_1.GameEvents.CandyBlossomCrafting.Craft:FireServer()
		else
			v_u_1.GameEvents.CandyBlossomCrafting.Submit:FireServer()
		end
	end)
	local function v_u_52()
		-- upvalues: (ref) v_u_10, (ref) v_u_5, (ref) v_u_21, (ref) v_u_16, (ref) v_u_7, (ref) v_u_22, (ref) v_u_19
		local v38 = v_u_10:GetData()
		local v39
		if v38 then
			local v40 = v38.CandyBlossomCraftingProgress.Eggs
			local v41 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_REQUIREMENT")
			local v42 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_GROWTH")
			local v43 = v_u_10:GetData()
			if v43 and v43.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
				v41 = v41 + v42 * v43.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
			end
			if v40 < v41 then
				v39 = false
			else
				local v44 = v38.CandyBlossomCraftingProgress[v_u_21] or 0
				local v45 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_REQUIREMENT")
				local v46 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_GROWTH")
				local v47 = v_u_10:GetData()
				if v47 and v47.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
					v45 = v45 + v46 * v47.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
				end
				v39 = v44 >= v45
			end
		else
			v39 = false
		end
		local v48
		if v39 then
			v48 = v39
		else
			local v49 = v_u_16.Character
			if v49 then
				local v50 = v49:FindFirstChildOfClass("Tool")
				if v50 then
					local v51 = v_u_7:GetToolData(v50)
					if v51 then
						v48 = (v_u_22[v51.ItemData.EggName] or v_u_22[v51.ItemType]) and true or nil
					else
						v48 = nil
					end
				else
					v48 = nil
				end
			else
				v48 = nil
			end
		end
		v_u_19.Easter.Main.Content.Holder.CraftContent.CantSubmitButton.Visible = not v48
		v_u_19.Easter.Main.Content.Holder.CraftContent.SubmitButton.Title.Text = v39 and "CRAFT" or "SUBMIT"
		v_u_19.Easter.Main.Content.Holder.CraftContent.SubmitButton.Visible = v48
	end
	local function v54()
		-- upvalues: (ref) v_u_16, (copy) v_u_52
		local v53 = v_u_16.Character
		if v53 then
			v53.ChildAdded:Connect(v_u_52)
			v53.ChildRemoved:Connect(v_u_52)
		end
	end
	local v55 = v_u_16.Character
	if v55 then
		v55.ChildAdded:Connect(v_u_52)
		v55.ChildRemoved:Connect(v_u_52)
	end
	v_u_16.CharacterAdded:Connect(v54)
	task.spawn(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_5, (ref) v_u_12, (ref) v_u_19, (ref) v_u_21, (copy) v_u_52
		local v_u_56 = v_u_10:GetData()
		local function v86()
			-- upvalues: (copy) v_u_56, (ref) v_u_5, (ref) v_u_10, (ref) v_u_12, (ref) v_u_19, (ref) v_u_21, (ref) v_u_52
			local v57 = v_u_56.CandyBlossomCraftingProgress.Eggs
			local v58 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_REQUIREMENT")
			local v59 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_GROWTH")
			local v60 = v_u_10:GetData()
			if v60 and v60.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
				v58 = v58 + v59 * v60.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
			end
			local v61 = v57 / v58
			local v62 = math.clamp(v61, 0, 100)
			v_u_12.target(v_u_19.Easter.Main.Content.Holder.CraftContent.ProgressBar.ProgressBarInner.UIGradient, 1, 3, {
				["Offset"] = Vector2.xAxis * (v62 - 0.5)
			})
			v_u_12.target(v_u_19.Easter.Main.Content.Holder.CraftContent.ProgressBar.Indicator, 1, 3, {
				["Position"] = UDim2.fromScale(v62, 0.5)
			})
			local v63 = v_u_19.Easter.Main.Content.Holder.CraftContent.SeedLabel
			local v64 = "%*/%*"
			local v65 = v_u_56.CandyBlossomCraftingProgress[v_u_21] or 0
			local v66 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_REQUIREMENT")
			local v67 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_GROWTH")
			local v68 = v_u_10:GetData()
			if v68 and v68.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
				v66 = v66 + v67 * v68.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
			end
			v63.Text = v64:format(v65, v66)
			local v69 = v_u_19.Easter.Main.Content.Holder.CraftContent.Holder.ProgressLabel
			local v70 = "%*/%* Eggs"
			local v71 = v_u_56.CandyBlossomCraftingProgress.Eggs
			local v72 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_REQUIREMENT")
			local v73 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_GROWTH")
			local v74 = v_u_10:GetData()
			if v74 and v74.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
				v72 = v72 + v73 * v74.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
			end
			v69.Text = v70:format(v71, v72)
			local v75 = v_u_56.CandyBlossomCraftingProgress.Eggs + (v_u_56.CandyBlossomCraftingProgress[v_u_21] or 0)
			local v76 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_REQUIREMENT")
			local v77 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_GROWTH")
			local v78 = v_u_10:GetData()
			if v78 and v78.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
				v76 = v76 + v77 * v78.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
			end
			local v79 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_REQUIREMENT")
			local v80 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_GROWTH")
			local v81 = v_u_10:GetData()
			if v81 and v81.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
				v79 = v79 + v80 * v81.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
			end
			local v82 = v76 + v79
			local v83 = v_u_19.Easter.Main.Content.Holder.CraftContent.Header.Title
			local v84 = v75 / v82 * 100
			local v85 = math.clamp(v84, 0, 100) * 10
			v83.Text = ("Craft Progress [%*%%]"):format(math.round(v85) / 10)
			v_u_52()
		end
		workspace:GetAttributeChangedSignal("CandyBlossomCrafting_EGG_GROWTH"):Connect(v86)
		workspace:GetAttributeChangedSignal("CandyBlossomCrafting_ITEM_GROWTH"):Connect(v86)
		workspace:GetAttributeChangedSignal("CandyBlossomCrafting_EGG_REQUIREMENT"):Connect(v86)
		workspace:GetAttributeChangedSignal("CandyBlossomCrafting_ITEM_REQUIREMENT"):Connect(v86)
		v86()
		v_u_10:GetPathSignal("CandyBlossomCraftingProgress/Eggs"):Connect(v86)
		local v87 = v_u_10:GetPathSignal((("CandyBlossomCraftingProgress/%*"):format(v_u_21)))
		if v87 then
			v87:Connect(v86)
		else
			warn((("CandyBlossomCraftingController/Start: Failed to fetch PathSignal for Item: %*"):format(v_u_21)))
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_19
		v_u_19.Easter.Main.Content.Holder.CraftContent.SeedProgress.Info.Activated:Connect(function()
			-- upvalues: (ref) v_u_19
			v_u_19.Easter.Main.Content.Holder.CraftContent.SeedProgress.Info.Tooltip.Visible = not v_u_19.Easter.Main.Content.Holder.CraftContent.SeedProgress.Info.Tooltip.Visible
		end)
	end)
	local v_u_88 = { "View Crafting Menu", "Submit Golden Egg / Shard", "How does this work?" }
	v_u_6({
		["Tag"] = "CandyBlossomCrafting",
		["OnInstanceAdded"] = function(p_u_89)
			-- upvalues: (copy) v_u_88, (ref) v_u_8, (ref) v_u_19, (ref) v_u_16, (ref) v_u_7, (ref) v_u_22, (ref) v_u_10, (ref) v_u_5, (ref) v_u_21, (ref) v_u_1, (ref) v_u_14, (ref) v_u_13, (ref) v_u_4
			local v90 = p_u_89:WaitForChild("ProximityPrompt")
			local v91 = p_u_89:WaitForChild("HumanoidRootPart"):WaitForChild("Exit_Detection")
			local v115 = {
				[v_u_88[1]] = function()
					-- upvalues: (ref) v_u_8, (ref) v_u_19
					v_u_8:Open(v_u_19)
				end,
				[v_u_88[2]] = function()
					-- upvalues: (ref) v_u_16, (ref) v_u_7, (ref) v_u_22, (ref) v_u_10, (ref) v_u_5, (ref) v_u_21, (ref) v_u_1, (ref) v_u_14, (copy) p_u_89, (ref) v_u_13
					task.wait(0.5)
					local v92 = v_u_16.Character
					local v93
					if v92 then
						local v94 = v92:FindFirstChildOfClass("Tool")
						if v94 then
							local v95 = v_u_7:GetToolData(v94)
							if v95 then
								v93 = (v_u_22[v95.ItemData.EggName] or v_u_22[v95.ItemType]) and true or nil
							else
								v93 = nil
							end
						else
							v93 = nil
						end
					else
						v93 = nil
					end
					if v93 then
						local v96 = v_u_10:GetData()
						local v97
						if v96 then
							local v98 = v96.CandyBlossomCraftingProgress.Eggs
							local v99 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_REQUIREMENT")
							local v100 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_GROWTH")
							local v101 = v_u_10:GetData()
							if v101 and v101.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
								v99 = v99 + v100 * v101.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
							end
							if v98 < v99 then
								v97 = false
							else
								local v102 = v96.CandyBlossomCraftingProgress[v_u_21] or 0
								local v103 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_REQUIREMENT")
								local v104 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_GROWTH")
								local v105 = v_u_10:GetData()
								if v105 and v105.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
									v103 = v103 + v104 * v105.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
								end
								v97 = v102 >= v103
							end
						else
							v97 = false
						end
						if v97 then
							v_u_1.GameEvents.CandyBlossomCrafting.Craft:FireServer()
						else
							v_u_1.GameEvents.CandyBlossomCrafting.Submit:FireServer()
						end
					else
						v_u_14.NpcText(p_u_89, (("You must hold out a %*/%*!"):format(v_u_13.yellow("Golden Egg"), (v_u_13.color(0, 229, 255)("Shard")))))
						task.wait(2)
						return
					end
				end,
				[v_u_88[3]] = function()
					-- upvalues: (ref) v_u_5, (ref) v_u_10, (ref) v_u_14, (copy) p_u_89, (ref) v_u_13
					task.wait(0.5)
					local v106 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_REQUIREMENT")
					local v107 = v_u_5:GetConfig("CandyBlossomCrafting_ITEM_GROWTH")
					local v108 = v_u_10:GetData()
					if v108 and v108.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
						v106 = v106 + v107 * v108.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
					end
					local v109 = v_u_14.NpcText
					local v110 = p_u_89
					local v111 = "Upon submitting %* %* and %* %*..."
					local v112 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_REQUIREMENT")
					local v113 = v_u_5:GetConfig("CandyBlossomCrafting_EGG_GROWTH")
					local v114 = v_u_10:GetData()
					if v114 and v114.CandyBlossomCraftingProgress.CRAFTS_COMPLETED then
						v112 = v112 + v113 * v114.CandyBlossomCraftingProgress.CRAFTS_COMPLETED
					end
					v109(v110, (v111:format(v112, v_u_13.yellow("Golden Eggs"), v106, (v_u_13.color(0, 229, 255)((("Candy Blossom Shard%*"):format(v106 == 1 and "" or "s")))))))
					task.wait(2)
					v_u_14.NpcText(p_u_89, (("...You may craft a %*!"):format((v_u_13.color(255, 133, 255)("Candy Blossom Seed")))))
					task.wait(2)
					v_u_14.NpcText(p_u_89, (("A %* is obtained every 25 fruits you submit to the Angry Plant!"):format((v_u_13.color(0, 229, 255)("Shard")))))
					task.wait(3)
					v_u_14.NpcText(p_u_89, (("Also, the requirements go up with each crafted %*..."):format((v_u_13.color(255, 133, 255)("Candy Blossom Seed")))))
					task.wait(3)
				end
			}
			v90.ObjectText = p_u_89.Name
			v_u_4:Start({
				["SpeakingNPC"] = p_u_89,
				["ProximityPrompt"] = v90,
				["PromptList"] = v_u_88,
				["OperationMap"] = v115,
				["IntroLines"] = { "Happy Easter!!" }
			})
			v91.PromptHidden:Connect(function()
				-- upvalues: (ref) v_u_8, (ref) v_u_19
				v_u_8:Close(v_u_19)
			end)
		end
	})
end
task.spawn(v20.Start)
return v20