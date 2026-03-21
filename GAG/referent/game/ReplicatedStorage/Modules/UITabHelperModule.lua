local v_u_1 = require(game:GetService("ReplicatedStorage").Modules.Signal)
local v_u_2 = {}
local function v_u_8(p3, p4, p5)
	local v6 = p5 or false
	local v7 = p3.TabLookup[p4]
	if v7 == nil then
		warn("UITabHelperModule: lockTab: Tab not registered.")
		return
	elseif v7.IsLocked == nil or v7.IsLocked ~= true then
		v7.IsLocked = true
		if p3.CurrentCategory == p4 then
			if v6 then
				p3.CurrentCategory = p3.DefaultCategory
				if p3.OnCategoryChanged ~= nil then
					p3.OnCategoryChanged:Fire(p3.CurrentCategory)
				end
			else
				p3.SetCurrentCategory(p3.DefaultCategory)
			end
		elseif not v6 then
			p3.RebuildCategoryList()
		end
	else
		v7.IsLocked = true
		return
	end
end
local function v_u_12(p9, p10)
	p9.TabCategories = p10
	p9.TabLookup = {}
	for _, v11 in p10 do
		p9.TabLookup[v11.Name] = v11
	end
	p9.RebuildCategoryList()
end
local function v_u_15(p13, p14)
	if p13.TabLookup[p14] == nil then
		warn("UITabHelperModule: setCurrentCategory: Category not registered.")
		return
	elseif p13.TabLookup[p14].IsLocked == nil or p13.TabLookup[p14].IsLocked ~= true then
		p13.CurrentCategory = p14
		p13.RebuildCategoryList()
		if p13.OnCategoryChanged then
			p13.OnCategoryChanged:Fire(p13.CurrentCategory)
		end
	else
		warn("UITabHelperModule: setCurrentCategory: Can\'t set category to " .. p14 .. ". Reason: Category locked.")
	end
end
local function v_u_19(p16)
	for _, v17 in p16.TabButtonConnections do
		v17:Disconnect()
	end
	table.clear(p16.TabButtonConnections)
	for _, v18 in p16.ButtonWidgets do
		v18:Destroy()
	end
	table.clear(p16.ButtonWidgets)
end
local function v_u_32(p_u_20)
	local v21
	if p_u_20.CurrentCategory == nil and p_u_20.DefaultCategory ~= nil then
		p_u_20.CurrentCategory = p_u_20.DefaultCategory
		v21 = true
	else
		v21 = false
	end
	if p_u_20.RootWidget == nil then
		error((("UITabHelper: %* has a null root widget."):format(p_u_20.ID)))
	end
	p_u_20.ClearAllTabs()
	local v22 = 0.85 / #p_u_20.TabCategories
	local v23 = math.clamp(v22, 0.01, 0.1)
	for _, v24 in p_u_20.TabCategories do
		local v_u_25 = p_u_20.TabButtonTemplate:Clone()
		local v26 = v_u_25.ZIndex
		local v27 = v_u_25:WaitForChild("CategoryLabel")
		local v28 = v_u_25:WaitForChild("LockedLabel")
		if v27:IsA("TextLabel") and v28:IsA("TextLabel") then
			v27.Text = v24.Name
			v_u_25.Name = v24.Name
			local v29 = p_u_20.ButtonWidgets
			table.insert(v29, v_u_25)
			v_u_25.Parent = p_u_20.RootWidget
			v_u_25.AutoButtonColor = true
			v_u_25.Interactable = true
			v_u_25.Size = UDim2.new(1, 0, v23, nil)
			if v24.IsLocked == nil or v24.IsLocked ~= true then
				v28.Visible = false
				v27.Visible = true
				if p_u_20.CurrentCategory == v_u_25.Name then
					v_u_25.Size = v_u_25.Size + UDim2.new(0.05, 0, 0.025)
					v_u_25.BorderColor3 = Color3.new(1, 1, 1)
					v_u_25.BorderSizePixel = 4
					v_u_25.ZIndex = v26 + 1
				else
					v_u_25.BackgroundColor3 = Color3.new(v_u_25.BackgroundColor3.R * 0.7, v_u_25.BackgroundColor3.G * 0.7, v_u_25.BackgroundColor3.B * 0.7)
					v_u_25.BorderColor3 = Color3.new(0.364706, 0.352941, 0.0784314)
					v_u_25.ZIndex = v26
				end
				local v30 = p_u_20.TabButtonConnections
				local v31 = v_u_25.Activated
				table.insert(v30, v31:Connect(function()
					-- upvalues: (copy) p_u_20, (copy) v_u_25
					p_u_20.SetCurrentCategory(v_u_25.Name)
				end))
			else
				v_u_25.ImageColor3 = Color3.new(0.3, 0.3, 0.3)
				v_u_25.AutoButtonColor = false
				v_u_25.Interactable = false
				v27.TextTransparency = 0.6
				v_u_25.BackgroundColor3 = Color3.new(v_u_25.BackgroundColor3.R * 0.5, v_u_25.BackgroundColor3.G * 0.5, v_u_25.BackgroundColor3.B * 0.5)
				v_u_25.BorderColor3 = Color3.new(0.364706, 0.352941, 0.0784314)
				v28.Visible = true
				v27.Visible = false
			end
		end
	end
	if v21 and p_u_20.OnCategoryChanged then
		p_u_20.OnCategoryChanged:Fire(p_u_20.CurrentCategory)
	end
end
return {
	["CreateOrGetTabHandler"] = function(p_u_33, p34, p35)
		-- upvalues: (ref) v_u_2, (copy) v_u_12, (copy) v_u_32, (copy) v_u_15, (copy) v_u_19, (copy) v_u_8, (copy) v_u_1
		if v_u_2 == nil then
			v_u_2 = {}
		end
		if not v_u_2[p_u_33] then
			v_u_2[p_u_33] = {
				["SetCategories"] = function(p36)
					-- upvalues: (ref) v_u_12, (ref) v_u_2, (copy) p_u_33
					v_u_12(v_u_2[p_u_33], p36)
				end,
				["RebuildCategoryList"] = function()
					-- upvalues: (ref) v_u_32, (ref) v_u_2, (copy) p_u_33
					v_u_32(v_u_2[p_u_33])
				end,
				["SetCurrentCategory"] = function(p37)
					-- upvalues: (ref) v_u_15, (ref) v_u_2, (copy) p_u_33
					v_u_15(v_u_2[p_u_33], p37)
				end,
				["ClearAllTabs"] = function()
					-- upvalues: (ref) v_u_19, (ref) v_u_2, (copy) p_u_33
					v_u_19(v_u_2[p_u_33])
				end,
				["UnlockTab"] = function(p38, p39)
					-- upvalues: (ref) v_u_2, (copy) p_u_33
					local v40 = v_u_2[p_u_33]
					local v41 = p39 or false
					local v42 = v40.TabLookup[p38]
					if v42 == nil then
						warn("UITabHelperModule: unlockTab: Tab not registered.")
						return
					elseif v42.IsLocked == nil or v42.IsLocked == false then
						v42.IsLocked = false
						return
					else
						v42.IsLocked = false
						if not v41 then
							v40.RebuildCategoryList()
						end
					end
				end,
				["LockTab"] = function(p43, p44)
					-- upvalues: (ref) v_u_8, (ref) v_u_2, (copy) p_u_33
					v_u_8(v_u_2[p_u_33], p43, p44)
				end,
				["TabButtonConnections"] = {},
				["TabCategories"] = {},
				["TabLookup"] = {},
				["DefaultCategory"] = "All",
				["ButtonWidgets"] = {},
				["RootWidget"] = p34,
				["TabButtonTemplate"] = p35,
				["ID"] = p_u_33,
				["OnCategoryChanged"] = v_u_1.new()
			}
			return v_u_2[p_u_33]
		end
		local v45 = v_u_2[p_u_33]
		v45.RootWidget = p34
		v45.TabButtonTemplate = p35
		return v45
	end,
	["DisposeTabHandler"] = function(p46)
		-- upvalues: (ref) v_u_2
		local v47 = p46.ID
		if v_u_2[v47] then
			v_u_2[v47] = nil
		end
	end,
	["DisposeTabHandlerID"] = function(p48)
		-- upvalues: (ref) v_u_2
		if v_u_2[p48] then
			v_u_2[p48] = nil
		end
	end
}