local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = script.Parent
local v_u_4 = require(v3.DetailsViewHandler)
require(v3.SortButtonsLogic)
local v_u_5 = require(v3.GGButtonEffects)
local v_u_6 = require(v3.DataModules.GGStaticData)
local v_u_7 = require(v1.Modules.DataService)
local v_u_8 = require(v3.DataModules.GGData)
local v_u_9 = require(v3.GGUI)
local v_u_10 = v1.GameEvents.GardenGuide.GardenGuide_RE_MarkOffNew
local v_u_11 = v3.Templates.GridCellTemplate
local v12 = v2.LocalPlayer.PlayerGui.GardenGuide.MainMenu
local v_u_13 = v12.MainMenuFrame
local v_u_14 = v_u_13.GridView
local _ = v_u_14.CompletionBar
local v15 = v12.TopBar
local v_u_16 = v_u_13.SearchBar
local _ = v15.Title
local _ = v15.Exit
local _ = v15.Back
local v_u_17 = v12.FilterSidebar
local v_u_18 = v_u_17.Main.Sort
local v_u_19 = v_u_17.Main.Filter
local v_u_20 = {}
local function v_u_31(p21, p22)
	p21:FindFirstChild("OBTAINED_IMAGE")
	local v23 = p21:FindFirstChild("NewBanner")
	local v24 = p21:FindFirstChild("Cover")
	p21:FindFirstChild("HarvestBar")
	local v25 = p21:FindFirstChild("Mastery")
	local v26 = p21:FindFirstChild("ITEM_NAME")
	local v27 = p21:FindFirstChild("ITEM_NAME_SHADOW")
	local v28 = p21:FindFirstChild("ITEM_IMAGE")
	local v29 = p21:GetAttribute("Seen")
	v26.Visible = v29
	v27.Visible = v29
	v24.Visible = not v29
	v28.ImageColor3 = v29 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
	v25.Image = p21:GetAttribute("Mastered") and "rbxassetid://140518329666464" or "rbxassetid://99302990527020"
	local v30
	if v29 then
		v30 = p22 == "Plant"
	else
		v30 = v29
	end
	v25.Visible = v30
	if v29 then
		v23.Visible = p21:GetAttribute("New")
	else
		v23.Visible = false
	end
end
local function v_u_40(p32, p33)
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_31, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_16, (copy) v_u_9, (copy) v_u_13, (copy) v_u_4
	local v34 = p33.Name:gsub("Menu", "")
	local v35 = v_u_8[v34].Data
	local v36 = v35[p32.Name] or v35[p32.Name:gsub(" ", "")]
	if v36 then
		if p33 then
			local v37 = p33.Name:gsub("Menu", "")
			v_u_10:FireServer(v37, v36.Name)
			p32:SetAttribute("New", false)
			v_u_31(p32, v37)
			v36.New = false
			p33.Visible = false
			v_u_17.Visible = false
			v_u_18.Visible = false
			v_u_19.Visible = false
			local v38 = v_u_16.Main.TextBox.Text
			v_u_9.ChangeTopBar(v36.DisplayName or v36.Name, false)
			v_u_16.Main.TextBox.Text = v38
			local v39 = v_u_13:FindFirstChild((("%*Details"):format(v36.Name)))
			if not v39 then
				if v_u_9.CurrentDetail then
					v_u_9.CurrentDetail:Destroy()
				end
				v39 = v_u_4.CreateDetailsView(v_u_13, v36, v37)
			end
			if v39 then
				v39.Visible = true
				v_u_9.CurrentDetail = v39
			end
			v_u_9.GoNextPage(v39, p33)
		else
			warn("No prev page for passing datatype")
		end
	else
		warn((("No data for %* in %*Data"):format(p32.Name, v34)))
		return
	end
end
function v_u_20.RemakeGridCell(p41, _, p42, p43)
	-- upvalues: (copy) v_u_6, (copy) v_u_31, (copy) v_u_7
	p41.Name = p42.Name
	if v_u_6.RarityColorMap[p42.Rarity] then
		if v_u_6.AnimatedColors[p42.Rarity] then
			v_u_6.AnimatedColors[p42.Rarity](p41)
		else
			p41.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(v_u_6.RarityColorMap[p42.Rarity], 0.75)
		end
	else
		p41.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	end
	if p43 == "Mutation" then
		p41.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(p42.Color, 0.75)
	end
	p41:FindFirstChild("ITEM_IMAGE").Image = p42.ImageId
	local v44 = p41:FindFirstChild("ITEM_NAME")
	local v45 = p41:FindFirstChild("ITEM_NAME_SHADOW")
	local v46 = p42.DisplayName or p42.Name
	v44.Text = v46
	v45.Text = v46
	p41:SetAttribute("DetailsId", p42.Name)
	p41:SetAttribute("New", p42.New)
	p41:SetAttribute("Seen", p42.Seen)
	p41:SetAttribute("Rarity", p42.Rarity)
	p41:SetAttribute("Event", p42.Source)
	p41:SetAttribute("Mastered", p42.Mastered)
	v_u_31(p41, p43)
	if p42.Traits then
		p41:SetAttribute("Traits", (p42.Traits:gsub("<[^>]->", "")))
	end
	p41:FindFirstChild("SENSOR").Interactable = v_u_7:GetData().GardenGuide[("%*Data"):format(p43)][p42.Name] and true or false
	p41.Visible = true
end
function v_u_20.CreateGridCell(p_u_47, p48, p49)
	-- upvalues: (copy) v_u_11, (copy) v_u_20, (copy) v_u_40
	local v_u_50 = v_u_11:Clone()
	v_u_20.RemakeGridCell(v_u_50, p_u_47, p48, p49)
	local v51 = v_u_50:FindFirstChild("SENSOR")
	local v_u_52 = v51.Activated:Connect(function()
		-- upvalues: (ref) v_u_40, (copy) v_u_50, (copy) p_u_47
		v_u_40(v_u_50, p_u_47)
	end)
	v51.Destroying:Once(function()
		-- upvalues: (ref) v_u_52
		if v_u_52 then
			v_u_52:Disconnect()
			v_u_52 = nil
		end
	end)
	return v_u_50
end
function v_u_20.UpdateGridCell(p53, _, p54, _)
	-- upvalues: (copy) v_u_14, (copy) v_u_5
	local v55 = v_u_14:FindFirstChild((("%*Menu"):format(p53))):FindFirstChild(p54)
	if v55 then
		v55:SetAttribute("New", true)
		v55:SetAttribute("Seen", true)
		local v56 = v55:FindFirstChild("SENSOR")
		v56.Interactable = true
		v_u_5.AddHoverEffect(v56)
		return v55
	end
end
return v_u_20