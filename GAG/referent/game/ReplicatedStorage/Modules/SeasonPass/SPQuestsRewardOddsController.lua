local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = require(v1.Modules.PityHoverController)
local v_u_5 = require(v1.Modules.GuiController)
local v_u_6 = require(v1.Data.PityData)
local v7 = require(v1.Modules.Trove)
local v_u_8 = require(v1.Modules.ItemImageFinder)
local v_u_9 = require(v1.Modules.ItemNameFinder)
local v_u_10 = require(v1.Data.SeedPackData)
local v_u_11 = v3.LocalPlayer.PlayerGui.Odds_UI
local v_u_12 = v_u_11.Frame.Main.Items
local v_u_13 = v7.new()
local v57 = {
	["Open"] = function(_, p_u_14, p15)
		-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_5, (copy) v_u_11, (copy) v_u_13, (copy) v_u_12, (copy) v_u_9, (copy) v_u_4, (copy) v_u_8, (copy) v_u_2
		local v16 = v_u_10.Packs["Season Pass Quests"]
		if not v16 then
			return
		end
		local v17
		if p15 then
			v17 = v_u_6[p15]
		else
			v17 = nil
		end
		local v18 = v_u_5:GetStateForGui(v_u_11)
		v_u_13:Destroy()
		for _, v19 in v_u_12.ScrollingFrame:GetChildren() do
			if v19:IsA("GuiObject") and v19.Name ~= "UIListLayout" then
				v19:Destroy()
			end
		end
		local v20 = 0
		local v21 = {}
		for _, v22 in v16.Items do
			if not (v22.RemoveChance or v22.HideChance) then
				v20 = v20 + (v22.Chance or 0)
			end
		end
		for v23, v24 in v16.Items do
			local v25 = (v24.RemoveChance or v24.HideChance) and 0 or (v24.Chance or 0) / v20 * 100
			table.insert(v21, {
				["Reward"] = v24,
				["Index"] = v23,
				["Normalized"] = v25
			})
		end
		table.sort(v21, function(p26, p27)
			return p26.Normalized < p27.Normalized
		end)
		local v28 = true
		for v29 = 2, #v21 do
			local v30 = v21[v29].Normalized - v21[1].Normalized
			if math.abs(v30) > 1e-6 then
				v28 = false
				break
			end
		end
		local v31 = v21[1].Normalized
		local v32 = nil
		for v33 = 2, #v21 do
			local v34 = v21[v33].Normalized - v31
			if math.abs(v34) > 1e-6 then
				v32 = v21[v33].Normalized
				break
			end
		end
		local v35 = 0
		for _, v36 in v21 do
			local v37 = v36.Reward
			local v38 = v37.Type ~= "RainbowSeed" and not (string.find(v37.RewardId, "Rainbow ") or v28)
			if v38 then
				local v39 = v36.Normalized - v31
				v38 = math.abs(v39) < 1e-6
			end
			local v40
			if v32 then
				local v41 = v36.Normalized - v32
				v40 = math.abs(v41) < 1e-6
			else
				v40 = v32
			end
			local v42
			if v38 then
				v42 = v_u_12.ScrollingFrame.UIListLayout.TemplateRainbow
			elseif v40 then
				v42 = v_u_12.ScrollingFrame.UIListLayout.TemplateBigger
			else
				v42 = v_u_12.ScrollingFrame.UIListLayout.TemplateSmaller
			end
			v35 = v35 + 1
			local v_u_43 = v_u_13:Clone(v42)
			v_u_43.LayoutOrder = v36.Index
			local v44 = not v36.Reward.Quantity and "" or (" x%*"):format(v36.Reward.Quantity)
			v_u_43.Title.Text = ("%*%*"):format(v_u_9(v37.RewardId, v37.Type), v44)
			if v17 then
				local v45 = 0
				for _, v46 in v17.Items do
					if v46.RewardId == v36.Reward.RewardId and v46.Type == v36.Reward.Type then
						v45 = v46.Pity
						break
					end
				end
				if v45 > 0 then
					local v47 = v_u_43.Pity
					v47.Text = ("%**"):format(v45)
					v47.Visible = true
					v_u_4:AddGuiObject(v_u_43, v45, v17.DisplayPlural)
					v_u_13:Add(function()
						-- upvalues: (ref) v_u_4, (copy) v_u_43
						v_u_4:RemoveGuiObject(v_u_43)
					end)
				end
			end
			if v37.RemoveChance then
				v_u_43.Odds.Text = ""
			elseif v37.HideChance then
				v_u_43.Odds.Text = "???"
			else
				local v48 = string.format
				local v49 = v36.Normalized
				local v50 = tonumber(v48("%.2f", v49))
				v_u_43.Odds.Text = ("%*%%"):format(v50)
			end
			if v37.Icon then
				v_u_43.Vector.Image = v37.Icon
				v_u_43.Vector.Visible = true
			else
				local v51 = v_u_8(v37.RewardId, v37.Type)
				if v51 then
					v_u_43.Vector.Image = v51
					v_u_43.Vector.Visible = true
				else
					v_u_43.Vector.Visible = false
				end
			end
			if v38 then
				local v_u_52 = nil
				v_u_13:Add(v18.Visible:Listen(function(p53)
					-- upvalues: (ref) v_u_52, (ref) v_u_13, (ref) v_u_2, (copy) v_u_43
					if p53 and not v_u_52 then
						v_u_52 = v_u_13:Add(v_u_2.PostSimulation:Connect(function()
							-- upvalues: (ref) v_u_43
							local v54 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
							v_u_43.Odds.TextColor3 = v54
							v_u_43.Title.TextColor3 = v54
						end))
					elseif not p53 and v_u_52 then
						v_u_13:Remove(v_u_52)
						v_u_52 = nil
					end
				end))
			elseif v40 then
				local v55 = Color3.fromRGB(255, 204, 1)
				v_u_43.Odds.TextColor3 = v55
				v_u_43.Title.TextColor3 = v55
			end
			v_u_43.Title.TextScaled = true
			v_u_43.Odds.TextScaled = true
			v_u_43.Parent = v_u_12.ScrollingFrame
		end
		for _, v56 in v21 do
			if v56.Reward.Type ~= "RainbowSeed" and not string.find(v56.Reward.RewardId, "Rainbow ") then
				break
			end
		end
		if v_u_12.ScrollingFrame.AbsoluteCanvasSize.X > v_u_12.ScrollingFrame.AbsoluteWindowSize.X then
			v_u_12.ScrollingFrame.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		else
			v_u_12.ScrollingFrame.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		end
		v_u_5:Open(v_u_11)
		if p_u_14 then
			v_u_13:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_11, (copy) p_u_14, (ref) v_u_13
				v_u_5:Close(v_u_11)
				v_u_5:Open(p_u_14)
				v_u_13:Clean()
			end))
		else
			v_u_13:Add(v_u_11.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_11, (ref) v_u_13
				v_u_5:Close(v_u_11)
				v_u_13:Clean()
			end))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_11
		v_u_5:UsePopupAnims(v_u_11)
	end
}
task.spawn(v57.Start, v57)
return v57