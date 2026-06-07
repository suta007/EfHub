game:GetService("ProximityPromptService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = require(v1.Modules.BeeEventV2Controllers.WaspRewardOddsShared)
local v_u_5 = require(v1.Data.BeeEvent.BeeEggRegistry)
require(v1.Modules.CreateTagHandler)
local v_u_6 = require(v1.Modules.ItemImageFinder)
local v_u_7 = require(v1.Modules.GuiController)
local v_u_8 = require(v1.Modules.DataService)
local v_u_9 = require(v1.Modules.Trove)
local v_u_10 = v3.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Odds_UI")
local v_u_11 = v_u_10.Frame.Main.Items
local v_u_12 = v_u_9.new()
local v54 = {
	["States"] = {},
	["ClearEntries"] = function(_) -- name: ClearEntries
		-- upvalues: (copy) v_u_11
		for _, v13 in v_u_11.ScrollingFrame:GetChildren() do
			if v13:IsA("GuiObject") and (v13.Name ~= "UIListLayout" and not v13:IsDescendantOf(v_u_11.ScrollingFrame.UIListLayout)) then
				v13:Destroy()
			end
		end
	end,
	["Render"] = function(p14, p15) -- name: Render
		-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_11, (ref) v_u_12, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2, (copy) v_u_10
		p14:ClearEntries()
		local v16 = v_u_8:GetData()
		local v17 = v16 and v16.BeeEventData
		if v17 then
			v17 = v16.BeeEventData.CombatSkillTree
		end
		local v18 = (v17 and v17.Looting or 0) * 0.15
		local v19 = {}
		for _, v20 in v_u_4.GetOdds(p15, v18) do
			local v21 = v20.PerCrateChance * 100
			local v22 = {
				["Name"] = v20.Value,
				["Type"] = v20.Type,
				["Odd"] = v21
			}
			local v23 = string.format
			v22.Text = ("%*%%"):format((tonumber(v23("%.2f", v21))))
			v22.Tier = v20.Tier
			v22.Min = v20.Min
			v22.Max = v20.Max
			table.insert(v19, v22)
		end
		table.sort(v19, function(p24, p25)
			if p24.IsGuaranteed then
				return true
			elseif p25.IsGuaranteed then
				return false
			else
				return p24.Odd < p25.Odd
			end
		end)
		local v26 = (1 / 0)
		local v27 = nil
		local v28 = true
		for _, v29 in v19 do
			if not v29.IsGuaranteed and v29.Odd < v26 then
				v26 = v29.Odd
			end
		end
		for _, v30 in v19 do
			if not v30.IsGuaranteed then
				local v31 = v30.Odd - v26
				if math.abs(v31) > 1e-6 then
					v28 = false
					if v27 == nil or v30.Odd < v27 then
						v27 = v30.Odd
					end
				end
			end
		end
		local v32 = v_u_11.ScrollingFrame
		for _, v33 in v19 do
			local v34 = not (v33.IsGuaranteed or v28)
			if v34 then
				local v35 = v33.Odd - v26
				v34 = math.abs(v35) < 1e-6
			end
			local v36 = not v33.IsGuaranteed
			if v36 then
				if v27 == nil then
					v36 = false
				else
					local v37 = v33.Odd - v27
					v36 = math.abs(v37) < 1e-6
				end
			end
			local v38
			if v34 then
				v38 = v32.UIListLayout.TemplateRainbow
			elseif v36 then
				v38 = v32.UIListLayout.TemplateBigger
			else
				v38 = v32.UIListLayout.TemplateSmaller
			end
			local v_u_39 = v_u_12:Clone(v38)
			local v40 = v33.Odd * 1000
			v_u_39.LayoutOrder = -math.floor(v40)
			local v41 = v_u_39.Title
			local v42
			if v33.Min == 1 and v33.Max == 1 then
				v42 = v33.Name
			elseif v33.Min == v33.Max then
				v42 = ("%*x %*"):format(v33.Min, v33.Name)
			else
				v42 = ("%*-%*x %*"):format(v33.Min, v33.Max, v33.Name)
			end
			v41.Text = v42
			v_u_39.Odds.Text = ""
			local v43 = v33.Name
			local v44 = v33.Type
			local v45 = v_u_5.Entries[v43]
			local v46
			if v45 and v45.Icon then
				v46 = v45.Icon
			else
				v46 = v_u_6(v43, v44)
			end
			v_u_39.Vector.Image = v46
			local v47 = v_u_39.Vector
			local v48
			if v46 == nil then
				v48 = false
			else
				v48 = v46 ~= ""
			end
			v47.Visible = v48
			if v_u_39:FindFirstChild("OddsButton") then
				v_u_39.OddsButton.Visible = false
			end
			if v34 then
				v_u_12:Add(v_u_2.PostSimulation:Connect(function()
					-- upvalues: (copy) v_u_39
					if v_u_39.Parent then
						local v49 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
						v_u_39.Odds.TextColor3 = v49
						v_u_39.Title.TextColor3 = v49
					end
				end))
			elseif v36 then
				local v50 = Color3.fromRGB(255, 204, 1)
				v_u_39.Odds.TextColor3 = v50
				v_u_39.Title.TextColor3 = v50
			end
			v_u_39.Title.TextScaled = true
			v_u_39.Odds.TextScaled = true
			v_u_39.Parent = v32
		end
		if v32.AbsoluteCanvasSize.X > v32.AbsoluteWindowSize.X then
			v32.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		else
			v32.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		end
		v_u_10.Frame.ExpandButton.Visible = false
	end,
	["Open"] = function(p51, p52, p_u_53) -- name: Open
		-- upvalues: (ref) v_u_12, (copy) v_u_9, (copy) v_u_7, (copy) v_u_10
		v_u_12:Destroy()
		v_u_12 = v_u_9.new()
		p51:Render(p52 or "Wasp King")
		v_u_7:Open(v_u_10)
		v_u_12:Add(v_u_10.Frame.ExitButton.Activated:Once(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_10, (copy) p_u_53, (ref) v_u_12
			v_u_7:Close(v_u_10)
			if p_u_53 then
				v_u_7:Open(p_u_53)
			end
			v_u_12:Clean()
		end))
	end,
	["Start"] = function(_) -- name: Start
		-- upvalues: (copy) v_u_7, (copy) v_u_10
		v_u_7:UsePopupAnims(v_u_10)
	end
}
task.spawn(v54.Start, v54)
return v54