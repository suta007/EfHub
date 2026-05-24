local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(v1.Modules.DataService)
local v_u_5 = require(v1.Data.BeeEvent.QueenHiveConfig)
require(v1.Modules.NPCDialogueController)
require(v1.Top_Text)
require(v1.Modules.UpdateService)
local v_u_6 = require(v1.Data.DevProductIds)
local v_u_7 = require(v1.Modules.ConfirmationPromptController)
local v_u_8 = require(v1.Modules.MarketController)
local v_u_9 = require(v1.Modules.SelectiveAssetReplication)
local v_u_10 = require(v1.Data.SeedData)
local v_u_11 = require(v1.Data.EventShopData)
require(v1.Data.GrowableData)
local v_u_12 = require(v1.Modules.TimeHelper)
local v_u_13 = v1:WaitForChild("GameEvents"):WaitForChild("BeeQueenHiveRemote")
local v14 = workspace:WaitForChild("Interaction"):WaitForChild("BeeEvent"):FindFirstChild("Incubator", true)
local v_u_15 = v14:FindFirstChild("Machine")
local v_u_16 = v14:FindFirstChild("TimerGui", true)
local v_u_17 = v14:FindFirstChild("StartPrompt", true)
local v_u_18 = v14:FindFirstChild("InsertPrompt", true)
local v_u_19 = v14:FindFirstChild("SeedSpawn", true)
local v_u_20 = v14:FindFirstChild("SoundLoop1", true)
local v_u_21 = v14:FindFirstChild("SoundLoop2", true)
local v_u_22 = v14:FindFirstChild("JarHoney", true)
local v_u_23 = v14:FindFirstChild("PourLoopSound", true)
v14:FindFirstChild("PourStartSound", true)
local v_u_24 = v14:FindFirstChild("FlowPart", true)
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = v_u_15:GetPivot()
local v_u_28 = v_u_22.Size
local v_u_29 = v_u_22.Position
local v_u_68 = {
	["ShakeMachine"] = function(_, p30) -- name: ShakeMachine
		-- upvalues: (copy) v_u_15, (copy) v_u_27
		local v31 = p30 or 0.01
		local v32 = math.random(-100, 100) / 100 * v31
		local v33 = math.random(-100, 100) / 100 * v31
		v_u_15:PivotTo(v_u_27 + Vector3.new(v32, 0, v33))
	end,
	["DoPourAnimationAsync"] = function(_) -- name: DoPourAnimationAsync
		-- upvalues: (copy) v_u_4, (ref) v_u_26, (copy) v_u_24, (copy) v_u_22, (copy) v_u_28, (copy) v_u_29, (copy) v_u_23, (copy) v_u_3, (copy) v_u_9
		local v34 = v_u_4:GetData().BeeEventData.HoneyIncubatorData.CurrentSeed
		if v34 == "" then
			warn("[QueenHiveController] no current seed, aborting pour animation")
			return
		else
			if v_u_26 then
				v_u_26:Destroy()
				v_u_26 = nil
			end
			v_u_24.Transparency = 0
			v_u_22.Transparency = 0
			v_u_22.Size = v_u_28 * Vector3.new(1, 0, 1)
			v_u_22.Position = v_u_29 - v_u_28.Y * Vector3.new(0, 1, 0) / 2
			v_u_23:Play()
			local v35 = {
				["Size"] = v_u_28,
				["Position"] = v_u_29
			}
			local v36 = v_u_3:Create(v_u_22, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), v35)
			v36:Play()
			v36.Completed:Wait()
			local v37 = string.match(v34, "^Honey (.*)")
			if v37 then
				v_u_26 = v_u_9:GetAssetAsync("Seed_Models", v37):Clone()
				v_u_26.CFrame = CFrame.new(v_u_29) * CFrame.Angles(0, 0, 1.5707963267948966)
				v_u_26.Anchored = true
				v_u_26.Parent = workspace
				v_u_24.Transparency = 1
				v_u_23:Stop()
				local v38 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
				local v39 = v_u_3
				local v40 = v_u_26
				local v41 = {}
				local v42 = CFrame.new
				local v43 = v_u_29
				local v44 = v_u_28.Y / 2
				v41.CFrame = v42(v43 + Vector3.new(0, v44, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
				local v45 = v39:Create(v40, v38, v41)
				v45:Play()
				v45.Completed:Wait()
			else
				warn("[QueenHiveController] could not get CurrentSeed")
			end
		end
	end,
	["ResetPourAnimation"] = function(_) -- name: ResetPourAnimation
		-- upvalues: (copy) v_u_24, (copy) v_u_22, (copy) v_u_23, (ref) v_u_26
		v_u_24.Transparency = 1
		v_u_22.Transparency = 1
		v_u_23:Stop()
		if v_u_26 then
			v_u_26:Destroy()
			v_u_26 = nil
		end
	end,
	["UpdatePourAnimations"] = function(_) -- name: UpdatePourAnimations
		-- upvalues: (copy) v_u_4, (copy) v_u_68
		if v_u_4:GetData().BeeEventData.HoneyIncubatorData.Claimable then
			v_u_68:DoPourAnimationAsync()
		else
			v_u_68:ResetPourAnimation()
		end
	end,
	["UpdatePrompts"] = function(_) -- name: UpdatePrompts
		-- upvalues: (copy) v_u_4, (copy) v_u_17, (copy) v_u_5, (copy) v_u_18, (copy) v_u_16
		local v46 = v_u_4:GetData()
		if v46 then
			local v47 = v46.BeeEventData.HoneyIncubatorData
			if v47.Running or (v47.Claimable or v47.CurrentSeed == "") then
				v_u_17.Enabled = false
			else
				v_u_17.Enabled = true
				local v48 = v_u_5.RequiredHoneyCoinCosts[v47.CurrentSeed]
				v_u_17.ActionText = "Start Incubator"
				v_u_17.ObjectText = ("Cost: %* Honey Coins"):format(v48)
			end
			if v47.Running then
				v_u_18.KeyboardKeyCode = Enum.KeyCode.E
				v_u_18.ActionText = "Skip Incubator"
				v_u_18.ObjectText = "Incubator"
			elseif v47.Claimable then
				v_u_16.Holder.Timer.Text = "READY"
				v_u_18.KeyboardKeyCode = Enum.KeyCode.E
				v_u_18.ActionText = "Claim Seed"
				v_u_18.ObjectText = "Incubator"
			elseif v47.CurrentSeed == "" then
				v_u_16.Holder.Timer.Text = ""
				v_u_18.KeyboardKeyCode = Enum.KeyCode.E
				v_u_18.ActionText = "Insert Seed"
				v_u_18.ObjectText = "Incubator"
			else
				v_u_16.Holder.Timer.Text = ""
				v_u_18.KeyboardKeyCode = Enum.KeyCode.R
				v_u_18.ActionText = "Remove Seed"
				v_u_18.ObjectText = "Incubator"
			end
			local v49 = v_u_18
			v49.Enabled = false
			task.wait(0.1)
			v49.Enabled = true
		end
	end,
	["UpdateFloatingSeedModel"] = function(_) -- name: UpdateFloatingSeedModel
		-- upvalues: (copy) v_u_4, (ref) v_u_25, (copy) v_u_9, (copy) v_u_19
		local v50 = v_u_4:GetData().BeeEventData.HoneyIncubatorData
		if v_u_25 then
			v_u_25:Destroy()
			v_u_25 = nil
		end
		if v50.CurrentSeed == "" then
			return
		else
			local v51 = v_u_9:GetAssetAsync("Seed_Models", v50.CurrentSeed)
			if v51 then
				local v52 = Instance.new("Model")
				local v53 = v51:Clone()
				v53.Parent = v52
				v52:ScaleTo(2.5)
				v53.Anchored = true
				v53.CFrame = v_u_19.CFrame
				v53.Name = "Seed"
				v_u_25 = v52
				v52.Parent = workspace
			else
				warn("[QueenHiveController] could not get seed model from server")
			end
		end
	end,
	["Start"] = function(_) -- name: Start
		-- upvalues: (copy) v_u_18, (copy) v_u_4, (copy) v_u_13, (copy) v_u_6, (copy) v_u_10, (copy) v_u_11, (copy) v_u_8, (copy) v_u_17, (copy) v_u_7, (copy) v_u_68, (copy) v_u_20, (copy) v_u_21, (copy) v_u_5, (copy) v_u_12, (copy) v_u_16, (copy) v_u_2, (ref) v_u_25, (copy) v_u_19
		v_u_18.Triggered:Connect(function(_)
			-- upvalues: (ref) v_u_4, (ref) v_u_13, (ref) v_u_6, (ref) v_u_10, (ref) v_u_11, (ref) v_u_8
			local v54 = v_u_4:GetData().BeeEventData.HoneyIncubatorData
			if v54.Claimable then
				v_u_13:FireServer("ClaimSeed")
				return
			elseif v54.Running or v54.CurrentSeed == "" then
				if v54.Running or (v54.Claimable or v54.CurrentSeed ~= "") then
					local v55 = {
						["Common"] = v_u_6.SkipIncubatorCommonUncommon,
						["Uncommon"] = v_u_6.SkipIncubatorCommonUncommon,
						["Rare"] = v_u_6.SkipIncubatorRareMythical,
						["Legendary"] = v_u_6.SkipIncubatorRareMythical,
						["Mythical"] = v_u_6.SkipIncubatorRareMythical,
						["Divine"] = v_u_6.SkipIncubatorDivineTranscendent,
						["Prismatic"] = v_u_6.SkipIncubatorDivineTranscendent,
						["Transcendent"] = v_u_6.SkipIncubatorDivineTranscendent
					}
					local v56 = v54.CurrentSeed
					local v57 = v_u_10[v56] or (v_u_11["Honey Seed Shop"][v56] or v_u_11["Honey Coin Shop"][v56])
					if v57 then
						v57 = v57.SeedRarity
					end
					v_u_8:PromptPurchase((v57 and v55[v57] or v_u_6.SkipIncubatorCommonUncommon).PurchaseID, Enum.InfoType.Product)
				else
					v_u_13:FireServer("SubmitSeed")
				end
			else
				v_u_13:FireServer("RemoveSeed")
				return
			end
		end)
		v_u_17.Triggered:Connect(function(_)
			-- upvalues: (ref) v_u_4, (ref) v_u_13, (ref) v_u_7
			local v58 = {
				["ConfirmEvent"] = v_u_13,
				["ConfirmEventData"] = { "StartIncubator" },
				["ConfirmCallback"] = function() -- name: ConfirmCallback end,
				["RejectCallback"] = function() -- name: RejectCallback end
			}
			v_u_7:Open({
				["Title"] = "Incubate...",
				["Header"] = "Are you sure you want to incubate?",
				["Middle"] = nil,
				["Middle"] = ("%*"):format(v_u_4:GetData().BeeEventData.HoneyIncubatorData.CurrentSeed)
			}, v58)
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_68
			while true do
				while true do
					local v59 = v_u_4:GetData().BeeEventData.HoneyIncubatorData
					if not v59 then
						break
					end
					if v59.Running then
						v_u_68:ShakeMachine(0.025)
						task.wait(0.02)
					else
						task.wait(1)
					end
				end
				task.wait(1)
			end
		end)
		v_u_4:GetPathSignal("BeeEventData/HoneyIncubatorData/CurrentSeed"):Connect(function()
			-- upvalues: (ref) v_u_68
			v_u_68:UpdateFloatingSeedModel()
		end)
		v_u_4:GetPathSignal("BeeEventData/HoneyIncubatorData/Running"):Connect(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_20, (ref) v_u_21
			if v_u_4:GetData().BeeEventData.HoneyIncubatorData.Running then
				v_u_20:Play()
				v_u_21:Play()
			else
				v_u_20:Stop()
				v_u_21:Stop()
			end
		end)
		v_u_4:GetPathSignal("BeeEventData/HoneyIncubatorData/Claimable"):Connect(function()
			-- upvalues: (ref) v_u_68
			v_u_68:UpdatePourAnimations()
		end)
		v_u_4:GetPathSignal("BeeEventData/HoneyIncubatorData/*"):Connect(function()
			-- upvalues: (ref) v_u_68
			v_u_68:UpdatePrompts()
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_12, (ref) v_u_16
			while true do
				while true do
					local v60 = v_u_4:GetData().BeeEventData.HoneyIncubatorData
					if v60 and v60.Running then
						break
					end
					task.wait(1)
				end
				local v61 = workspace:GetServerTimeNow() - v60.StartTime
				local v62 = v_u_5.SeedConversionTimes[v60.CurrentSeed] - v61
				local v63 = v_u_12:GenerateColonFormatFromTime((math.max(v62, 0)))
				v_u_16.Holder.Timer.Text = ("Timer:\n%*"):format(v63)
				task.wait(1)
			end
		end)
		v_u_68:UpdatePrompts()
		v_u_68:UpdateFloatingSeedModel()
		v_u_68:UpdatePourAnimations()
		local v_u_64 = 0
		v_u_2.PreRender:Connect(function(p65)
			-- upvalues: (ref) v_u_25, (ref) v_u_64, (ref) v_u_19
			if v_u_25 then
				v_u_64 = v_u_64 + p65
				local v66 = v_u_64 * 1
				local v67 = math.sin(v66) * 0.5
				v_u_25.Seed.CFrame = v_u_19.CFrame + Vector3.new(0, v67, 0)
			else
				v_u_64 = 0
			end
		end)
	end
}
task.spawn(v_u_68.Start, v_u_68)
return v_u_68