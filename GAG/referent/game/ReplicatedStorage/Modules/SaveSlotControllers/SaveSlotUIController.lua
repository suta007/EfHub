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
local v_u_12 = require(v2.Modules.UpdateService)
local v_u_13 = v1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SaveSlotUI")
local v_u_14 = {
	["RenderedSlots"] = {},
	["State"] = false
}
local v_u_15 = v_u_14.RenderedSlots
local v_u_16 = v_u_13.Frame.Frame.Holder.Header.Exit.SENSOR
local v_u_17 = v_u_13.Frame.Frame.Holder.Main.ScrollingFrame
local v_u_18 = v_u_17.EasterSlotTemplate
v_u_18.Visible = false
local v_u_19 = v_u_17.SlotTemplate
v_u_19.Visible = false
function v_u_14.Toggle(_, p20)
	-- upvalues: (copy) v_u_14, (copy) v_u_7, (copy) v_u_13
	v_u_14.State = p20
	if p20 then
		v_u_7:Open(v_u_13)
	else
		v_u_7:Close(v_u_13)
	end
end
function v_u_14.RenderSlots(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_15, (copy) v_u_19, (copy) v_u_9, (copy) v_u_17, (copy) v_u_12, (copy) v_u_18, (copy) v_u_4, (copy) v_u_10
	local v21 = v_u_3:GetAllSlots()
	v_u_6(v21)
	local v22 = v_u_3:GetCurrentSaveSlot()
	local v23 = workspace:GetServerTimeNow() // 1
	for v_u_24, v25 in v21 do
		if v_u_24 ~= "EASTER_2026" then
			local v26 = v_u_15[v_u_24]
			if not v26 then
				v26 = v_u_19:Clone()
				v_u_15[v_u_24] = v26
				v26.Main.Buttons.Load.SENSOR.Activated:Connect(function()
					-- upvalues: (ref) v_u_3, (copy) v_u_24
					v_u_3:ChangeSlots(v_u_24)
				end)
				local v27 = v26.Main.TextInstances
				local v28 = v27.TextLabel
				local v29 = v27.TextLabel1
				local v30 = v23 - v25.LastSaveTime or 0
				v29.Text = ("Last Loaded: %*"):format((v30 <= 2 or not v30) and "now" or ("%* Ago"):format((v_u_9:GenerateTextFromTime(v23 - v25.LastSaveTime, true))))
				v28.Text = v25.SlotName
				v26.Visible = true
				v26.Parent = v_u_17
			end
			if v26:FindFirstChild("Main") then
				local v31 = v26.Main.Buttons.Load
				local v32 = v25 == v22
				local v33 = v26.Main.Buttons.SelectedOverlay
				v31.Visible = not v32
				v33.Visible = v32
			end
		end
	end
	if not v_u_12:IsHiddenFromUpdate("Easter") then
		local v34 = v21.EASTER_2026
		if v_u_15.EASTER_2026 then
			v_u_15.EASTER_2026:Destroy()
			v_u_15.EASTER_2026 = nil
		end
		local v35 = v_u_18:Clone()
		v_u_15.EASTER_2026 = v35
		v35.Visible = true
		v35.Parent = v_u_17
		local v36 = v35.Main.TextInstances
		local v37 = v36.TextLabel
		local v38 = v36.TextLabel1
		local v39 = v35.Main.Buttons.Load
		local v40 = v35.Main.Buttons.SelectedOverlay
		if v34 then
			v37.Text = v34.SlotName
			local v41 = v23 - v34.LastSaveTime
			v38.Text = ("Last Loaded: %*"):format((v41 <= 2 or not v41) and "now" or ("%* Ago"):format((v_u_9:GenerateTextFromTime(v41, true))))
			local v42 = v34 == v22
			v39.Visible = not v42
			v40.Visible = v42
			v39.SENSOR.Activated:Connect(function()
				-- upvalues: (ref) v_u_3
				v_u_3:ChangeSlots("EASTER_2026")
			end)
		else
			v37.Text = "Easter 2026"
			v38.Text = "Limited Event Slot"
			v39.Visible = true
			v40.Visible = false
			v39.LOAD_BUTTON.Text = "Opt In"
			v39.SENSOR.Activated:Connect(function()
				-- upvalues: (ref) v_u_3
				v_u_3:OptInToEasterSlot()
			end)
		end
	end
	local v43 = 0
	for v44, _ in v21 do
		if v44 ~= "EASTER_2026" then
			v43 = v43 + 1
		end
	end
	local v45 = v43 + 1
	if v_u_3:HasPurchasedSlotFromAscension() and v43 < v_u_4.MAX_SLOTS then
		v45 = v45 - 1
	end
	if v_u_3:HasPurchasedSlotFromAscension() or v43 ~= v_u_4.MAX_SLOTS - 1 then
		local v46 = ("$%*"):format((v_u_10.FormatCompactPrice(v_u_4.PRICES[v45] or -1)))
		v_u_17.SlotPurchaseTemplate.Main.TextInstances.TextLabel1.Text = ("%* or <font color=\"#26ff26\">399</font>"):format(v46)
		v_u_17.SlotPurchaseTemplate.Main.Buttons.Purchase.LOAD_BUTTON.Text = v46
		v_u_17.SlotPurchaseTemplate.Visible = v43 < v_u_4.MAX_SLOTS
	else
		v_u_17.SlotPurchaseTemplate.Visible = false
	end
end
function v_u_14.UpdateTime(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_15, (copy) v_u_9
	local v47 = v_u_3:GetAllSlots()
	local v48 = workspace:GetServerTimeNow()
	for v49, v50 in v47 do
		local v51 = v_u_15[v49]
		if v51 then
			local v52 = v51.Main.TextInstances.TextLabel1
			local v53 = v48 - v50.LastSaveTime
			v52.Text = ("Last Loaded: %*"):format((v53 <= 2 or not v53) and "now" or ("%* Ago"):format((v_u_9:GenerateTextFromTime(v48 - v50.LastSaveTime, true))))
		end
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_14
	while true do
		v_u_14:UpdateTime()
		task.wait(1)
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_13, (copy) v_u_5, (copy) v_u_17, (copy) v_u_11, (copy) v_u_14, (copy) v_u_16, (copy) v_u_8, (copy) v_u_3, (copy) v_u_12
	v_u_7:UsePopupAnims(v_u_13)
	local v_u_54 = v_u_7:GetStateForGui(v_u_13)
	v_u_5:SetPriceLabel(v_u_17.SlotPurchaseTemplate.Main.Buttons.PurchaseRobux.LOAD_BUTTON, v_u_11.SaveSlotPurchase.PurchaseID, "<font weight=\"200\">:robux:</font>:value:")
	v_u_5:SetPriceLabel(v_u_17.SlotPurchaseTemplate.Main.TextInstances.TextLabel1, v_u_11.SaveSlotPurchase.PurchaseID, "$25B or <font color=\"#26ff26\">:robux::value:</font>")
	v_u_54.Visible:Observe(function(p55)
		-- upvalues: (ref) v_u_14
		v_u_14.State = p55
		if p55 then
			v_u_14:RenderSlots()
		end
	end)
	v_u_16.Activated:Connect(function()
		-- upvalues: (ref) v_u_14
		v_u_14:Toggle(false)
	end)
	local v56 = v_u_8
	assert(v56:GetPathSignal("SaveSlots/@")):Connect(function()
		-- upvalues: (copy) v_u_54, (ref) v_u_14
		if v_u_54.Visible:Get() then
			v_u_14:RenderSlots()
		end
	end)
	v_u_17.SlotPurchaseTemplate.Main.Buttons.Purchase.SENSOR.Activated:Connect(function()
		-- upvalues: (ref) v_u_3
		v_u_3:PurchaseSlot()
	end)
	v_u_17.SlotPurchaseTemplate.Main.Buttons.PurchaseRobux.SENSOR.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_5
		v_u_5:PromptPurchase(v_u_11.SaveSlotPurchase.PurchaseID, Enum.InfoType.Product)
	end)
	v_u_12.OnUpdated:Connect(function()
		-- upvalues: (ref) v_u_14
		v_u_14:RenderSlots()
	end)
end)
return v_u_14