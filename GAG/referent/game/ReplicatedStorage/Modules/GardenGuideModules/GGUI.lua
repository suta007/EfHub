local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = v1.Modules.GardenGuideModules
local v_u_4 = require(v3.GGButtonEffects)
local v_u_5 = require(v3.DataModules.GGData)
local v6 = require(v1.Modules.Signal)
local v7 = v2.LocalPlayer.PlayerGui.GardenGuide
local v8 = v7.MainMenu
local v9 = v8.MainMenuFrame
local v_u_10 = v9.GridView
local v_u_11 = v_u_10.CompletionBar
local v_u_12 = v9.SearchBar
local v_u_13 = v8.TopBar
local v_u_14 = v_u_13.Title
local v_u_15 = v_u_13.Exit
local v_u_16 = v_u_13.Back
local v_u_17 = v7.MainMenu.FilterSidebar
local v_u_18 = v_u_17.Main.Sort
local _ = v_u_13.SORT_BUTTON.Main.SENSOR
local v_u_19 = v_u_17.Main.Filter
local _ = v_u_13.FILTER_BUTTON.Main.SENSOR
local v_u_31 = {
	["GridSFrame"] = v_u_10.GridSFrame,
	["SearchBar"] = v_u_12,
	["OnPageOrderUpdate"] = v6.new(),
	["PageOrder"] = {},
	["PrevPage"] = nil,
	["CurrentPage"] = nil,
	["CurrentDetail"] = nil,
	["FilterAlgo"] = nil,
	["FilterType"] = nil,
	["SortAlgo"] = nil,
	["GoNextPage"] = function(p20, p21)
		-- upvalues: (copy) v_u_4, (copy) v_u_31, (copy) v_u_15, (copy) v_u_16
		v_u_4.Click()
		p20.Visible = true
		p21.Visible = false
		v_u_31.CurrentPage = p20
		v_u_31.PrevPage = p21
		if #v_u_31.PageOrder == 0 then
			local v22 = v_u_31.PageOrder
			table.insert(v22, p21)
		end
		local v23 = v_u_31.PageOrder
		table.insert(v23, p20)
		v_u_31.OnPageOrderUpdate:Fire()
		if #v_u_31.PageOrder > 1 then
			v_u_15.Visible = false
			v_u_16.Visible = true
		else
			v_u_15.Visible = true
			v_u_16.Visible = false
		end
	end,
	["GoBackPage"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_31, (copy) v_u_15, (copy) v_u_16
		v_u_4.Click()
		local v24 = v_u_31.PageOrder[#v_u_31.PageOrder]
		local v25 = v_u_31.PageOrder[#v_u_31.PageOrder - 1]
		v25.Visible = true
		v24.Visible = false
		table.remove(v_u_31.PageOrder, #v_u_31.PageOrder)
		v_u_31.CurrentPage = v25
		v_u_31.PrevPage = v24
		local v26 = v_u_31.CurrentPage.Name:gsub("Menu", ""):gsub("View", "")
		v_u_31.ChangeTopBar(v26, string.find(v_u_31.CurrentPage.Name, "Menu") and true or false)
		if v_u_31.CurrentDetail then
			v_u_31.CurrentDetail:Destroy()
		end
		if #v_u_31.PageOrder > 1 then
			v_u_15.Visible = false
			v_u_16.Visible = true
			v_u_31.CurrentDetail = v_u_31.CurrentPage
		else
			v_u_15.Visible = true
			v_u_16.Visible = false
			table.remove(v_u_31.PageOrder, #v_u_31.PageOrder)
		end
		v_u_31.OnPageOrderUpdate:Fire()
	end,
	["NewPageOrder"] = function(p27, p28)
		-- upvalues: (copy) v_u_31, (copy) v_u_15, (copy) v_u_16
		p28.Visible = false
		p27.Visible = true
		v_u_31.CurrentPage = p27
		v_u_15.Visible = true
		v_u_16.Visible = false
		v_u_31.PageOrder = { p27 }
		v_u_31.OnPageOrderUpdate:Fire()
	end,
	["ChangeTopBar"] = function(p29, p30)
		-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_13, (copy) v_u_31, (copy) v_u_18, (copy) v_u_19, (copy) v_u_17, (copy) v_u_11, (copy) v_u_12, (copy) v_u_10
		if v_u_5[p29] then
			v_u_14.Text = ("%*s"):format(p29)
			v_u_13.SORT_BUTTON.Visible = p30
			v_u_13.FILTER_BUTTON.Visible = p30
		else
			v_u_14.Text = p29
			v_u_13.SORT_BUTTON.Visible = false
			v_u_13.FILTER_BUTTON.Visible = false
		end
		v_u_31.SortAlgo = nil
		v_u_31.FilterAlgo = nil
		v_u_31.FilterType = nil
		v_u_18.Visible = false
		v_u_19.Visible = false
		v_u_17.Visible = false
		v_u_11.Visible = p30
		v_u_12.Visible = p30
		v_u_12.Main.TextBox.Text = ""
		v_u_10.Visible = p30
		v_u_31.GridSFrame.Visible = p30
	end
}
return v_u_31