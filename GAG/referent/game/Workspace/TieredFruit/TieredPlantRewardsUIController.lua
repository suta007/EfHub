local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
require(v1.Data.AchievementsData.Types)
local v_u_3 = require(v1.Modules.GuiController)
require(v1.Data.SeedPackData)
require(v1.Data.SeedData)
local v4 = require(v1.Modules.Trove)
local v5 = require(v1.Item_Module)
local v_u_6 = require(v1.Modules.ItemImageFinder)
local v_u_7 = require(v1.Modules.SeedPackOddsController)
local v_u_8 = require(v1.Modules.PetEggOddsController)
local v_u_9 = require(v1.Modules.CosmeticCrateOddsController)
local v_u_10 = require(v1.Modules.GardenGuideModules.ImageCycle)
v5.Return_All_Seed_Rarities()
local v_u_11 = v2.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TieredPlantRewards_UI")
local v_u_12 = v_u_11.Frame.Main.Holder
local v_u_13 = require(v1.Data.TieredPlantRewardData)
local v_u_14 = v4.new()
local v_u_15 = require(v1.Modules.EventService).new("TieredPlantRewardsUIController", "Tiered Plants Submission")
local function v_u_21(p16, p_u_17, p_u_18, p19)
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9
	if p19[p16] then
		p19[p16]:Disconnect()
		p19[p16] = nil
	end
	local v20 = p16.Frame.OddsButton
	if p_u_17.Type == "Seed Pack" then
		v20.Visible = true
		p19[p16] = v20.Activated:Connect(function()
			-- upvalues: (ref) v_u_7, (copy) p_u_17, (copy) p_u_18
			v_u_7:Open(p_u_17.Value, p_u_18)
		end)
		return
	elseif p_u_17.Type == "Egg" then
		v20.Visible = true
		p19[p16] = v20.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (copy) p_u_17, (copy) p_u_18
			v_u_8:Open(p_u_17.Value, p_u_18)
		end)
		return
	elseif p_u_17.Type == "Crate" then
		v20.Visible = true
		p19[p16] = v20.Activated:Connect(function()
			-- upvalues: (ref) v_u_9, (copy) p_u_17, (copy) p_u_18
			v_u_9:Open(p_u_17.Value, p_u_18)
		end)
	else
		v20.Visible = false
	end
end
local function v_u_36(p22, p23, p24, p25)
	-- upvalues: (copy) v_u_12, (copy) v_u_6, (copy) v_u_21, (copy) v_u_11
	local v_u_26 = p25:Clone(v_u_12.RewardScrollingFrame.UIListLayout.REWARDTRACK_TEMPLATE)
	v_u_26.Name = "STATIC_REWARD_" .. p23
	v_u_26.LayoutOrder = p23
	v_u_26.Parent = p24
	v_u_26.Frame.RewardName.TextColor3 = Color3.fromRGB(255, 255, 255)
	local v27 = v_u_26.Frame.RewardName.UIStroke
	if v27 then
		local v28, v29, v30 = v_u_26.Frame.RewardName.TextColor3:ToHSV()
		v27.Color = Color3.fromHSV(v28, v29, v30 / 2)
	end
	local v31 = v_u_26.Frame.RewardName
	local v32 = p22.Quantity or 1
	local v33 = p22.Value
	if p22.Type == "XP" then
		v33 = p22.Type
		v32 = p22.Value
	end
	if v32 > 1 then
		v33 = ("%* x%*"):format(v33, v32)
	end
	v31.Text = v33
	local v34 = v_u_6(p22.Value, p22.Type)
	if v34 then
		v_u_26.Frame.ITEM_IMAGE.Image = v34
	end
	local v_u_35 = {}
	v_u_21(v_u_26, p22, v_u_11, v_u_35)
	p25:Add(function()
		-- upvalues: (copy) v_u_35, (copy) v_u_26
		if v_u_35[v_u_26] then
			v_u_35[v_u_26]:Disconnect()
		end
	end)
	return v_u_26
end
function v_u_15.Open(_)
	-- upvalues: (copy) v_u_15, (copy) v_u_3, (copy) v_u_11, (copy) v_u_14, (copy) v_u_12, (copy) v_u_13, (copy) v_u_10, (copy) v_u_36
	if v_u_15.IsRunning then
		v_u_3:GetStateForGui(v_u_11)
		v_u_14:Destroy()
		v_u_15:OverwriteTitle("Potential Rewards")
		for _, v37 in v_u_12.RewardScrollingFrame:GetChildren() do
			if v37:IsA("GuiObject") and v37.Name ~= "UIListLayout" then
				v37:Destroy()
			end
		end
		for v38, v39 in v_u_13.Tiers do
			local v40 = v38 * 10000
			local v41 = v39.SubmittableFruit or {}
			local v42 = v39.TierRewards or {}
			local v43 = {}
			local v44 = {}
			local v45 = {}
			local v46 = 0
			for v47, v48 in v41 do
				table.insert(v43, {
					["Type"] = "Fruit",
					["Value"] = v47,
					["Quantity"] = 1
				})
				if v48 then
					local v49 = v48.NextFruit
					if v49 and v49 ~= "" then
						table.insert(v45, {
							["Type"] = "Seed",
							["Value"] = v49,
							["Quantity"] = 1
						})
					end
					if v48.UniqueReward then
						local v50 = v48.UniqueReward
						table.insert(v44, v50)
					end
				end
			end
			local v51 = v_u_14:Clone(v_u_12.RewardScrollingFrame.UIListLayout.TIER_TEMPLATE)
			v51.Title.Text = ("Stage %*"):format(v38)
			v51.LayoutOrder = v40 + v46
			v51.Parent = v_u_12.RewardScrollingFrame
			local v52 = v46 + 100
			local v53 = v_u_14:Clone(v_u_12.RewardScrollingFrame.UIListLayout.HEADER_TEMPLATE)
			v53.FRAME.Title.Text = "Submit One"
			v53.FRAME.Title.TextColor3 = Color3.fromRGB(100, 200, 100)
			v53.LayoutOrder = v40 + v52
			v53.Parent = v_u_12.RewardScrollingFrame
			local v54 = v52 + 10
			local v55 = v_u_14:Clone(v_u_12.RewardScrollingFrame.UIListLayout.CONVERSION_TEMPLATE)
			v55.LayoutOrder = v40 + v54
			v55.Parent = v_u_12.RewardScrollingFrame
			local v56 = v55.FROM_FRAME
			local v57 = v55.TO_FRAME
			local v58 = v55.Arrow
			v56.Frame.OddsButton.Visible = false
			v56.Frame.RewardName.TextColor3 = Color3.fromRGB(100, 200, 100)
			local v59 = v56.Frame.RewardName.UIStroke
			if v59 then
				local v60, v61, v62 = v56.Frame.RewardName.TextColor3:ToHSV()
				v59.Color = Color3.fromHSV(v60, v61, v62 / 2)
			end
			v56.Visible = false
			v56.Name = "FRAME_" .. v40 .. v54 .. "_FROM"
			v_u_10.CycleRewardImages(v56.Frame.ITEM_IMAGE, v56.Frame.RewardName, nil, v56, v43)
			v56.Visible = true
			if #v45 > 0 then
				v58.Visible = true
				v57.Frame.OddsButton.Visible = false
				v57.Frame.RewardName.TextColor3 = Color3.fromRGB(100, 200, 100)
				local v63 = v57.Frame.RewardName.UIStroke
				if v63 then
					local v64, v65, v66 = v57.Frame.RewardName.TextColor3:ToHSV()
					v63.Color = Color3.fromHSV(v64, v65, v66 / 2)
				end
				v57.Visible = false
				v57.Name = "FRAME_" .. v40 .. v54 .. "_TO"
				v_u_10.CycleRewardImages(v57.Frame.ITEM_IMAGE, v57.Frame.RewardName, nil, v57, v45)
				v57.Visible = true
			else
				v57.Visible = false
				v58.Visible = false
			end
			local v67 = v54 + 90
			if #v42 > 0 or #v44 > 0 then
				local v68 = v_u_14:Clone(v_u_12.RewardScrollingFrame.UIListLayout.HEADER_TEMPLATE)
				v68.FRAME.Title.Text = "To Get One"
				v68.FRAME.Title.TextColor3 = Color3.fromRGB(255, 215, 0)
				v68.LayoutOrder = v40 + v67
				v68.Parent = v_u_12.RewardScrollingFrame
				local v69 = v67 + 10
				for _, v70 in ipairs(v42) do
					v_u_36(v70, v40 + v69, v_u_12.RewardScrollingFrame, v_u_14)
					v69 = v69 + 1
				end
				if #v44 > 0 then
					local v71 = v_u_14:Clone(v_u_12.RewardScrollingFrame.UIListLayout.REWARDTRACK_TEMPLATE)
					v71.Name = "UNIQUE_REWARDS_" .. v40 .. v69
					v71.LayoutOrder = v40 + v69
					v71.Parent = v_u_12.RewardScrollingFrame
					v71.Frame.OddsButton.Visible = false
					v71.Frame.RewardName.TextColor3 = Color3.fromRGB(100, 200, 100)
					local v72 = v71.Frame.RewardName.UIStroke
					if v72 then
						local v73, v74, v75 = v71.Frame.RewardName.TextColor3:ToHSV()
						v72.Color = Color3.fromHSV(v73, v74, v75 / 2)
					end
					v71.Visible = false
					v_u_10.CycleRewardImages(v71.Frame.ITEM_IMAGE, v71.Frame.RewardName, nil, v71, v44)
					v71.Visible = true
					local _ = v69 + 1
				end
			end
		end
	end
end
function v_u_15.OverwriteTitle(_, p76)
	-- upvalues: (copy) v_u_12
	v_u_12.Header.Title.Text = p76
end
function v_u_15.OnStarted(p77)
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_15
	v_u_3:UsePopupAnims(v_u_11)
	v_u_15:Open()
	p77:Bind(v_u_11.Frame.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_11
		v_u_3:Close(v_u_11)
	end))
end
function v_u_15.OnStopped(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_14
	v_u_3:Close(v_u_11)
	v_u_14:Destroy()
end
v_u_15:Initialize()
return v_u_15