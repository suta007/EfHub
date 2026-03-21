local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GuiController)
require(v1.Data.SeedPackData)
require(v1.Data.SeedData)
local v4 = require(v1.Modules.Trove)
local v5 = require(v1.Item_Module)
require(v1.Modules.ItemImageFinder)
local v_u_6 = require(v1.Modules.SeedPackOddsController)
local v_u_7 = require(v1.Modules.PetEggOddsController)
local v_u_8 = require(v1.Modules.CosmeticCrateOddsController)
require(v1.Modules.DataService)
local v_u_9 = require(v1.Modules.ReplicationClass.DeepClone)
require(v1.Modules.GiveServiceCommon.RewardDataTypes)
local v_u_10 = require(v1.Modules.GiveServiceCommon)
v5.Return_All_Seed_Rarities()
local v_u_11 = v2.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GenericRewards_UI")
local v_u_12 = v4.new()
local v45 = {
	["Open"] = function(_, p13)
		-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_12, (copy) v_u_9, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_10
		local v14 = p13.DisplayOdds
		local v15 = v14 == nil and true or v14
		local v16 = p13.RewardTemplate or nil
		local v17 = p13.Title or "Rewards"
		local v18 = p13.RewardData
		local v19 = p13.RewardFrameCreatedCallback
		local v_u_20 = p13.Breadcrumb
		local v21 = p13.ChanceDisplayMode or "Percentage"
		local v_u_22 = p13.RewardsUIOverride or v_u_11
		local v23 = v_u_22.Frame.Main.Holder
		local v24 = p13.RewardsUIBuiltCallback
		local v25 = p13.RewardsUIPreBuildCallback
		v_u_3:GetStateForGui(v_u_22)
		v_u_12:Destroy()
		local v26 = v16 or v23.RewardScrollingFrame.UIListLayout.REWARDTRACK_TEMPLATE
		v23.Header.Title.Text = v17
		for _, v27 in v23.RewardScrollingFrame:GetChildren() do
			if v27:IsA("GuiObject") and v27.Name ~= "UIListLayout" then
				v27:Destroy()
			end
		end
		local _ = #v18
		local v28 = v_u_9(v18)
		table.sort(v28, function(p29, p30)
			return (p29.Chance or 1) > (p30.Chance or 1)
		end)
		local v31 = 0
		local v32 = 0
		for _, v33 in v28 do
			v31 = v31 + (v33.Chance or 0)
		end
		if v25 then
			v25(v_u_22, v23.ScrollingFrame)
		end
		for v34, v_u_35 in v28 do
			v32 = v32 + 1
			local v36 = v_u_12:Clone(v26)
			local v37 = v36.Frame.RewardName
			local v38 = v36.Frame.Odds
			local v39 = v36.Frame.ITEM_IMAGE
			if v_u_35.Reward.Type == "Seed Pack" then
				v36.Frame.OddsButton.Visible = true
				v36.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_6, (copy) v_u_35, (copy) v_u_22
					v_u_6:Open(v_u_35.Reward.Value, v_u_22)
				end)
			elseif v_u_35.Reward.Type == "Egg" then
				v36.Frame.OddsButton.Visible = true
				v36.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_7, (copy) v_u_35, (copy) v_u_22
					v_u_7:Open(v_u_35.Reward.Value, v_u_22)
				end)
			elseif v_u_35.Reward.Type == "Crate" then
				v36.Frame.OddsButton.Visible = true
				v36.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_8, (copy) v_u_35, (copy) v_u_22
					v_u_8:Open(v_u_35.Reward.Value, v_u_22)
				end)
			else
				v36.Frame.OddsButton.Visible = false
			end
			v37.Text = v_u_10:Format(v_u_35.Reward)
			if v15 then
				local v40 = v_u_35.Chance / v31
				if v21 == "Percentage" then
					v38.Text = string.format("%.2f", v40 * 100) .. "%"
				else
					v38.Text = ("1 in %*"):format((string.format("%.2f", 1 / v40)))
				end
				v38.Visible = true
			else
				v38.Visible = false
			end
			v39.Image = v_u_10:GetImage(v_u_35.Reward)
			v37.TextColor3 = Color3.new(1, 1, 1)
			local v41 = v36.Frame.RewardName.UIStroke
			if v41 then
				local v42, v43, v44 = v_u_10:GetRarityColor(v_u_35.Reward):ToHSV()
				v41.Color = Color3.fromHSV(v42, v43, v44 / 3)
			end
			if v19 then
				v19(v36, v_u_35, v34)
			end
			v36.LayoutOrder = v32 + 1000 + 1
			v36.Parent = v23.RewardScrollingFrame
		end
		if v24 then
			v24(v_u_22, v23.ScrollingFrame)
		end
		v_u_3:Open(v_u_22)
		if v_u_20 then
			v_u_12:Add(v_u_22.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (copy) v_u_22, (copy) v_u_20, (ref) v_u_12
				v_u_3:Close(v_u_22)
				v_u_3:Open(v_u_20)
				v_u_12:Clean()
			end))
		else
			v_u_12:Add(v_u_22.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (copy) v_u_22, (ref) v_u_12
				v_u_3:Close(v_u_22)
				v_u_12:Clean()
			end))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_11, (copy) v_u_3
		if v_u_11:FindFirstChild("Frame") then
			v_u_11.Frame.Active = true
		end
		v_u_3:UsePopupAnims(v_u_11)
	end
}
task.spawn(v45.Start, v45)
return v45