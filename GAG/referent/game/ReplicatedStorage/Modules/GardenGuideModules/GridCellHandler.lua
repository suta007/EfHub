local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = script.Parent
local v_u_4 = require(v3.DetailsViewHandler)
require(v3.SortButtonsLogic)
local v_u_5 = require(v3.GGButtonEffects)
local v_u_6 = require(v3.DataModules.GGStaticData)
local v_u_7 = require(v1.Modules.DataService)
local v_u_8 = require(v3.DataModules.GGData)
local v_u_9 = require(v1.Data.SeedData)
local v_u_10 = require(v3.GGUI)
local v_u_11 = v1.GameEvents.GardenGuide.GardenGuide_RE_MarkOffNew
local v_u_12 = v3.Templates.GridCellTemplate
local v13 = v2.LocalPlayer.PlayerGui.GardenGuide.MainMenu
local v_u_14 = v13.MainMenuFrame
local v_u_15 = v_u_14.GridView
local _ = v_u_15.CompletionBar
local v16 = v13.TopBar
local v_u_17 = v_u_14.SearchBar
local _ = v16.Title
local _ = v16.Exit
local _ = v16.Back
local v_u_18 = v13.FilterSidebar
local v_u_19 = v_u_18.Main.Sort
local v_u_20 = v_u_18.Main.Filter
local v_u_21 = {}
local function v_u_32(p22, p23)
	p22:FindFirstChild("OBTAINED_IMAGE")
	local v24 = p22:FindFirstChild("NewBanner")
	local v25 = p22:FindFirstChild("Cover")
	p22:FindFirstChild("HarvestBar")
	local v26 = p22:FindFirstChild("Mastery")
	local v27 = p22:FindFirstChild("ITEM_NAME")
	local v28 = p22:FindFirstChild("ITEM_NAME_SHADOW")
	local v29 = p22:FindFirstChild("ITEM_IMAGE")
	local v30 = p22:GetAttribute("Seen")
	v27.Visible = v30
	v28.Visible = v30
	v25.Visible = not v30
	v29.ImageColor3 = v30 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
	v26.Image = p22:GetAttribute("Mastered") and "rbxassetid://140518329666464" or "rbxassetid://99302990527020"
	local v31
	if v30 then
		v31 = p23 == "Plant"
	else
		v31 = v30
	end
	v26.Visible = v31
	if v30 then
		v24.Visible = p22:GetAttribute("New")
	else
		v24.Visible = false
	end
end
local function v_u_41(p33, p34)
	-- upvalues: (copy) v_u_8, (copy) v_u_11, (copy) v_u_32, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_17, (copy) v_u_10, (copy) v_u_14, (copy) v_u_4
	local v35 = p34.Name:gsub("Menu", "")
	local v36 = v_u_8[v35].Data
	local v37 = v36[p33.Name] or v36[p33.Name:gsub(" ", "")]
	if v37 then
		if p34 then
			local v38 = p34.Name:gsub("Menu", "")
			v_u_11:FireServer(v38, v37.Name)
			p33:SetAttribute("New", false)
			v_u_32(p33, v38)
			v37.New = false
			p34.Visible = false
			v_u_18.Visible = false
			v_u_19.Visible = false
			v_u_20.Visible = false
			local v39 = v_u_17.Main.TextBox.Text
			v_u_10.ChangeTopBar(v37.DisplayName or v37.Name, false)
			v_u_17.Main.TextBox.Text = v39
			local v40 = v_u_14:FindFirstChild((("%*Details"):format(v37.Name)))
			if not v40 then
				if v_u_10.CurrentDetail then
					v_u_10.CurrentDetail:Destroy()
				end
				v40 = v_u_4.CreateDetailsView(v_u_14, v37, v38)
			end
			if v40 then
				v40.Visible = true
				v_u_10.CurrentDetail = v40
			end
			v_u_10.GoNextPage(v40, p34)
		else
			warn("No prev page for passing datatype")
		end
	else
		warn((("No data for %* in %*Data"):format(p33.Name, v35)))
		return
	end
end
function v_u_21.RemakeGridCell(p42, _, p43, p44)
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_32, (copy) v_u_7
	p42.Name = p43.Name
	if v_u_6.RarityColorMap[p43.Rarity] then
		if v_u_6.AnimatedColors[p43.Rarity] then
			v_u_6.AnimatedColors[p43.Rarity](p42)
		else
			p42.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(v_u_6.RarityColorMap[p43.Rarity], 0.75)
		end
	else
		p42.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	end
	if p44 == "Mutation" then
		p42.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(p43.Color, 0.75)
	end
	p42:FindFirstChild("ITEM_IMAGE").Image = p43.ImageId
	local v45 = p42:FindFirstChild("ITEM_NAME")
	local v46 = p42:FindFirstChild("ITEM_NAME_SHADOW")
	local v47 = p43.DisplayName or p43.Name
	local v48 = v_u_9[v47]
	if v48 then
		if v48.DisplayName then
			v47 = v48.DisplayName:gsub("Seed", "") or v47
		end
	end
	v45.Text = v47
	v46.Text = v47
	p42:SetAttribute("DetailsId", p43.Name)
	p42:SetAttribute("New", p43.New)
	p42:SetAttribute("Seen", p43.Seen)
	p42:SetAttribute("Rarity", p43.Rarity)
	p42:SetAttribute("Event", p43.Source)
	p42:SetAttribute("Mastered", p43.Mastered)
	v_u_32(p42, p44)
	if p43.Traits then
		p42:SetAttribute("Traits", (p43.Traits:gsub("<[^>]->", "")))
	end
	p42:FindFirstChild("SENSOR").Interactable = v_u_7:GetData().GardenGuide[("%*Data"):format(p44)][p43.Name] and true or false
	p42.Visible = true
end
function v_u_21.CreateGridCell(p_u_49, p50, p51)
	-- upvalues: (copy) v_u_12, (copy) v_u_21, (copy) v_u_41
	local v_u_52 = v_u_12:Clone()
	v_u_21.RemakeGridCell(v_u_52, p_u_49, p50, p51)
	local v53 = v_u_52:FindFirstChild("SENSOR")
	local v_u_54 = v53.Activated:Connect(function()
		-- upvalues: (ref) v_u_41, (copy) v_u_52, (copy) p_u_49
		v_u_41(v_u_52, p_u_49)
	end)
	v53.Destroying:Once(function()
		-- upvalues: (ref) v_u_54
		if v_u_54 then
			v_u_54:Disconnect()
			v_u_54 = nil
		end
	end)
	return v_u_52
end
function v_u_21.UpdateGridCell(p55, _, p56, _)
	-- upvalues: (copy) v_u_15, (copy) v_u_5
	local v57 = v_u_15:FindFirstChild((("%*Menu"):format(p55))):FindFirstChild(p56)
	if v57 then
		v57:SetAttribute("New", true)
		v57:SetAttribute("Seen", true)
		local v58 = v57:FindFirstChild("SENSOR")
		v58.Interactable = true
		v_u_5.AddHoverEffect(v58)
		return v57
	end
end
return v_u_21