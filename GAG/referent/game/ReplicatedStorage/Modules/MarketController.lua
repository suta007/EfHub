local v_u_1 = game:GetService("MarketplaceService")
local v_u_2 = game:GetService("ReplicatedStorage")
game:GetService("SoundService")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("Players")
local v_u_5 = require(v_u_2.Modules.Notification)
local v_u_6 = require(v_u_2.Modules.RetryPcall)
local v_u_7 = require(v_u_2.Modules.Observers)
require(v_u_2.Modules.DataService)
local v_u_8 = require(v_u_2.Comma_Module)
local v9 = require(v_u_2.Modules.Signal)
require(v_u_2.Modules.IsDev)
local v_u_10 = require(v_u_2.Modules.NotifisController)
local v_u_11 = require(v_u_2.Modules.UpdateService)
require(v_u_2.Data.TradeTokenData)
local v_u_12 = v4.LocalPlayer
local v_u_13 = v_u_12.PlayerGui
local v_u_14 = {
	["PromptProductPurchaseInitiated"] = v9.new(),
	["ScreenBlur"] = Instance.new("BlurEffect"),
	["ScreenCover"] = Instance.new("ScreenGui"),
	["CoverFrame"] = Instance.new("Frame")
}
local v_u_15 = {}
local function v_u_25(p16)
	-- upvalues: (copy) v_u_14, (copy) v_u_8
	if p16:IsA("ProximityPrompt") then
		p16.ObjectText = "???"
	else
		p16.Text = "???"
	end
	local v17 = p16:GetAttribute("ProductId")
	if v17 == nil then
		return
	else
		local v18, v19 = v_u_14:GetProductInfo(v17, Enum.InfoType.Product)
		if v18 then
			local v20 = p16:GetAttribute("Format") or ":robux::value:"
			local v21 = string.gsub(v20, ":robux:", "\238\128\130")
			local v22 = string.gsub(v21, ":value:", v_u_8.Comma(v19.PriceInRobux))
			local v23 = string.gsub(v22, ":valueusd:", v_u_14:GetDisplayInUSD(v19.PriceInRobux))
			local v24 = string.gsub(v23, ":rawvalue:", v19.PriceInRobux)
			if p16:IsA("ProximityPrompt") then
				p16.ObjectText = v24
			else
				p16.Text = v24
			end
		elseif p16:IsA("ProximityPrompt") then
			p16.ObjectText = "Failed to load"
		else
			p16.Text = "Failed to load"
		end
	end
end
local function v_u_30(p26)
	-- upvalues: (copy) v_u_15, (copy) v_u_25
	for _, v27 in v_u_15 do
		if v27.instance == p26 then
			return
		end
	end
	local v28
	if p26:IsA("TextLabel") or p26:IsA("TextButton") then
		v28 = p26:FindFirstAncestorWhichIsA("LayerCollector")
	else
		v28 = nil
	end
	if v28 and not v28.Enabled then
		local v29 = v_u_15
		table.insert(v29, {
			["screenGui"] = v28,
			["instance"] = p26
		})
	else
		task.spawn(v_u_25, p26)
	end
end
local function v_u_33(p31)
	-- upvalues: (copy) v_u_15
	for v32 = #v_u_15, 1, -1 do
		if v_u_15[v32].instance == p31 then
			table.remove(v_u_15, v32)
		end
	end
end
local v_u_34 = {}
local v_u_35 = 0
function v_u_14.GetProductInfo(_, p_u_36, p_u_37, p38)
	-- upvalues: (copy) v_u_34, (ref) v_u_35, (copy) v_u_6, (copy) v_u_1
	while true do
		local v39 = v_u_34[tostring(p_u_36)]
		if not (v39 and v39.fetching) then
			break
		end
		task.wait(1)
	end
	local v40 = v_u_34[tostring(p_u_36)]
	if v40 and (not v40.fetching and v40.success) then
		return true, v40.data
	end
	v_u_35 = v_u_35 + 1
	task.delay(60, function()
		-- upvalues: (ref) v_u_35
		v_u_35 = v_u_35 - 1
	end)
	while v_u_35 > 36 do
		task.wait(1)
	end
	v_u_34[tostring(p_u_36)] = {
		["fetching"] = true,
		["timestamp"] = workspace:GetServerTimeNow()
	}
	local v41, v42 = v_u_6(p38 or 10, 30, function()
		-- upvalues: (ref) v_u_1, (copy) p_u_36, (copy) p_u_37
		return v_u_1:GetProductInfo(p_u_36, p_u_37)
	end)
	if not v41 or v42 == nil then
		v_u_34[tostring(p_u_36)] = nil
		return false, nil
	end
	v_u_34[tostring(p_u_36)] = {
		["fetching"] = false,
		["timestamp"] = workspace:GetServerTimeNow(),
		["success"] = true,
		["data"] = v42
	}
	task.delay(180, function()
		-- upvalues: (ref) v_u_34, (copy) p_u_36
		local v43 = p_u_36
		v_u_34[tostring(v43)] = nil
	end)
	return true, v42
end
function v_u_14.CanPurchaseWithTokens(_, p44, _)
	-- upvalues: (copy) v_u_11, (copy) v_u_2
	if v_u_11:IsHiddenFromUpdate("Trade Tokens") then
		return false
	else
		return v_u_2.GameEvents.TradeEvents.TradeTokens.CanPurchase:InvokeServer(p44)
	end
end
function v_u_14.PromptPurchaseRobux(_, p45, p46)
	-- upvalues: (copy) v_u_14, (copy) v_u_5, (copy) v_u_2, (copy) v_u_12, (copy) v_u_1
	v_u_14:ToggleScreenBlur(true)
	if p46 == Enum.InfoType.Product then
		if workspace:GetAttribute("AllowFakePurchases") then
			v_u_5:CreateNotification((("Invoking fake purchase for \"%*\""):format(p45)))
			task.wait(0.5)
			v_u_2.GameEvents.Market.FakePurchase:FireServer(p45)
			task.wait(1)
			return
		elseif p45 == 0 then
			return
		elseif p45 then
			v_u_14.PromptProductPurchaseInitiated:Fire(v_u_12, p45)
			v_u_1:PromptProductPurchase(v_u_12, p45)
		end
	elseif p46 == Enum.InfoType.GamePass then
		if workspace:GetAttribute("AllowFakePurchases") then
			v_u_5:CreateNotification((("Invoking fake purchase for \"%*\""):format(p45)))
			task.wait(0.5)
			v_u_2.GameEvents.Market.FakePurchase:FireServer(p45)
			task.wait(1)
			return
		elseif p45 > 0 then
			v_u_1:PromptGamePassPurchase(v_u_12, p45)
		end
	elseif p46 == Enum.InfoType.Asset then
		v_u_1:PromptPurchase(v_u_12, p45)
	elseif p46 == Enum.InfoType.Bundle then
		v_u_1:PromptBundlePurchase(v_u_12, p45)
	end
end
function v_u_14.PromptPurchase(_, p_u_47, p_u_48)
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (copy) v_u_2, (copy) v_u_5
	local v49, v_u_50 = v_u_14:CanPurchaseWithTokens(p_u_47, p_u_48)
	if v49 then
		v_u_10:PromptPurchase(v_u_50.Name, v_u_50.PriceInRobux, function(p51)
			-- upvalues: (ref) v_u_14, (copy) p_u_47, (copy) p_u_48, (ref) v_u_2, (ref) v_u_10, (copy) v_u_50, (ref) v_u_5
			if p51 == "Robux" then
				v_u_14:PromptPurchaseRobux(p_u_47, p_u_48)
			elseif p51 == "Tokens" then
				local v52, v53 = v_u_2.GameEvents.TradeEvents.TradeTokens.Purchase:InvokeServer(p_u_47)
				if v52 then
					v_u_10:PurchaseCompleted(v_u_50.Name, v_u_50.PriceInRobux)
					return
				end
				if v53 then
					v_u_5:CreateNotification(v53)
				end
			end
		end)
	else
		v_u_14:PromptPurchaseRobux(p_u_47, p_u_48)
	end
end
function v_u_14.RemovePriceLabel(_, p54)
	p54:RemoveTag("PriceLabel")
end
function v_u_14.ConvertToUSD(_, p55)
	local v56 = p55 * 0.012375 * 100
	return math.ceil(v56) / 100
end
function v_u_14.GetDisplayInUSD(_, p57)
	-- upvalues: (copy) v_u_8, (copy) v_u_14
	return v_u_8.Comma(v_u_14:ConvertToUSD(p57)):gsub(",", ".")
end
function v_u_14.SetPriceLabel(_, p58, p59, p60)
	-- upvalues: (copy) v_u_30
	p58:SetAttribute("Format", p60 or ":robux::value:")
	p58:SetAttribute("ProductId", p59)
	p58:AddTag("PriceLabel")
	v_u_30(p58)
end
function v_u_14.ToggleScreenBlur(_, p61)
	-- upvalues: (copy) v_u_14, (copy) v_u_3
	local v62 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	if p61 then
		v_u_14.ScreenBlur.Size = 0
		v_u_14.ScreenBlur.Enabled = true
		v_u_14.CoverFrame.BackgroundTransparency = 1
		v_u_14.CoverFrame.Visible = true
		v_u_3:Create(v_u_14.ScreenBlur, v62, {
			["Size"] = 24
		}):Play()
		v_u_3:Create(v_u_14.CoverFrame, v62, {
			["BackgroundTransparency"] = 0.2
		}):Play()
	else
		v_u_14.ScreenBlur.Enabled = true
		v_u_14.CoverFrame.Visible = true
		v_u_3:Create(v_u_14.ScreenBlur, v62, {
			["Size"] = 0
		}):Play()
		v_u_3:Create(v_u_14.CoverFrame, v62, {
			["BackgroundTransparency"] = 1
		}):Play()
		task.delay(0.6, function()
			-- upvalues: (ref) v_u_14
			v_u_14.ScreenBlur.Enabled = false
			v_u_14.CoverFrame.Visible = false
		end)
	end
end
function v_u_14.Start(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_14, (copy) v_u_7, (copy) v_u_30, (copy) v_u_33, (copy) v_u_15, (copy) v_u_25, (copy) v_u_13, (copy) v_u_1
	v_u_2.GameEvents.Market.PromptPurchase.OnClientEvent:Connect(function(p63, p64)
		-- upvalues: (ref) v_u_14
		local v65 = nil
		if p63.type == 1 then
			v65 = Enum.InfoType.Product
		elseif p63.type == 2 then
			v65 = Enum.InfoType.GamePass
		elseif p63.type == 3 then
			v65 = Enum.InfoType.Asset
		elseif p63.type == 4 then
			v65 = Enum.InfoType.Bundle
		end
		if v65 then
			if p64 then
				v_u_14:PromptPurchaseRobux(p63.id, v65)
			else
				v_u_14:PromptPurchase(p63.id, v65)
			end
		else
			return
		end
	end)
	v_u_7.observeTag("PriceLabel", function(p_u_66)
		-- upvalues: (ref) v_u_7, (ref) v_u_30, (ref) v_u_33
		if p_u_66:IsA("TextButton") or (p_u_66:IsA("TextLabel") or p_u_66:IsA("ProximityPrompt")) then
			return v_u_7.observeAttribute(p_u_66, "ProductId", function(_)
				-- upvalues: (ref) v_u_30, (copy) p_u_66, (ref) v_u_33
				v_u_30(p_u_66)
				return function()
					-- upvalues: (ref) v_u_33, (ref) p_u_66
					v_u_33(p_u_66)
				end
			end)
		else
			return nil
		end
	end)
	local function v70(p_u_67)
		-- upvalues: (ref) v_u_15, (ref) v_u_25
		if p_u_67:IsA("LayerCollector") then
			p_u_67:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: (copy) p_u_67, (ref) v_u_15, (ref) v_u_25
				if p_u_67.Enabled then
					for v68 = #v_u_15, 1, -1 do
						local v69 = v_u_15[v68]
						if v69.screenGui == p_u_67 then
							task.spawn(v_u_25, v69.instance)
							table.remove(v_u_15, v68)
						end
					end
				end
			end)
		end
	end
	v_u_13.ChildAdded:Connect(v70)
	for _, v_u_71 in v_u_13:GetChildren() do
		if v_u_71:IsA("LayerCollector") then
			v_u_71:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: (copy) v_u_71, (ref) v_u_15, (ref) v_u_25
				if v_u_71.Enabled then
					for v72 = #v_u_15, 1, -1 do
						local v73 = v_u_15[v72]
						if v73.screenGui == v_u_71 then
							task.spawn(v_u_25, v73.instance)
							table.remove(v_u_15, v72)
						end
					end
				end
			end)
		end
	end
	v_u_14.ScreenBlur.Size = 0
	v_u_14.ScreenBlur.Enabled = false
	v_u_14.ScreenBlur.Parent = game:GetService("Lighting")
	v_u_14.CoverFrame.Size = UDim2.fromScale(2, 2)
	v_u_14.CoverFrame.Position = UDim2.fromScale(0.5, 0.5)
	v_u_14.CoverFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	v_u_14.CoverFrame.BackgroundColor3 = Color3.new(0, 0, 0)
	v_u_14.CoverFrame.BackgroundTransparency = 1
	v_u_14.CoverFrame.Visible = false
	v_u_14.CoverFrame.Parent = v_u_14.ScreenCover
	v_u_14.ScreenCover.DisplayOrder = 9999
	v_u_14.ScreenCover.Parent = v_u_13
	v_u_1.PromptGamePassPurchaseFinished:Connect(function()
		-- upvalues: (ref) v_u_14
		v_u_14:ToggleScreenBlur(false)
	end)
	v_u_1.PromptProductPurchaseFinished:Connect(function()
		-- upvalues: (ref) v_u_14
		v_u_14:ToggleScreenBlur(false)
	end)
	v_u_1.PromptPurchaseFinished:Connect(function()
		-- upvalues: (ref) v_u_14
		v_u_14:ToggleScreenBlur(false)
	end)
	v_u_1.PromptBundlePurchaseFinished:Connect(function()
		-- upvalues: (ref) v_u_14
		v_u_14:ToggleScreenBlur(false)
	end)
end
task.spawn(v_u_14.Start, v_u_14)
return v_u_14