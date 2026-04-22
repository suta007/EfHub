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
local v11 = v2.LocalPlayer
assert(v11, "LocalPlayer not found")
local v_u_12 = v11:WaitForChild("PlayerGui"):WaitForChild("GenericRewards_UI")
local v_u_13 = v4.new()
local v50 = {
	["Open"] = function(_, p14)
		-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_13, (copy) v_u_9, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_10
		local v15 = p14.DisplayOdds
		local v16 = v15 == nil and true or v15
		local v17 = p14.RewardTemplate or nil
		local v18 = p14.Title or "Rewards"
		local v19 = p14.RewardData
		local v20 = p14.RewardFrameCreatedCallback
		local v_u_21 = p14.Breadcrumb
		local v22 = p14.ChanceDisplayMode or "Percentage"
		local v_u_23 = p14.RewardsUIOverride or v_u_12
		local v24 = v_u_23.Frame.Main.Holder
		local v25 = p14.RewardsUIBuiltCallback
		local v26 = p14.RewardsUIPreBuildCallback
		local v27 = p14.Information
		v_u_3:GetStateForGui(v_u_23)
		v_u_13:Destroy()
		local v28 = v17 or v24.RewardScrollingFrame.UIListLayout.REWARDTRACK_TEMPLATE
		v24.Header.Title.Text = v18
		local v29 = v_u_23.Frame.Main:FindFirstChild("Information")
		if v29 and v29:IsA("Frame") then
			local v30
			if v27 == nil then
				v30 = false
			else
				v30 = v27 ~= ""
			end
			v29.Visible = v30
			local v31 = v29:FindFirstChild("Text")
			if v31 and v31:IsA("TextLabel") then
				v31.Text = v27 or ""
			end
		end
		for _, v32 in v24.RewardScrollingFrame:GetChildren() do
			if v32:IsA("GuiObject") and v32.Name ~= "UIListLayout" then
				v32:Destroy()
			end
		end
		local _ = #v19
		local v33 = v_u_9(v19)
		table.sort(v33, function(p34, p35)
			return (p34.Weight or 1) > (p35.Weight or 1)
		end)
		local v36 = 0
		local v37 = 0
		for _, v38 in v33 do
			v36 = v36 + (v38.Weight or 0)
		end
		if v26 then
			v26(v_u_23, v24.ScrollingFrame)
		end
		for v39, v_u_40 in v33 do
			v37 = v37 + 1
			local v41 = v_u_13:Clone(v28)
			local v42 = v41.Frame.RewardName
			local v43 = v41.Frame.Odds
			local v44 = v41.Frame.ITEM_IMAGE
			if v_u_40.Reward.Type == "Seed Pack" then
				v41.Frame.OddsButton.Visible = true
				v41.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_6, (copy) v_u_40, (copy) v_u_23
					v_u_6:Open(v_u_40.Reward.Value, v_u_23)
				end)
			elseif v_u_40.Reward.Type == "Egg" then
				v41.Frame.OddsButton.Visible = true
				v41.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_7, (copy) v_u_40, (copy) v_u_23
					v_u_7:Open(v_u_40.Reward.Value, v_u_23)
				end)
			elseif v_u_40.Reward.Type == "Crate" then
				v41.Frame.OddsButton.Visible = true
				v41.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_8, (copy) v_u_40, (copy) v_u_23
					v_u_8:Open(v_u_40.Reward.Value, v_u_23)
				end)
			else
				v41.Frame.OddsButton.Visible = false
			end
			v42.Text = v_u_10:Format(v_u_40.Reward)
			if v16 then
				local v45 = v_u_40.Weight / v36
				if v22 == "Percentage" then
					v43.Text = string.format("%.2f", v45 * 100) .. "%"
				else
					v43.Text = ("1 in %*"):format((string.format("%.2f", 1 / v45)))
				end
				v43.Visible = true
			else
				v43.Visible = false
			end
			v44.Image = v_u_10:GetImage(v_u_40.Reward)
			v42.TextColor3 = Color3.new(1, 1, 1)
			local v46 = v41.Frame.RewardName.UIStroke
			if v46 then
				local v47, v48, v49 = v_u_10:GetRarityColor(v_u_40.Reward):ToHSV()
				v46.Color = Color3.fromHSV(v47, v48, v49 / 3)
			end
			if v20 then
				v20(v41, v_u_40, v39)
			end
			v41.LayoutOrder = v37 + 1000 + 1
			v41.Parent = v24.RewardScrollingFrame
		end
		if v25 then
			v25(v_u_23, v24.ScrollingFrame)
		end
		v_u_3:Open(v_u_23)
		if v_u_21 then
			v_u_13:Add(v_u_23.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (copy) v_u_23, (copy) v_u_21, (ref) v_u_13
				v_u_3:Close(v_u_23)
				v_u_3:Open(v_u_21)
				v_u_13:Clean()
			end))
		else
			v_u_13:Add(v_u_23.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (copy) v_u_23, (ref) v_u_13
				v_u_3:Close(v_u_23)
				v_u_13:Clean()
			end))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_12, (copy) v_u_3
		if v_u_12:FindFirstChild("Frame") then
			v_u_12.Frame.Active = true
		end
		v_u_3:UsePopupAnims(v_u_12)
	end
}
task.spawn(v50.Start, v50)
return v50