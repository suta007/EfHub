local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GuiController)
require(v1.Data.SeedPackData)
require(v1.Data.SeedData)
local v4 = require(v1.Modules.Trove)
local v5 = require(v1.Item_Module)
local v_u_6 = require(v1.Modules.ItemImageFinder)
local v_u_7 = require(v1.Modules.PetEggOddsController)
local v_u_8 = require(v1.Modules.SeedPackOddsController)
local v_u_9 = require(v1.Modules.CosmeticCrateOddsController)
v5.Return_All_Seed_Rarities()
local v_u_10 = require(v1.Data.DiggingMinigame.DiggingEventConfigData)
local v_u_11 = v2.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("DiggingRewards_UI")
local v_u_12 = v_u_11.Frame.Main.Holder
local v_u_13 = require(v1.Data.DiggingMinigame.DiggingRewardData)
local v_u_14 = v_u_13.RewardSets[v_u_10.GetCurrentTheme()] or {}
local v_u_15 = v4.new()
local v40 = {
	["Open"] = function(_, p_u_16, _)
		-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_15, (copy) v_u_12, (ref) v_u_14, (copy) v_u_13, (copy) v_u_10, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_6
		v_u_3:GetStateForGui(v_u_11)
		v_u_15:Destroy()
		v_u_12.Header.UIGradient.Color = ColorSequence.new(Color3.fromRGB(244, 197, 8), Color3.fromRGB(202, 158, 46))
		v_u_12.Header.Title.Text = "Potential Digging Rewards"
		for _, v17 in v_u_12.RewardScrollingFrame:GetChildren() do
			if v17:IsA("GuiObject") and v17.Name ~= "UIListLayout" then
				v17:Destroy()
			end
		end
		local v18 = 0
		v_u_14 = v_u_13.RewardSets[v_u_10.GetCurrentTheme()] or {}
		local v19 = v_u_14
		table.sort(v19, function(p20, p21)
			return p20.Chance > p21.Chance
		end)
		local v22 = 0
		for _, v23 in v19 do
			v22 = v22 + (v23.Chance or 0)
		end
		for _, v_u_24 in v_u_14 do
			v18 = v18 + 1
			local v25 = v_u_15:Clone(v_u_12.RewardScrollingFrame.UIListLayout.REWARDTRACK_TEMPLATE)
			local v26 = v25.Frame.RewardName
			local v27 = v25.Frame.Odds
			local v28 = v25.Frame.ITEM_IMAGE
			if v_u_24.Type == "Seed Pack" then
				v25.Frame.OddsButton.Visible = true
				v25.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_8, (copy) v_u_24, (ref) v_u_11
					v_u_8:Open(v_u_24.Value, v_u_11)
				end)
			elseif v_u_24.Type == "Egg" then
				v25.Frame.OddsButton.Visible = true
				v25.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_7, (copy) v_u_24, (ref) v_u_11
					v_u_7:Open(v_u_24.Value, v_u_11)
				end)
			elseif v_u_24.Type == "Crate" then
				v25.Frame.OddsButton.Visible = true
				v25.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_9, (copy) v_u_24, (ref) v_u_11
					v_u_9:Open(v_u_24.Value, v_u_11)
				end)
			else
				v25.Frame.OddsButton.Visible = false
			end
			local v29 = v_u_24.Value
			local v30 = tostring(v29)
			local v31 = v_u_24.Quantity or 1
			if v31 > 1 then
				v30 = "x" .. v31 .. " " .. v_u_24.Value
			end
			v26.Text = v30
			local v32 = v_u_24.Chance / v22 * 100
			v27.Text = string.format("%.2f", v32) .. "%"
			v27.Visible = true
			local v33 = v_u_6
			local v34 = v_u_24.Value
			v28.Image = v33(tostring(v34), v_u_24.Type)
			v26.TextColor3 = Color3.fromRGB(255, 255, 255)
			local v35 = v25.Frame.RewardName.UIStroke
			if v35 then
				local v36, v37, v38 = v26.TextColor3:ToHSV()
				v35.Color = Color3.fromHSV(v36, v37, v38 / 2)
			end
			v25.LayoutOrder = v18 + 1000 + 1
			v25.Parent = v_u_12.RewardScrollingFrame
		end
		v_u_3:Open(v_u_11)
		if p_u_16 then
			v_u_15:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11, (copy) p_u_16, (ref) v_u_15
				v_u_3:Close(v_u_11)
				v_u_3:Open(p_u_16)
				v_u_15:Clean()
			end))
		else
			v_u_15:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11, (ref) v_u_15
				v_u_3:Close(v_u_11)
				v_u_15:Clean()
			end))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_11
		v_u_3:UsePopupAnims(v_u_11)
	end,
	["OverwriteTitle"] = function(_, p39)
		-- upvalues: (copy) v_u_12
		v_u_12.Header.Title.Text = p39
	end
}
task.spawn(v40.Start, v40)
return v40