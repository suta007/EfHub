local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = require(v1.Modules.GuiController)
local v_u_5 = require(v1.Data.CosmeticCrateRegistry.CosmeticCrates)
local v_u_6 = require(v1.Data.CosmeticRegistry).CosmeticList
local v7 = require(v1.Modules.Trove)
local v_u_8 = v3.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Odds_UI")
local v_u_9 = v_u_8.Frame.Main.Items
local v_u_10 = v7.new()
local v50 = {
	["Open"] = function(_, p11, p_u_12)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_6, (copy) v_u_2
		local v13 = v_u_5[p11]
		if not v13 then
			warn((("Crate \'%*\' not found in CosmeticCrates"):format(p11)))
			return
		end
		local v14 = v_u_4:GetStateForGui(v_u_8)
		v_u_10:Destroy()
		for _, v15 in v_u_9.ScrollingFrame:GetChildren() do
			if v15:IsA("GuiObject") and v15.Name ~= "UIListLayout" then
				v15:Destroy()
			end
		end
		local v16 = 0
		local v17 = {}
		for _, v18 in v13.CosmeticRolls.Items do
			v16 = v16 + v18.ItemOdd
		end
		for v19, v20 in v13.CosmeticRolls.Items do
			local v21 = {
				["Name"] = v19,
				["Item"] = v20,
				["NormalizedOdd"] = v20.ItemOdd / v16 * 100
			}
			table.insert(v17, v21)
		end
		table.sort(v17, function(p22, p23)
			return p22.NormalizedOdd < p23.NormalizedOdd
		end)
		local v24 = true
		for v25 = 2, #v17 do
			local v26 = v17[v25].NormalizedOdd - v17[1].NormalizedOdd
			if math.abs(v26) > 1e-6 then
				v24 = false
				break
			end
		end
		local v27 = v17[1].NormalizedOdd
		local v28 = nil
		for v29 = 2, #v17 do
			local v30 = v17[v29].NormalizedOdd - v27
			if math.abs(v30) > 1e-6 then
				v28 = v17[v29].NormalizedOdd
				break
			end
		end
		local v31 = 0
		local v32 = {}
		for _, v33 in v17 do
			local v34 = not v24
			if v34 then
				local v35 = v33.NormalizedOdd - v27
				v34 = math.abs(v35) < 1e-6
			end
			local v36
			if v28 then
				local v37 = v33.NormalizedOdd - v28
				v36 = math.abs(v37) < 1e-6
			else
				v36 = v28
			end
			local v38
			if v34 then
				v38 = v_u_9.ScrollingFrame.UIListLayout.TemplateRainbow
			elseif v36 then
				v38 = v_u_9.ScrollingFrame.UIListLayout.TemplateBigger
			else
				v38 = v_u_9.ScrollingFrame.UIListLayout.TemplateSmaller
			end
			v31 = v31 + 1
			local v_u_39 = v_u_10:Clone(v38)
			local v40 = v33.NormalizedOdd * 1000
			v_u_39.LayoutOrder = -math.floor(v40)
			v_u_39.Title.Text = v33.Name
			local v41 = v_u_39.Odds
			local v42 = string.format
			local v43 = v33.NormalizedOdd
			local v44 = tonumber(v42("%.2f", v43))
			v41.Text = tostring(v44) .. "%"
			local v45 = v_u_6[v33.Name]
			if v45 and v45.Icon then
				v_u_39.Vector.Image = v45.Icon
				v_u_39.Vector.Visible = true
			else
				v_u_39.Vector.Visible = false
			end
			if v34 then
				local v_u_46 = nil
				v_u_10:Add(v14.Visible:Listen(function(p47)
					-- upvalues: (ref) v_u_46, (ref) v_u_10, (ref) v_u_2, (copy) v_u_39
					if p47 and not v_u_46 then
						v_u_46 = v_u_10:Add(v_u_2.PostSimulation:Connect(function()
							-- upvalues: (ref) v_u_39
							local v48 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
							v_u_39.Odds.TextColor3 = v48
							v_u_39.Title.TextColor3 = v48
						end))
					elseif not p47 and v_u_46 then
						v_u_10:Remove(v_u_46)
						v_u_46 = nil
					end
				end))
			elseif v36 then
				local v49 = Color3.fromRGB(255, 204, 1)
				v_u_39.Odds.TextColor3 = v49
				v_u_39.Title.TextColor3 = v49
			end
			v_u_39.Title.TextScaled = true
			v_u_39.Odds.TextScaled = true
			v_u_39.Parent = v_u_9.ScrollingFrame
			table.insert(v32, v_u_39)
		end
		if v31 > 6 then
			v_u_9.ScrollingFrame.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		else
			v_u_9.ScrollingFrame.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		end
		v_u_4:Open(v_u_8)
		if p_u_12 then
			v_u_10:Add(v_u_8.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_4, (ref) v_u_8, (copy) p_u_12, (ref) v_u_10
				v_u_4:Close(v_u_8)
				v_u_4:Open(p_u_12)
				v_u_10:Clean()
			end))
		else
			v_u_10:Add(v_u_8.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_4, (ref) v_u_8, (ref) v_u_10
				v_u_4:Close(v_u_8)
				v_u_10:Clean()
			end))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_8
		v_u_4:UsePopupAnims(v_u_8)
	end
}
task.spawn(v50.Start, v50)
return v50