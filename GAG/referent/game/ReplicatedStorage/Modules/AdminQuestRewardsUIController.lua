local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GuiController)
require(v1.Data.SeedPackData)
require(v1.Data.SeedData)
local v4 = require(v1.Modules.Trove)
local v5 = require(v1.Item_Module)
local v_u_6 = require(v1.Modules.ItemImageFinder)
local v_u_7 = require(v1.Modules.SeedPackOddsController)
local v_u_8 = require(v1.Modules.PetEggOddsController)
local v_u_9 = require(v1.Modules.CosmeticCrateOddsController)
require(v1.Modules.DataService)
local v_u_10 = require(v1.Modules.ReplicationClass.DeepClone)
v5.Return_All_Seed_Rarities()
local v_u_11 = v2.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("AdminQuestRewards_UI")
local v_u_12 = v_u_11.Frame.Main.Holder
local v_u_13 = require(v1.Data.QuestData.QuestContainers.AdminQuest01).CustomData.PossibleRewards
local v_u_14 = v4.new()
local v41 = {
	["Open"] = function(_, p_u_15, p16)
		-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_14, (copy) v_u_12, (copy) v_u_13, (copy) v_u_10, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6
		v_u_3:GetStateForGui(v_u_11)
		v_u_14:Destroy()
		v_u_12.Header.Title.Text = "Admin Quest Rewards"
		for _, v17 in v_u_12.RewardScrollingFrame:GetChildren() do
			if v17:IsA("GuiObject") and v17.Name ~= "UIListLayout" then
				v17:Destroy()
			end
		end
		local v18 = v_u_13
		local _ = #v18
		local v19 = v_u_10(v18)
		table.sort(v19, function(p20, p21)
			return (p20.Chance or 1) > (p21.Chance or 1)
		end)
		local v22 = 0
		local v23 = 0
		for _, v24 in v19 do
			v22 = v22 + (v24.Chance or 1)
		end
		for _, v_u_25 in v19 do
			v23 = v23 + 1
			local v26 = v_u_14:Clone(v_u_12.RewardScrollingFrame.UIListLayout.REWARDTRACK_TEMPLATE)
			local v27 = v26.Frame.RewardName
			local v28 = v26.Frame.Odds
			local v29 = v26.Frame.ITEM_IMAGE
			if v_u_25.Type == "Seed Pack" then
				v26.Frame.OddsButton.Visible = true
				v26.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_7, (copy) v_u_25, (ref) v_u_11
					v_u_7:Open(v_u_25.Value, v_u_11)
				end)
			elseif v_u_25.Type == "Egg" then
				v26.Frame.OddsButton.Visible = true
				v26.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_8, (copy) v_u_25, (ref) v_u_11
					v_u_8:Open(v_u_25.Value, v_u_11)
				end)
			elseif v_u_25.Type == "Crate" then
				v26.Frame.OddsButton.Visible = true
				v26.Frame.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_9, (copy) v_u_25, (ref) v_u_11
					v_u_9:Open(v_u_25.Value, v_u_11)
				end)
			else
				v26.Frame.OddsButton.Visible = false
			end
			local v30 = v_u_25.Data.Type
			local v31 = tostring(v30)
			local v32 = v_u_25.Data.Amount or 1
			if v32 > 1 then
				v31 = "x" .. v32 .. " " .. v_u_25.Value
			end
			v27.Text = v31
			if p16 then
				local v33 = (v_u_25.Chance or 1 / v22) * 100
				v28.Text = string.format("%.2f", v33) .. "%"
				v28.Visible = true
			else
				v28.Visible = false
			end
			local v34 = v_u_6
			local v35 = v_u_25.Data.Type
			v29.Image = v34(tostring(v35), v_u_25.Type)
			v27.TextColor3 = Color3.fromRGB(255, 255, 255)
			local v36 = v26.Frame.RewardName.UIStroke
			if v36 then
				local v37, v38, v39 = v27.TextColor3:ToHSV()
				v36.Color = Color3.fromHSV(v37, v38, v39 / 2)
			end
			v26.LayoutOrder = v23 + 1000 + 1
			v26.Parent = v_u_12.RewardScrollingFrame
		end
		v_u_3:Open(v_u_11)
		if p_u_15 then
			v_u_14:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11, (copy) p_u_15, (ref) v_u_14
				v_u_3:Close(v_u_11)
				v_u_3:Open(p_u_15)
				v_u_14:Clean()
			end))
		else
			v_u_14:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11, (ref) v_u_14
				v_u_3:Close(v_u_11)
				v_u_14:Clean()
			end))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_11, (copy) v_u_3
		if v_u_11:FindFirstChild("Frame") then
			v_u_11.Frame.Active = true
		end
		v_u_3:UsePopupAnims(v_u_11)
	end,
	["OverwriteTitle"] = function(_, p40)
		-- upvalues: (copy) v_u_12
		v_u_12.Header.Title.Text = p40
	end
}
task.spawn(v41.Start, v41)
return v41