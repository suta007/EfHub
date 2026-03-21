local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.SaveSlotControllers.SaveSlotController)
local v_u_4 = require(v2.Data.SaveSlotConfigData)
local v_u_5 = require(v2.Modules.MarketController)
local v_u_6 = require(v2.Modules.CountDictionary)
local v_u_7 = require(v2.Modules.GuiController)
local v_u_8 = require(v2.Modules.DataService)
require(v2.Comma_Module)
local v_u_9 = require(v2.Modules.TimeHelper)
local v_u_10 = require(v2.Modules.NumberUtil)
local v_u_11 = require(v2.Data.DevProductIds)
local v_u_12 = v1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SaveSlotUI")
local v_u_13 = {
	["RenderedSlots"] = {},
	["State"] = false
}
local v_u_14 = v_u_13.RenderedSlots
local v_u_15 = v_u_12.Frame.Frame.Holder.Header.Exit.SENSOR
local v_u_16 = v_u_12.Frame.Frame.Holder.Main.ScrollingFrame
local v_u_17 = v_u_16.SlotTemplate
v_u_17.Visible = false
function v_u_13.Toggle(_, p18)
	-- upvalues: (copy) v_u_13, (copy) v_u_7, (copy) v_u_12
	v_u_13.State = p18
	if p18 then
		v_u_7:Open(v_u_12)
	else
		v_u_7:Close(v_u_12)
	end
end
function v_u_13.RenderSlots(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_14, (copy) v_u_17, (copy) v_u_9, (copy) v_u_16, (copy) v_u_4, (copy) v_u_10
	local v19 = v_u_3:GetAllSlots()
	local v20 = v_u_6(v19)
	local v21 = v_u_3:GetCurrentSaveSlot()
	local v22 = workspace:GetServerTimeNow() // 1
	for v_u_23, v24 in v19 do
		local v25 = v_u_14[v_u_23]
		if not v25 then
			v25 = v_u_17:Clone()
			v_u_14[v_u_23] = v25
			v25.Main.Buttons.Load.SENSOR.Activated:Connect(function()
				-- upvalues: (ref) v_u_3, (copy) v_u_23
				v_u_3:ChangeSlots(v_u_23)
			end)
			local v26 = v25.Main.TextInstances
			local v27 = v26.TextLabel
			local v28 = v26.TextLabel1
			local v29 = v22 - v24.LastSaveTime or 0
			v28.Text = ("Last Loaded: %*"):format((v29 <= 2 or not v29) and "now" or ("%* Ago"):format((v_u_9:GenerateTextFromTime(v22 - v24.LastSaveTime, true))))
			v27.Text = v24.SlotName
			v25.Visible = true
			v25.Parent = v_u_16
		end
		if v25:FindFirstChild("Main") then
			local v30 = v25.Main.Buttons.Load
			local v31 = v24 == v21
			local v32 = v25.Main.Buttons.SelectedOverlay
			v30.Visible = not v31
			v32.Visible = v31
		end
	end
	local v33 = v20 + 1
	if v_u_3:HasPurchasedSlotFromAscension() and v20 < v_u_4.MAX_SLOTS then
		v33 = v33 - 1
	end
	if v_u_3:HasPurchasedSlotFromAscension() or v20 ~= v_u_4.MAX_SLOTS - 1 then
		local v34 = ("$%*"):format((v_u_10.FormatCompactPrice(v_u_4.PRICES[v33] or -1)))
		v_u_16.SlotPurchaseTemplate.Main.TextInstances.TextLabel1.Text = ("%* or <font color=\"#26ff26\">\238\128\130399</font>"):format(v34)
		v_u_16.SlotPurchaseTemplate.Main.Buttons.Purchase.LOAD_BUTTON.Text = v34
		v_u_16.SlotPurchaseTemplate.Visible = v20 < v_u_4.MAX_SLOTS
	else
		v_u_16.SlotPurchaseTemplate.Visible = false
	end
end
function v_u_13.UpdateTime(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_14, (copy) v_u_9
	local v35 = v_u_3:GetAllSlots()
	local v36 = workspace:GetServerTimeNow()
	for v37, v38 in v35 do
		local v39 = v_u_14[v37]
		if v39 then
			local v40 = v39.Main.TextInstances
			local _ = v40.TextLabel
			local v41 = v40.TextLabel1
			local v42 = v36 - v38.LastSaveTime
			v41.Text = ("Last Loaded: %*"):format((v42 <= 2 or not v42) and "now" or ("%* Ago"):format((v_u_9:GenerateTextFromTime(v36 - v38.LastSaveTime, true))))
		end
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_13
	while true do
		v_u_13:UpdateTime()
		task.wait(1)
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (copy) v_u_5, (copy) v_u_16, (copy) v_u_11, (copy) v_u_13, (copy) v_u_15, (copy) v_u_8, (copy) v_u_3
	v_u_7:UsePopupAnims(v_u_12)
	local v_u_43 = v_u_7:GetStateForGui(v_u_12)
	v_u_5:SetPriceLabel(v_u_16.SlotPurchaseTemplate.Main.Buttons.PurchaseRobux.LOAD_BUTTON, v_u_11.SaveSlotPurchase.PurchaseID, "<font weight=\"200\">:robux:</font>:value:")
	v_u_5:SetPriceLabel(v_u_16.SlotPurchaseTemplate.Main.TextInstances.TextLabel1, v_u_11.SaveSlotPurchase.PurchaseID, "$25B or <font color=\"#26ff26\">:robux::value:</font>")
	v_u_43.Visible:Observe(function(p44)
		-- upvalues: (ref) v_u_13
		v_u_13.State = p44
		if p44 then
			v_u_13:RenderSlots()
		end
	end)
	v_u_15.Activated:Connect(function()
		-- upvalues: (ref) v_u_13
		v_u_13:Toggle(false)
	end)
	local v45 = v_u_8
	assert(v45:GetPathSignal("SaveSlots/@")):Connect(function()
		-- upvalues: (copy) v_u_43, (ref) v_u_13
		if v_u_43.Visible:Get() then
			v_u_13:RenderSlots()
		end
	end)
	v_u_16.SlotPurchaseTemplate.Main.Buttons.Purchase.SENSOR.Activated:Connect(function()
		-- upvalues: (ref) v_u_3
		v_u_3:PurchaseSlot()
	end)
	v_u_16.SlotPurchaseTemplate.Main.Buttons.PurchaseRobux.SENSOR.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_5
		v_u_5:PromptPurchase(v_u_11.SaveSlotPurchase.PurchaseID, Enum.InfoType.Product)
	end)
end)
return v_u_13