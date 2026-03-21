local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GuiController)
local v4 = require(v1.Modules.Trove)
local v_u_5 = require(v1.Modules.ItemImageFinder)
local v_u_6 = require(v1.Modules.PetEggOddsController)
local v_u_7 = require(v1.Modules.SeedPackOddsController)
local v_u_8 = require(v1.Modules.CosmeticCrateOddsController)
local v_u_9 = require(v1.Data.TraderEvent.TraderRewardData)
local v_u_10 = require(v1.Modules.DataService)
require(v1.Modules.UpdateService)
local v_u_11 = v2.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TraderRewards_UI")
local v_u_12 = v_u_11.Frame.Main.Holder
local v_u_13 = v4.new()
local v78 = {
	["OpenBargainBill"] = function(_, p_u_14)
		-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_10, (copy) v_u_9, (copy) v_u_7, (copy) v_u_11, (copy) v_u_6, (copy) v_u_8, (copy) v_u_5, (copy) v_u_3
		v_u_13:Destroy()
		v_u_12.Header.UIGradient.Color = ColorSequence.new(Color3.fromRGB(244, 197, 8), Color3.fromRGB(202, 158, 46))
		v_u_12.Header.Title.Text = "Bargain Bill Rewards"
		for _, v15 in v_u_12.RewardScrollingFrame:GetChildren() do
			if v15:IsA("GuiObject") and v15.Name ~= "UIListLayout" then
				v15:Destroy()
			end
		end
		v_u_10:GetData()
		local v16 = {}
		local v17 = 0
		for v18 in v_u_9.BargainBillRewardData do
			table.insert(v16, v18)
		end
		table.sort(v16)
		for _, v19 in v16 do
			local v20 = v_u_9.BargainBillRewardData[v19]
			v17 = v17 + 1000
			local v21 = v_u_13:Clone(v_u_12.RewardScrollingFrame.UIListLayout.TIER_TEMPLATE)
			v21.Title.Text = ("Required Points: %*"):format(v19)
			v21.LayoutOrder = v17
			v21.Parent = v_u_12.RewardScrollingFrame
			table.sort(v20, function(p22, p23)
				return (p22.Chance or 0) > (p23.Chance or 0)
			end)
			local v24 = 0
			for _, v25 in v20 do
				v24 = v24 + (v25.Chance or 0)
			end
			for _, v26 in v20 do
				v17 = v17 + 1
				local v27 = v_u_13:Clone(v_u_12.RewardScrollingFrame.UIListLayout.REWARDTRACK_TEMPLATE)
				local v28 = v27.Frame
				local v29 = v28.RewardName
				local v30 = v28.Odds
				local v31 = v28.ITEM_IMAGE
				local v32 = v28.OddsButton
				local v_u_33 = v26.Name
				local v34 = v26.Quantity or 1
				local v35 = v26.RewardType
				if v34 > 1 then
					v29.Text = ("x%* %*"):format(v34, v_u_33)
				else
					v29.Text = v_u_33
				end
				local v36 = v26.Chance / v24 * 100
				v30.Text = ("%*%%"):format((string.format("%.2f", v36)))
				v30.Visible = true
				if v35 == "Seed Pack" then
					v32.Visible = true
					v_u_13:Add(v32.Activated:Connect(function()
						-- upvalues: (ref) v_u_7, (copy) v_u_33, (ref) v_u_11
						v_u_7:Open(v_u_33, v_u_11)
					end))
				elseif v35 == "Egg" then
					v32.Visible = true
					v_u_13:Add(v32.Activated:Connect(function()
						-- upvalues: (ref) v_u_6, (copy) v_u_33, (ref) v_u_11
						v_u_6:Open(v_u_33, v_u_11)
					end))
				elseif v35 == "Crate" then
					v32.Visible = true
					v_u_13:Add(v32.Activated:Connect(function()
						-- upvalues: (ref) v_u_8, (copy) v_u_33, (ref) v_u_11
						v_u_8:Open(v_u_33, v_u_11)
					end))
				else
					v32.Visible = false
				end
				v31.Image = v_u_5(v_u_33, v35)
				v29.TextColor3 = Color3.fromRGB(255, 255, 255)
				local v37 = v29:FindFirstChild("UIStroke")
				if v37 and v37:IsA("UIStroke") then
					local v38, v39, v40 = v29.TextColor3:ToHSV()
					v37.Color = Color3.fromHSV(v38, v39, v40 / 2)
				end
				v27.LayoutOrder = v17 + 1000
				v27.Parent = v_u_12.RewardScrollingFrame
			end
		end
		v_u_3:Open(v_u_11)
		if p_u_14 then
			v_u_13:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11, (copy) p_u_14, (ref) v_u_13
				v_u_3:Close(v_u_11)
				v_u_3:Open(p_u_14)
				v_u_13:Clean()
			end))
		else
			v_u_13:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11, (ref) v_u_13
				v_u_3:Close(v_u_11)
				v_u_13:Clean()
			end))
		end
	end,
	["Open"] = function(_, p_u_41)
		-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_10, (copy) v_u_9, (copy) v_u_7, (copy) v_u_11, (copy) v_u_6, (copy) v_u_8, (copy) v_u_5, (copy) v_u_3
		v_u_13:Destroy()
		v_u_12.Header.UIGradient.Color = ColorSequence.new(Color3.fromRGB(244, 197, 8), Color3.fromRGB(202, 158, 46))
		v_u_12.Header.Title.Text = "Potential Trader Rewards"
		for _, v42 in v_u_12.RewardScrollingFrame:GetChildren() do
			if v42:IsA("GuiObject") and v42.Name ~= "UIListLayout" then
				v42:Destroy()
			end
		end
		local v43 = v_u_10:GetData()
		local v44 = {}
		local v45 = 0
		for v46 = 1, 11 do
			local v47 = {
				["Label"] = ("%*"):format(v46),
				["Key"] = v46
			}
			table.insert(v44, v47)
		end
		table.insert(v44, {
			["Label"] = "12+",
			["Key"] = 12
		})
		local v48 = {}
		for v49 in v_u_9.PartTwoRewardsData do
			table.insert(v48, v49)
		end
		table.sort(v48)
		for _, v50 in v48 do
			local v51 = {
				["Label"] = ("%*+"):format(v50),
				["Key"] = v50
			}
			table.insert(v44, v51)
		end
		for _, v52 in v44 do
			local v53 = v52.Label
			local v54 = v52.Key
			v45 = v45 + 1000
			local v55 = v_u_13:Clone(v_u_12.RewardScrollingFrame.UIListLayout.TIER_TEMPLATE)
			v55.Title.Text = ("STREAK: %*"):format(v53)
			v55.LayoutOrder = v45
			v55.Parent = v_u_12.RewardScrollingFrame
			local v56
			if v54 <= 12 then
				v56 = v_u_9.RewardsData[v54]
			elseif v53 == "12+" then
				v56 = v_u_9.RewardsData[12]
			else
				v56 = v_u_9.PartTwoRewardsData[v54]
			end
			if v56 then
				if v43.PermanentGears["Booth Sign"] == true then
					for v57, v58 in v56 do
						if v58.Name == "Booth Sign" then
							table.remove(v56, v57)
						end
					end
				end
				table.sort(v56, function(p59, p60)
					return (p59.Chance or 0) > (p60.Chance or 0)
				end)
				local v61 = 0
				for _, v62 in v56 do
					v61 = v61 + (v62.Chance or 0)
				end
				for _, v63 in v56 do
					v45 = v45 + 1
					local v64 = v_u_13:Clone(v_u_12.RewardScrollingFrame.UIListLayout.REWARDTRACK_TEMPLATE)
					local v65 = v64.Frame
					local v66 = v65.RewardName
					local v67 = v65.Odds
					local v68 = v65.ITEM_IMAGE
					local v69 = v65.OddsButton
					local v_u_70 = v63.Name
					local v71 = v63.Quantity or 1
					local v72 = v63.RewardType
					if v71 > 1 then
						v66.Text = ("x%* %*"):format(v71, v_u_70)
					else
						v66.Text = v_u_70
					end
					local v73 = v63.Chance / v61 * 100
					v67.Text = ("%*%%"):format((string.format("%.2f", v73)))
					v67.Visible = true
					if v72 == "Seed Pack" then
						v69.Visible = true
						v_u_13:Add(v69.Activated:Connect(function()
							-- upvalues: (ref) v_u_7, (copy) v_u_70, (ref) v_u_11
							v_u_7:Open(v_u_70, v_u_11)
						end))
					elseif v72 == "Egg" then
						v69.Visible = true
						v_u_13:Add(v69.Activated:Connect(function()
							-- upvalues: (ref) v_u_6, (copy) v_u_70, (ref) v_u_11
							v_u_6:Open(v_u_70, v_u_11)
						end))
					elseif v72 == "Crate" then
						v69.Visible = true
						v_u_13:Add(v69.Activated:Connect(function()
							-- upvalues: (ref) v_u_8, (copy) v_u_70, (ref) v_u_11
							v_u_8:Open(v_u_70, v_u_11)
						end))
					else
						v69.Visible = false
					end
					v68.Image = v_u_5(v_u_70, v72)
					v66.TextColor3 = Color3.fromRGB(255, 255, 255)
					local v74 = v66:FindFirstChild("UIStroke")
					if v74 and v74:IsA("UIStroke") then
						local v75, v76, v77 = v66.TextColor3:ToHSV()
						v74.Color = Color3.fromHSV(v75, v76, v77 / 2)
					end
					v64.LayoutOrder = v45 + 1000
					v64.Parent = v_u_12.RewardScrollingFrame
				end
			end
		end
		v_u_3:Open(v_u_11)
		if p_u_41 then
			v_u_13:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11, (copy) p_u_41, (ref) v_u_13
				v_u_3:Close(v_u_11)
				v_u_3:Open(p_u_41)
				v_u_13:Clean()
			end))
		else
			v_u_13:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11, (ref) v_u_13
				v_u_3:Close(v_u_11)
				v_u_13:Clean()
			end))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_11
		v_u_3:UsePopupAnims(v_u_11)
	end
}
task.spawn(v78.Start, v78)
return v78