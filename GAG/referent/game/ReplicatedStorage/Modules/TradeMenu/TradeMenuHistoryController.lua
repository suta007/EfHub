local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(v1.Modules.TradeControllers.TradingController)
require(v1.Data.TradeData)
require(v1.Modules.TradeControllers.TradingUserInterfaceController.TradeUIItemValueCalculators)
local v_u_5 = require(v1.Modules.NumberUtil)
require(v1.Modules.DataService)
local v_u_6 = require(v1.Modules.ItemImageFinder)
require(v1.Modules.TradeMenu.TradeMenuTypes)
require(v1.Modules.TradeControllers.TradingUserInterfaceController.TradeUIItemRenderers)
local v_u_7 = require(v1.Modules.TradeControllers.TradingUserInterfaceController)
local v_u_8 = require(v1.Modules.TradeControllers.TradingUserInterfaceController.TradeUIStaticData)
require(v1.Modules.Spring)
local v_u_9 = require(v1.Modules.TradeTokens.TokenRAPController)
local v10 = require(v1.Modules.ReplicationReciever)
local v_u_11 = require(v1.Modules.PlayClickSound)
local v_u_12 = v10.new("TokenRAPs")
local v13 = v1.GameEvents.TradeEvents.Booths.AddToHistory
local v14 = v1.Modules.TradeMenu.TradeMenuTemplates
local v_u_15 = v_u_2.LocalPlayer or v_u_2.PlayerAdded:Wait()
local v16 = v_u_15.PlayerGui
local _ = v16.TradingUI
local v_u_17 = v16.TradeMenu
local v_u_18 = v_u_17.TradeMenuFrame.FrameSECTIONS.History
local v_u_19 = v_u_18.ScrollingFrame
local v_u_20 = v_u_18.Filter
local v_u_21 = v_u_18.Sort
local v_u_22 = v_u_18.Search
local v_u_23 = v14.HistoryTemplate
local v_u_24 = v14.HistorySpacerTemplate
local v_u_25 = v14.SpacerItemTemplate
local v_u_26 = Enum.ThumbnailType.HeadShot
local v_u_27 = Enum.ThumbnailSize.Size420x420
local v_u_28 = nil
local v_u_29 = {}
local v_u_30 = 1
local v_u_31 = v_u_8.TimeLengths[v_u_30]
local v_u_32 = {}
local v_u_33 = {}
local v_u_34 = false
local v_u_35 = false
local v_u_36 = false
local v37 = {}
local function v_u_50(p38)
	-- upvalues: (copy) v_u_9
	local v39 = p38.sheckles or 0
	local v40 = p38.tokens or 0
	local v41 = {}
	for _, v42 in p38.items do
		local v43 = {
			["Data"] = v42,
			["Value"] = v_u_9:GetRAP(v42.type, v42.data) or 0
		}
		table.insert(v41, v43)
	end
	if v39 > 0 then
		table.insert(v41, {
			["Data"] = "Sheckles",
			["Value"] = v39
		})
	end
	if v40 > 0 then
		table.insert(v41, {
			["Data"] = "Tokens",
			["Value"] = v40
		})
	end
	table.sort(v41, function(p44, p45)
		return p44.Value > p45.Value
	end)
	local v46 = #v41
	local v47 = {}
	for v48 = 1, math.min(3, v46) do
		local v49 = v41[v48]
		table.insert(v47, v49)
	end
	return v47
end
local function v_u_56(p51)
	-- upvalues: (copy) v_u_9
	local v52 = p51.items
	local _ = p51.sheckles or 0
	local v53 = p51.tokens or 0
	local v54 = 0
	for _, v55 in v52 do
		v54 = v54 + (v_u_9:GetRAP(v55.type, v55.data) or 0)
	end
	return v54 + v53
end
local function v_u_65(p57, p58, p59, p60)
	-- upvalues: (copy) v_u_6
	p60.Direction.Text = p57
	local v61 = p60.Direction
	local v62
	if p57 == "Given" then
		v62 = Color3.fromRGB(255, 133, 133)
	else
		v62 = Color3.fromRGB(133, 255, 131)
	end
	v61.TextColor3 = v62
	if p58.Data == "Tokens" or p58.Data == "Sheckles" then
		if p58.Data == "Sheckles" then
			p60.Title.Text = "Sheckles"
			p60.Vector.Image = "rbxassetid://81639977198818"
		elseif p58.Data == "Tokens" then
			p60.Title.Text = "Tokens"
			p60.Vector.Image = "rbxassetid://81017486282262"
		else
			p60.Title.Text = "Traded Item"
			p60.Vector.Image = "rbxassetid://6937742258"
		end
	else
		local v63 = p58.Data.type
		local v64 = p58.Data.data
		p60.Title.Text = v64.ItemName or "No Name Found"
		p60.Vector.Image = v_u_6(v64.ItemName, v63)
	end
	p60.Parent = p59
	p60.Visible = true
end
local function v_u_97(p_u_66, p67)
	-- upvalues: (ref) v_u_31, (copy) v_u_15, (copy) v_u_19, (copy) v_u_33, (copy) v_u_23, (copy) v_u_2, (copy) v_u_26, (copy) v_u_27, (copy) v_u_56, (copy) v_u_5, (copy) v_u_50, (copy) v_u_24, (copy) v_u_25, (copy) v_u_65, (copy) v_u_29, (copy) v_u_11, (copy) v_u_3, (copy) v_u_7, (copy) v_u_17
	if p_u_66.offers then
		local v68 = p_u_66.startTime
		local v69 = p_u_66.finishTime
		local v70 = p_u_66.users
		local v71 = p_u_66.status.result
		if v68 < v_u_31 then
			return
		else
			local v72 = v70[1].userId == v_u_15.UserId and 1 or 2
			local v73 = v72 == 1 and 2 or 1
			local v74 = v_u_19:FindFirstChild((("%*"):format(p_u_66.id)))
			if not (v_u_33[p_u_66.id] or v74) then
				v74 = v_u_23:Clone()
				v74.Name = ("%*"):format(p_u_66.id)
			end
			v74.Headshot.Image = v_u_2:GetUserThumbnailAsync(v70[v73].userId, v_u_26, v_u_27)
			local v75 = os.date("%I:%M %p (%x)", v69)
			v74.TradeTime.Text = v75
			local v76 = ("%* trade with @%*"):format(v71, v70[v73].username)
			v74.TradeWithTitle.Text = v76
			local v77 = v_u_56(p_u_66.offers[v72])
			local v78 = v_u_56(p_u_66.offers[v73])
			v74.RAPgave.Text = ("Tokens given: %*"):format((v_u_5.FormatCompactPrice(v77)))
			v74.RAPgot.Text = ("Tokens received: %*"):format((v_u_5.FormatCompactPrice(v78)))
			v74.LayoutOrder = p67 * 10
			v74.Parent = v_u_19
			v74.Visible = true
			local v79 = v_u_50(p_u_66.offers[v72])
			local v80 = v_u_50(p_u_66.offers[v73])
			local v_u_81 = v_u_19:FindFirstChild((("%*Spacer"):format(p_u_66.id)))
			if not (v_u_33[p_u_66.id] or v_u_81) then
				v_u_81 = v_u_24:Clone()
				v_u_81.Name = ("%*Spacer"):format(p_u_66.id)
			end
			local v_u_82 = v_u_81.HistorySpacerButton
			local function v89(p83, p84)
				-- upvalues: (copy) v_u_82, (copy) p_u_66, (ref) v_u_33, (ref) v_u_25, (ref) v_u_65
				for v85, v86 in p84 do
					local v87 = v_u_82:FindFirstChild(p83)
					local v88 = v87:FindFirstChild((("%*%*TopItem%*"):format(p83, p_u_66.id, v85)))
					if not v_u_33[p_u_66.id] then
						v88 = v_u_25:Clone()
						v88.Name = ("%*%*TopItem%*"):format(p83, p_u_66.id, v85)
					end
					v_u_65(p83, v86, v87, v88)
				end
			end
			v89("Given", v79)
			v89("Received", v80)
			v_u_81.LayoutOrder = p67 * 10 + 1
			v_u_81.Parent = v_u_19
			v_u_81.Visible = false
			if not v_u_33[p_u_66.id] then
				v_u_33[p_u_66.id] = {
					["StartTime"] = v68,
					["TradedWith"] = string.lower(v70[v73].username),
					["HistoryEntry"] = v74,
					["HistoryDetails"] = v_u_81
				}
				v74.Activated:Connect(function()
					-- upvalues: (ref) v_u_29, (ref) v_u_81, (ref) v_u_11, (ref) v_u_3, (copy) v_u_82
					if not v_u_29[v_u_81] then
						v_u_11()
						local v_u_90 = not v_u_81.Visible
						local v91 = TweenInfo.new(0.5, Enum.EasingStyle.Quad)
						if v_u_90 then
							v_u_81.Visible = v_u_90
						end
						local v92 = v_u_3
						local v93 = v_u_82
						local v94 = {}
						local v95
						if v_u_90 then
							v95 = UDim2.fromScale(0, 0)
						else
							v95 = UDim2.fromScale(0, -1)
						end
						v94.Position = v95
						local v96 = v92:Create(v93, v91, v94)
						v96:Play()
						v_u_29[v_u_81] = v96
						v96.Completed:Once(function()
							-- upvalues: (ref) v_u_29, (ref) v_u_81, (copy) v_u_90
							if v_u_29[v_u_81] then
								v_u_29[v_u_81] = nil
							end
							v_u_81.Visible = v_u_90
						end)
					end
				end)
				v_u_82.View.Activated:Connect(function()
					-- upvalues: (ref) v_u_11, (ref) v_u_7, (copy) p_u_66, (ref) v_u_17
					v_u_11()
					v_u_7.CreatePastTrade(p_u_66, v_u_17)
				end)
			end
		end
	else
		return
	end
end
local function v_u_109()
	-- upvalues: (ref) v_u_34, (copy) v_u_8, (ref) v_u_30, (ref) v_u_31, (copy) v_u_20, (copy) v_u_33, (copy) v_u_32, (copy) v_u_97, (copy) v_u_18
	v_u_34 = true
	local v98 = v_u_8.TimeLengths
	local v99 = (v_u_30 + 1) % (#v98 + 1)
	v_u_30 = math.max(v99, 1)
	v_u_31 = v98[v_u_30]
	local v100 = v_u_8.TimeLengthDisplay[v_u_30]
	v_u_20:FindFirstChild("Label").Text = ("Last %*"):format(v100)
	if v_u_30 == 1 then
		for v101, v102 in v_u_33 do
			if v102.StartTime < v_u_31 then
				v102.HistoryEntry:Destroy()
				v102.HistoryDetails:Destroy()
				v_u_33[v101] = nil
			end
		end
	end
	local v103 = {}
	for _, v104 in v_u_32 do
		if v104.startTime >= v_u_31 then
			table.insert(v103, v104)
		end
	end
	table.sort(v103, function(p105, p106)
		return p105.startTime > p106.startTime
	end)
	for v107, v108 in v103 do
		if v_u_33[v108.id] then
			v_u_33[v108.id].HistoryEntry.LayoutOrder = v107 * 10
			v_u_33[v108.id].HistoryDetails.LayoutOrder = v107 * 10 + 1
		else
			v_u_97(v108, v107)
		end
	end
	v_u_18.Empty.Visible = #v103 == 0
	v_u_18.Empty.Text = ("No history found in the last %*"):format(v100)
	v_u_34 = false
end
local function v_u_117()
	-- upvalues: (ref) v_u_35, (ref) v_u_36, (copy) v_u_21, (copy) v_u_33
	v_u_35 = true
	v_u_36 = not v_u_36
	v_u_21:FindFirstChild("Label").Text = "Trade Time"
	v_u_21:FindFirstChild("Vector").Rotation = v_u_36 and 0 or 180
	local v110 = {}
	for _, v111 in v_u_33 do
		table.insert(v110, v111)
	end
	if v_u_36 then
		table.sort(v110, function(p112, p113)
			return p112.StartTime > p113.StartTime
		end)
	else
		table.sort(v110, function(p114, p115)
			return p114.StartTime < p115.StartTime
		end)
	end
	for v116 = 1, #v110 do
		v110[v116].HistoryEntry.LayoutOrder = v116 * 10
		v110[v116].HistoryDetails.LayoutOrder = v116 * 10 + 1
	end
	v_u_35 = false
end
local function v_u_120(p118)
	-- upvalues: (copy) v_u_97, (copy) v_u_19, (copy) v_u_18
	v_u_97(p118, 0)
	for _, v119 in v_u_19:GetChildren() do
		if v119:IsA("ImageButton") then
			v119.LayoutOrder = v119.LayoutOrder + 10
		end
	end
	v_u_18.Empty.Visible = false
end
local function v_u_123()
	-- upvalues: (ref) v_u_28, (copy) v_u_97, (copy) v_u_18
	if v_u_28 then
		for v121, v122 in v_u_28 do
			v_u_97(v122, v121)
		end
		v_u_18.Empty.Visible = #v_u_28 == 0
	else
		warn("No Saved Trade History")
	end
end
function v37.SetUpHistoryUI()
	-- upvalues: (copy) v_u_4, (ref) v_u_28, (copy) v_u_8, (copy) v_u_32, (ref) v_u_30, (copy) v_u_109, (copy) v_u_20, (copy) v_u_11, (ref) v_u_34, (ref) v_u_35, (copy) v_u_117, (copy) v_u_21, (copy) v_u_22, (copy) v_u_33, (copy) v_u_12, (copy) v_u_123
	local v124, v125 = v_u_4:FetchTradeHistory()
	if not v124 then
		warn("Failed to find booth history on load.")
		v125 = {}
	end
	local v126 = table.clone(v125)
	v_u_28 = v126
	table.sort(v126, function(p127, p128)
		return p127.startTime > p128.startTime
	end)
	for _, v129 in v126 do
		if v129.status.result ~= "Failed" and v129.startTime >= v_u_8.TimeLengths[#v_u_8.TimeLengths] then
			local v130 = v_u_32
			table.insert(v130, v129)
		end
	end
	v_u_30 = 0
	v_u_109()
	v_u_20.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_34, (ref) v_u_35, (ref) v_u_109
		v_u_11()
		if not (v_u_34 or v_u_35) then
			v_u_109()
		end
	end)
	v_u_117()
	v_u_21.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_35, (ref) v_u_34, (ref) v_u_117
		v_u_11()
		if not (v_u_35 or v_u_34) then
			v_u_117()
		end
	end)
	v_u_22.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		-- upvalues: (ref) v_u_22, (ref) v_u_33
		local v131 = string.lower(v_u_22.TextBox.Text)
		for _, v132 in v_u_33 do
			if string.find(v132.TradedWith, v131) then
				v132.HistoryEntry.Visible = true
				v132.HistoryDetails.Visible = false
			else
				v132.HistoryEntry.Visible = false
				v132.HistoryDetails.Visible = false
			end
		end
	end)
	local v133 = v_u_12:GetPathSignal("RAPs/@")
	if v133 then
		v133:Connect(v_u_123)
	end
	v_u_12:GetDataAsync()
end
v13.OnClientEvent:Connect(function(p134)
	-- upvalues: (ref) v_u_34, (copy) v_u_120
	if not v_u_34 then
		v_u_120(p134)
	end
end)
return v37