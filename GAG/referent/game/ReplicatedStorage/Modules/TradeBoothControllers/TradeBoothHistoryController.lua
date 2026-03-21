local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GuiController)
local v_u_4 = require(v1.Modules.TradeControllers.TradeWorldController)
require(v1.Data.TradeData)
local v_u_5 = require(v1.Modules.TradeControllers.TradingController)
require(v1.Modules.NumberUtil)
local v_u_6 = require(v1.Modules.ItemImageFinder)
local v_u_7 = require(v1.Modules.ItemNameFinder)
local v_u_8 = v1.GameEvents.TradeEvents.Booths.AddToHistory
local v_u_9 = v_u_2.LocalPlayer
local v_u_10 = v_u_9.PlayerGui.TradeBoothHistory
local v_u_11 = v_u_10.Frame.Close
local v_u_12 = v_u_10.Frame.Sort
local v_u_13 = v_u_10.Frame.SearchFrame.SearchBox
local v_u_14 = v_u_10.Frame.ScrollingFrame
local v_u_15 = v1.Modules.TradeBoothControllers.TradeBoothUITemplates.BoothHistoryTemplate
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = {}
local v_u_19 = {}
local v_u_20 = 0
local v_u_21 = workspace:GetServerTimeNow() - 2592000
local v_u_22 = Enum.ThumbnailType.HeadShot
local v_u_23 = Enum.ThumbnailSize.Size420x420
local v_u_24 = { "All", "Purchases", "Sales" }
local v_u_25 = { "Asc", "Desc" }
local v_u_26 = 1
local v_u_27 = 1
local v28 = {}
local function v_u_41(p29)
	-- upvalues: (copy) v_u_18, (copy) v_u_15, (copy) v_u_19, (ref) v_u_20, (copy) v_u_9, (copy) v_u_2, (copy) v_u_22, (copy) v_u_23, (copy) v_u_7, (copy) v_u_6, (copy) v_u_14
	local v30 = p29.id
	local v31 = v_u_18[v30]
	if not v31 then
		local v32 = v_u_15:Clone()
		v_u_19[v30] = p29
		v_u_20 = v_u_20 + 1
		v_u_18[v30] = v32
		v31 = v_u_18[v30]
	end
	local v33 = v_u_9.UserId == p29.seller.userId
	local v34 = v31.Spacer.Title
	local v35 = v34.Label
	if p29.status.result == "Failed" then
		v35.Text = "Failed"
	else
		v35.Text = v33 and "Sold" or "Purchased"
	end
	local v36
	if v33 then
		v36 = Color3.fromRGB(255, 52, 52)
	else
		v36 = Color3.fromRGB(53, 255, 66)
	end
	v35.TextColor3 = v36
	local v37 = v34.PlrName
	local v38
	if v33 then
		v38 = p29.buyer.username
	else
		v38 = p29.seller.username
	end
	v37.Text = v38
	local v39
	if v33 then
		v39 = p29.buyer.userId
	else
		v39 = p29.seller.userId
	end
	v34.Frame.Headshot.Image = v_u_2:GetUserThumbnailAsync(v39, v_u_22, v_u_23)
	if p29.item.data then
		local v40
		if p29.item.data.ItemData then
			v40 = p29.item.data.ItemData.ItemName
		else
			v40 = p29.item.data.PetType or (p29.item.data.SkinID or "")
		end
		v31.Spacer.ItemName.Text = v_u_7(v40, p29.item.type)
		v31.Spacer.Time.Text = ("%*"):format((os.date("%I:%M %p (%x)", p29.finishTime)))
		v31.Spacer.Price.Amount.Text = ("%*"):format(p29.price)
		v31.Spacer.Item.ITEM_IMAGE.Image = v_u_6(v40, p29.item.type)
		v31.Parent = v_u_14
		v31.Visible = true
	else
		warn("Missing log item data?", p29)
	end
end
local function v_u_48()
	-- upvalues: (copy) v_u_5, (copy) v_u_21, (ref) v_u_20, (copy) v_u_41
	local v42, v43 = v_u_5:FetchBoothHistory()
	if not v42 then
		warn("Failed to find booth history on load.")
		v43 = {}
	end
	local v44 = table.clone(v43)
	table.sort(v44, function(p45, p46)
		return p45.finishTime > p46.finishTime
	end)
	for _, v47 in v44 do
		if v47.status.result ~= "Failed" and (v47.seller and (v47.buyer and v47.finishTime >= v_u_21)) then
			if v_u_20 > 50 then
				break
			end
			v_u_41(v47)
		end
	end
end
local function v_u_63()
	-- upvalues: (copy) v_u_24, (ref) v_u_26, (copy) v_u_19, (copy) v_u_9, (copy) v_u_18, (ref) v_u_17, (copy) v_u_25, (ref) v_u_27
	local v49 = v_u_24[v_u_26]
	local v50 = {}
	for _, v51 in v_u_19 do
		local v52 = v_u_9.UserId == v51.seller.userId
		local v53 = {
			["Log"] = v51,
			["UI"] = v_u_18[v51.id]
		}
		v_u_18[v51.id].Visible = false
		if v49 == "Purchases" and not v52 then
			v_u_18[v51.id].Visible = true
		elseif v49 == "Sales" and v52 then
			v_u_18[v51.id].Visible = true
		elseif v49 == "All" then
			v_u_18[v51.id].Visible = true
		end
		if #v_u_17 > 0 then
			local v54 = string.find(string.lower(v51.seller.username), v_u_17)
			local v55 = string.find(string.lower(v51.buyer.username), v_u_17)
			local v56
			if v51.item.data.ItemData then
				v56 = v51.item.data.ItemData.ItemName
			else
				v56 = v51.item.data.PetType or ""
			end
			if v54 or (v55 or string.find(string.lower(v56), v_u_17)) then
				table.insert(v50, v53)
			else
				v_u_18[v51.id].Visible = false
			end
		else
			table.insert(v50, v53)
		end
	end
	if v_u_25[v_u_27] == "Desc" then
		table.sort(v50, function(p57, p58)
			return p57.Log.finishTime < p58.Log.finishTime
		end)
	else
		table.sort(v50, function(p59, p60)
			return p59.Log.finishTime > p60.Log.finishTime
		end)
	end
	for v61, v62 in v50 do
		v62.UI.LayoutOrder = v61
	end
end
function v28.Start(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_3, (copy) v_u_10, (ref) v_u_16, (copy) v_u_13, (ref) v_u_17, (copy) v_u_63, (copy) v_u_8, (copy) v_u_41, (copy) v_u_25, (ref) v_u_27, (copy) v_u_12, (ref) v_u_26, (copy) v_u_24, (copy) v_u_48
	if v_u_4:IsInWorld() then
		v_u_11.Activated:Connect(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_10, (ref) v_u_16
			v_u_3:Close(v_u_10)
			if v_u_16 then
				v_u_3:Open(v_u_16)
				v_u_16 = nil
			end
		end)
		v_u_13:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_13, (ref) v_u_63
			v_u_17 = string.lower(v_u_13.Text)
			v_u_63()
		end)
		v_u_3:GetStateForGui(v_u_10).Visible:Observe(function(p64)
			-- upvalues: (ref) v_u_17, (ref) v_u_13
			if not p64 then
				v_u_17 = ""
				v_u_13.Text = v_u_17
			end
		end)
		v_u_8.OnClientEvent:Connect(function(p65)
			-- upvalues: (ref) v_u_41
			v_u_41(p65)
		end)
		local v66 = v_u_25[v_u_27]
		v_u_10.Frame.Sort.Vector.Rotation = v66 == "Asc" and 180 or 0
		v_u_12.Activated:Connect(function()
			-- upvalues: (ref) v_u_27, (ref) v_u_26, (ref) v_u_24, (ref) v_u_25, (ref) v_u_63, (ref) v_u_10
			if v_u_27 == 2 then
				local v67 = (v_u_26 + 1) % (#v_u_24 + 1)
				v_u_26 = math.max(v67, 1)
			end
			local v68 = (v_u_27 + 1) % (#v_u_25 + 1)
			v_u_27 = math.max(v68, 1)
			v_u_63()
			local v69 = v_u_24[v_u_26]
			local v70 = v_u_25[v_u_27]
			v_u_10.Frame.Sort.Label.Text = ("%*"):format(v69)
			v_u_10.Frame.Sort.Vector.Rotation = v70 == "Asc" and 180 or 0
		end)
		v_u_48()
		v_u_63()
	end
end
task.spawn(v28.Start, v28)
return v28