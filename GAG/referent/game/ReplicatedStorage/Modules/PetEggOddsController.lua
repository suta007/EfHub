local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = require(v1.Modules.PityHoverController)
local v_u_5 = require(v1.Modules.GuiController)
local v_u_6 = require(v1.Data.PetRegistry.PetEggs)
local v7 = require(v1.Data.PetRegistry)
local v_u_8 = require(v1.Data.PityData)
local v9 = require(v1.Modules.Trove)
local v_u_10 = v3.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Odds_UI")
local v_u_11 = v_u_10.Frame.Main.Items
local v_u_12 = v7.PetList
local v_u_13 = v9.new()
local v57 = {
	["Open"] = function(_, p14, p_u_15, p16)
		-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_5, (copy) v_u_10, (copy) v_u_13, (copy) v_u_11, (copy) v_u_4, (copy) v_u_12, (copy) v_u_2
		local v17 = v_u_6[p14]
		if not v17 then
			warn((("Egg \'%*\' not found in PetEggs"):format(p14)))
			return
		end
		local v18
		if p16 then
			v18 = v_u_8[p16]
		else
			v18 = nil
		end
		local v19 = p14:find("^Rainbow Premium") or p14:find("^Festive Premium")
		local v20 = v19 or p14:find("^Giant Premium")
		local v21 = v_u_5:GetStateForGui(v_u_10)
		v_u_13:Destroy()
		for _, v22 in v_u_11.ScrollingFrame:GetChildren() do
			if v22:IsA("GuiObject") and v22.Name ~= "UIListLayout" then
				v22:Destroy()
			end
		end
		local v23 = {}
		for v24, v25 in v17.RarityData.Items do
			local v26 = {
				["Name"] = v24,
				["Item"] = v25,
				["NormalizedOdd"] = v25.NormalizedOdd or 0
			}
			table.insert(v23, v26)
		end
		table.sort(v23, function(p27, p28)
			return p27.NormalizedOdd < p28.NormalizedOdd
		end)
		local v29 = true
		for v30 = 2, #v23 do
			local v31 = v23[v30].NormalizedOdd - v23[1].NormalizedOdd
			if math.abs(v31) > 1e-6 then
				v29 = false
				break
			end
		end
		local v32 = v23[1].NormalizedOdd
		local v33 = nil
		for v34 = 2, #v23 do
			local v35 = v23[v34].NormalizedOdd - v32
			if math.abs(v35) > 1e-6 then
				v33 = v23[v34].NormalizedOdd
				break
			end
		end
		local v36 = 0
		for _, v37 in v23 do
			local v38
			if v29 then
				v38 = v19
			else
				local v39 = v37.NormalizedOdd - v32
				v38 = math.abs(v39) < 1e-6 and true or v19
			end
			local v40
			if v33 then
				local v41 = v37.NormalizedOdd - v33
				v40 = math.abs(v41) < 1e-6
			else
				v40 = v33
			end
			local v42
			if v38 then
				v42 = v_u_11.ScrollingFrame.UIListLayout.TemplateRainbow
			elseif v40 then
				v42 = v_u_11.ScrollingFrame.UIListLayout.TemplateBigger
			else
				v42 = v_u_11.ScrollingFrame.UIListLayout.TemplateSmaller
			end
			v36 = v36 + 1
			local v_u_43 = v_u_13:Clone(v42)
			local v44 = v37.NormalizedOdd * 1000
			v_u_43.LayoutOrder = -math.floor(v44)
			v_u_43.Title.Text = v37.Name
			if v18 then
				local v45 = 0
				for _, v46 in v18.Items do
					if v46.RewardId == v37.Name then
						v45 = v46.Pity
						break
					end
				end
				if v45 > 0 then
					local v47 = v_u_43.Pity
					v47.Text = ("%**"):format(v45)
					v47.Visible = true
					v_u_4:AddGuiObject(v_u_43, v45, v18.DisplayPlural)
					v_u_13:Add(function()
						-- upvalues: (ref) v_u_4, (copy) v_u_43
						v_u_4:RemoveGuiObject(v_u_43)
					end)
				end
			end
			local v48 = string.format
			local v49 = v37.NormalizedOdd
			local v50 = tonumber(v48("%.2f", v49))
			v_u_43.Odds.Text = ("%*%%"):format(v50)
			local v51 = v_u_12[v37.Name]
			if v51 then
				local v52 = v51.OddsIcon or v51.Icon
				if v52 then
					v_u_43.Vector.Image = v52
					v_u_43.Vector.Visible = true
				else
					v_u_43.Vector.Visible = false
				end
			else
				v_u_43.Vector.Visible = false
			end
			if v38 then
				local v_u_53 = nil
				v_u_13:Add(v21.Visible:Listen(function(p54)
					-- upvalues: (ref) v_u_53, (ref) v_u_13, (ref) v_u_2, (copy) v_u_43
					if p54 and not v_u_53 then
						v_u_53 = v_u_13:Add(v_u_2.PostSimulation:Connect(function()
							-- upvalues: (ref) v_u_43
							local v55 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
							v_u_43.Odds.TextColor3 = v55
							v_u_43.Title.TextColor3 = v55
						end))
					elseif not p54 and v_u_53 then
						v_u_13:Remove(v_u_53)
						v_u_53 = nil
					end
				end))
			elseif v40 then
				local v56 = Color3.fromRGB(255, 204, 1)
				v_u_43.Odds.TextColor3 = v56
				v_u_43.Title.TextColor3 = v56
			end
			v_u_43.Title.TextScaled = true
			v_u_43.Odds.TextScaled = true
			v_u_43.Parent = v_u_11.ScrollingFrame
		end
		if v36 > 6 or v20 then
			v_u_11.ScrollingFrame.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		else
			v_u_11.ScrollingFrame.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		end
		v_u_5:Open(v_u_10)
		if p_u_15 then
			v_u_13:Add(v_u_10.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_10, (copy) p_u_15, (ref) v_u_13
				v_u_5:Close(v_u_10)
				v_u_5:Open(p_u_15)
				v_u_13:Clean()
			end))
		else
			v_u_13:Add(v_u_10.Frame.ExitButton.Activated:Once(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_10, (ref) v_u_13
				v_u_5:Close(v_u_10)
				v_u_13:Clean()
			end))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_10
		v_u_5:UsePopupAnims(v_u_10)
	end
}
task.spawn(v57.Start, v57)
return v57