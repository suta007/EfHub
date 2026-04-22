local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = require(v1.Modules.PityHoverController)
local v_u_5 = require(v1.Modules.GuiController)
local v_u_6 = require(v1.Data.PetRegistry.PetEggs)
local v7 = require(v1.Data.PetRegistry)
local v_u_8 = require(v1.Data.PityData)
local v_u_9 = require(v1.Modules.Trove)
local v_u_10 = require(v1.Modules.PetServices.PetUtilities)
local v11 = v1.GameEvents.OddsUI.OpenPetEggOddsRE
local v_u_12 = v3.LocalPlayer:WaitForChild("PlayerGui")
local v_u_13 = v_u_12:WaitForChild("Odds_UI")
local v_u_14 = v_u_13.Frame.Main.Items
local v_u_15 = script.OddsAttachment
local v_u_16 = v7.PetList
local v_u_101 = {
	["ScreenTrove"] = nil,
	["Stack"] = {},
	["BillboardTrove"] = nil,
	["BillboardStack"] = {},
	["BillboardCtx"] = nil,
	["CleanupCurrentScreen"] = function(p17)
		if p17.ScreenTrove then
			p17.ScreenTrove:Destroy()
			p17.ScreenTrove = nil
		end
	end,
	["ClearEntries"] = function(_, p18)
		for _, v19 in p18.ScrollingFrame:GetChildren() do
			if v19:IsA("GuiObject") and (v19.Name ~= "UIListLayout" and not v19:IsDescendantOf(p18.ScrollingFrame.UIListLayout)) then
				v19:Destroy()
			end
		end
	end,
	["CloseCurrent"] = function(p20)
		-- upvalues: (copy) v_u_5, (copy) v_u_13
		p20:CleanupCurrentScreen()
		table.clear(p20.Stack)
		v_u_5:Close(v_u_13)
	end,
	["GoBack"] = function(p21)
		-- upvalues: (copy) v_u_5, (copy) v_u_13
		if #p21.Stack > 1 then
			table.remove(p21.Stack, #p21.Stack)
			p21:RenderCurrent()
		else
			local v22 = p21.Stack[1]
			p21:CleanupCurrentScreen()
			table.clear(p21.Stack)
			v_u_5:Close(v_u_13)
			if v22 and v22.Breadcrumb then
				v_u_5:Open(v22.Breadcrumb)
			end
		end
	end,
	["RenderEntries"] = function(p_u_23, p_u_24)
		-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_4, (copy) v_u_16, (copy) v_u_2
		local v_u_25 = p_u_24.Stack[#p_u_24.Stack]
		if not v_u_25 then
			return
		end
		local v26 = v_u_25.EggName
		local v27 = v_u_6[v26]
		if not v27 then
			warn((("Egg \'%*\' not found in PetEggs"):format(v26)))
			return
		end
		local v28
		if v_u_25.PityName then
			v28 = v_u_8[v_u_25.PityName]
		else
			v28 = nil
		end
		local v29 = v26:find("^Rainbow Premium") or v26:find("^Festive Premium")
		p_u_23:ClearEntries(p_u_24.Container)
		if p_u_24.RenderTrove then
			p_u_24.RenderTrove:Destroy()
		end
		local v30 = p_u_24.Trove:Extend()
		p_u_24.RenderTrove = v30
		local v31 = v_u_25.EggBoostAmount or 0
		local v32 = v_u_25.CurrentEggBoostAmount or 0
		local v33 = v31 ~= v32
		local v34 = v27.RarityData.Items
		local v35
		if v32 > 0 then
			v35 = v_u_10:GetBoostedRarityData(v27.RarityData, v32).Items
		else
			v35 = v34
		end
		local v36
		if v31 > 0 then
			v36 = v_u_10:GetBoostedRarityData(v27.RarityData, v31).Items
		else
			v36 = v34
		end
		local v37 = {}
		for v38, v39 in v36 do
			local v40 = {
				["Name"] = v38,
				["Item"] = v39,
				["BoostedOdd"] = v39.NormalizedOdd or (v39.ItemOdd or 0),
				["CurrentOdd"] = v33 and (not v35[v38] or v35[v38].NormalizedOdd or (v35[v38].ItemOdd or 0)) or nil,
				["RawOdd"] = not v34[v38] or v34[v38].NormalizedOdd or (v34[v38].ItemOdd or 0)
			}
			table.insert(v37, v40)
		end
		table.sort(v37, function(p41, p42)
			return p41.RawOdd < p42.RawOdd
		end)
		local v43 = (1 / 0)
		local v44 = nil
		local v45 = true
		for _, v46 in v37 do
			if v46.RawOdd < v43 then
				v43 = v46.RawOdd
			end
		end
		for _, v47 in v37 do
			local v48 = v47.RawOdd - v43
			if math.abs(v48) > 1e-6 then
				v45 = false
				if v44 == nil or v47.RawOdd < v44 then
					v44 = v47.RawOdd
				end
			end
		end
		local v_u_49 = p_u_24.Container.ScrollingFrame
		for _, v50 in v37 do
			local v51 = not v45
			if v51 then
				local v52 = v50.RawOdd - v43
				v51 = math.abs(v52) < 1e-6
			end
			local v53 = v51 or v29
			local v54
			if v44 == nil then
				v54 = false
			else
				local v55 = v50.RawOdd - v44
				v54 = math.abs(v55) < 1e-6
			end
			local v56
			if v51 then
				v56 = v_u_49.UIListLayout.TemplateRainbow
			elseif v54 then
				v56 = v_u_49.UIListLayout.TemplateBigger
			else
				v56 = v_u_49.UIListLayout.TemplateSmaller
			end
			local v_u_57 = v30:Clone(v56)
			local v_u_58 = v50.Name:match("^Egg/(.+)$")
			local v59 = v_u_58 or v50.Name
			local v60 = v50.RawOdd * 1000
			v_u_57.LayoutOrder = -math.floor(v60)
			v_u_57.Title.Text = v59
			if v28 then
				local v61 = 0
				for _, v62 in v28.Items do
					if v62.RewardId == v50.Name then
						v61 = v62.Pity
						break
					end
				end
				if v61 > 0 then
					local v63 = v_u_57.Pity
					v63.Text = ("%**"):format(v61)
					v63.Visible = true
					v_u_4:AddGuiObject(v_u_57, v61, v28.DisplayPlural)
					p_u_24.Trove:Add(function()
						-- upvalues: (ref) v_u_4, (copy) v_u_57
						v_u_4:RemoveGuiObject(v_u_57)
					end)
				end
			end
			local v64 = v50.BoostedOdd * 100
			local v65 = math.round(v64) / 100
			if v33 then
				local v66 = v50.CurrentOdd
				if v66 then
					local v67 = v50.CurrentOdd * 100
					v66 = math.round(v67) / 100
				end
				v_u_57.Odds.RichText = true
				v_u_57.Odds.Text = ("<font size=\"13\" color=\"#FF0000\"><s>%*%%</s></font> <font size=\"20\" color=\"#00FF00\">%*%%</font>"):format(v66, v65)
			else
				v_u_57.Odds.Text = ("%*%%"):format(v65)
			end
			if v_u_58 then
				local v68 = v_u_6[v_u_58]
				if v68 then
					v68 = v68.Icon
				end
				v_u_57.Vector.Image = v68 or ""
				v_u_57.Vector.Visible = v68 ~= nil
				if v_u_57:FindFirstChild("OddsButton") then
					v_u_57.OddsButton.Visible = true
					p_u_24.Trove:Add(v_u_57.OddsButton.Activated:Connect(function()
						-- upvalues: (copy) p_u_24, (copy) v_u_58, (copy) v_u_25, (copy) p_u_23
						local v69 = p_u_24.Stack
						local v70 = {
							["EggName"] = v_u_58,
							["PityName"] = nil,
							["Breadcrumb"] = v_u_25.Breadcrumb
						}
						table.insert(v69, v70)
						p_u_23:RenderEntries(p_u_24)
					end))
				end
			else
				local v71 = v_u_16[v50.Name]
				if v71 then
					local v72 = v71.OddsIcon or v71.Icon
					v_u_57.Vector.Image = v72 or ""
					v_u_57.Vector.Visible = v72 ~= nil
				else
					v_u_57.Vector.Visible = false
				end
				if v_u_57:FindFirstChild("OddsButton") then
					v_u_57.OddsButton.Visible = false
				end
			end
			if v53 then
				v30:Add(v_u_2.PostSimulation:Connect(function()
					-- upvalues: (copy) v_u_57
					local v73 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
					v_u_57.Odds.TextColor3 = v73
					v_u_57.Title.TextColor3 = v73
				end))
			elseif v54 then
				local v74 = Color3.fromRGB(255, 204, 1)
				v_u_57.Odds.TextColor3 = v74
				v_u_57.Title.TextColor3 = v74
			end
			v_u_57.Title.TextScaled = true
			v_u_57.Odds.TextScaled = true
			v_u_57.Parent = v_u_49
		end
		v30:Add(v_u_49:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
			-- upvalues: (copy) v_u_49
			if v_u_49.AbsoluteCanvasSize.X > v_u_49.AbsoluteWindowSize.X then
				v_u_49.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
			else
				v_u_49.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			end
		end))
	end,
	["RenderCurrent"] = function(p_u_75)
		-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_14, (copy) v_u_13
		local v76 = p_u_75.Stack[#p_u_75.Stack]
		if v76 then
			if v_u_6[v76.EggName] then
				p_u_75:CleanupCurrentScreen()
				local v77 = v_u_9.new()
				p_u_75.ScreenTrove = v77
				p_u_75:RenderEntries({
					["Container"] = v_u_14,
					["Trove"] = v77,
					["Stack"] = p_u_75.Stack,
					["IsScreen"] = true
				})
				v77:Add(v_u_13.Frame.ExitButton.Activated:Connect(function()
					-- upvalues: (copy) p_u_75
					p_u_75:GoBack()
				end))
				v_u_13.Frame.ExpandButton.Visible = false
			else
				warn((("Egg \'%*\' not found in PetEggs"):format(v76.EggName)))
				p_u_75:GoBack()
			end
		else
			p_u_75:CloseCurrent()
			return
		end
	end,
	["CleanupBillboard"] = function(p78)
		p78.BillboardCtx = nil
		if p78.BillboardTrove then
			p78.BillboardTrove:Destroy()
			p78.BillboardTrove = nil
			table.clear(p78.BillboardStack)
		end
	end,
	["OpenBillboard"] = function(p_u_79, p80, p81, p82, p83, p_u_84)
		-- upvalues: (copy) v_u_15, (copy) v_u_12, (copy) v_u_13, (copy) v_u_9
		p_u_79:CleanupBillboard()
		local v85 = v_u_15:Clone().OddsBillboardGui
		v85.Adornee = p80
		v85.Parent = v_u_12
		local v86 = v_u_13.Frame:Clone()
		v86.Parent = v85
		v86.Size = UDim2.new(1, 0, 1, 0)
		local v87 = v_u_9.new()
		v87:Add(v85)
		p_u_79.BillboardTrove = v87
		table.clear(p_u_79.BillboardStack)
		local v88 = p_u_79.BillboardStack
		table.insert(v88, {
			["EggName"] = p81,
			["EggBoostAmount"] = p82,
			["CurrentEggBoostAmount"] = p83
		})
		local v_u_89 = {
			["Container"] = v86.Main.Items,
			["Trove"] = v87,
			["Stack"] = p_u_79.BillboardStack,
			["IsScreen"] = false
		}
		p_u_79.BillboardCtx = v_u_89
		v86.ExpandButton.Visible = true
		v87:Add(v86.ExitButton.Activated:Connect(function()
			-- upvalues: (copy) p_u_79, (copy) v_u_89, (copy) p_u_84
			if #p_u_79.BillboardStack > 1 then
				table.remove(p_u_79.BillboardStack, #p_u_79.BillboardStack)
				p_u_79:RenderEntries(v_u_89)
			else
				p_u_79:CleanupBillboard()
				if p_u_84 then
					p_u_84()
				end
			end
		end))
		v87:Add(v86.ExpandButton.Activated:Connect(function()
			-- upvalues: (copy) p_u_79
			local v90 = p_u_79.BillboardStack[1]
			if v90 then
				p_u_79:Open(v90.EggName, nil, v90.PityName, v90.EggBoostAmount)
			end
		end))
		p_u_79:RenderEntries(v_u_89)
	end,
	["UpdateBillboardBoost"] = function(p91, p92, p93)
		local v94 = p91.BillboardCtx
		if v94 and v94.Stack[1] then
			v94.Stack[1].EggBoostAmount = p92
			v94.Stack[1].CurrentEggBoostAmount = p93
			p91:RenderEntries(v94)
		end
	end,
	["Open"] = function(p95, p96, p97, p98, p99)
		-- upvalues: (copy) v_u_5, (copy) v_u_13
		table.clear(p95.Stack)
		local v100 = p95.Stack
		table.insert(v100, {
			["EggName"] = p96,
			["PityName"] = p98,
			["Breadcrumb"] = p97,
			["EggBoostAmount"] = p99
		})
		p95:RenderCurrent()
		v_u_5:Open(v_u_13)
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_13
		v_u_5:UsePopupAnims(v_u_13)
	end
}
v11.OnClientEvent:Connect(function(p102, p103, p104)
	-- upvalues: (copy) v_u_101
	v_u_101:OpenBillboard(p104, p102, p103)
end)
task.spawn(v_u_101.Start, v_u_101)
return v_u_101